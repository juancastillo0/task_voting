import 'dart:async';
import 'dart:convert' show jsonEncode, jsonDecode;
import 'dart:io' show HttpServer;

import 'package:backend_server/api.dart';
import 'package:backend_server/graphql_api.schema.dart';
import 'package:http/http.dart' as http;
import 'package:leto/leto.dart';
import 'package:leto_shelf/leto_shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' show Router;

Future<void> main() async {
  final server = await runServer();
  final url = Uri.parse('http://${server.address.host}:${server.port}/graphql');
  await testServer(url);
}

Future<HttpServer> runServer({int? serverPort, ScopedMap? globals}) async {
  // you can override state with ScopedMap.setGlobal/setScoped
  final ScopedMap scopedMap = globals ?? ScopedMap();
  if (globals == null) {
    // if it wasn't overridden it should be the default
    assert(stateRef.get(scopedMap).value?.state == 'InitialState');
  }
  // Instantiate the GraphQLSchema
  final schema = recreateGraphQLApiSchema();
  // Instantiate the GraphQL executor, you can pass extensions and
  // decide whether you want to introspect the schema
  // and validate the requests
  final letoGraphQL = GraphQL(
    schema,
    extensions: [],
    introspect: true,
    globalVariables: scopedMap,
  );

  final port =
      serverPort ?? const int.fromEnvironment('PORT', defaultValue: 8080);
  const graphqlPath = 'graphql';
  const graphqlSubscriptionPath = 'graphql-subscription';
  final endpoint = 'http://localhost:$port/$graphqlPath';
  final subscriptionEndpoint = 'ws://localhost:$port/$graphqlSubscriptionPath';

  // Setup server endpoints
  final app = Router();
  // GraphQL HTTP handler
  app.all(
    '/$graphqlPath',
    graphQLHttp(letoGraphQL),
  );
  // GraphQL WebSocket handler
  app.all(
    '/$graphqlSubscriptionPath',
    graphQLWebSocket(
      letoGraphQL,
      pingInterval: const Duration(seconds: 10),
      validateIncomingConnection: (
        Map<String, Object?>? initialPayload,
        GraphQLWebSocketShelfServer wsServer,
      ) {
        if (initialPayload != null) {
          // you can authenticated an user with the initialPayload:
          // final token = initialPayload['token']! as String;
          // ...
        }
        return true;
      },
    ),
  );

  // GraphQL schema and endpoint explorer web UI.
  // Available UI handlers: playgroundHandler, graphiqlHandler and altairHandler
  app.get(
    '/playground',
    playgroundHandler(
      config: PlaygroundConfig(
        endpoint: endpoint,
        subscriptionEndpoint: subscriptionEndpoint,
      ),
    ),
  );
  // Simple endpoint to download the GraphQLSchema as a SDL file.
  // $ curl http://localhost:8080/graphql-schema > schema.graphql
  const downloadSchemaOnOpen = true;
  const schemaFilename = 'schema.graphql';
  app.get('/graphql-schema', (Request request) {
    return Response.ok(
      schema.schemaStr,
      headers: {
        'content-type': 'text/plain',
        'content-disposition': downloadSchemaOnOpen
            ? 'attachment; filename="$schemaFilename"'
            : 'inline',
      },
    );
  });

  // Set up other shelf handlers such as static files

  // Start the server
  final server = await shelf_io.serve(
    const Pipeline()
        // Configure middlewares
        .addMiddleware(customLog(log: (msg) {
          // TODO: 2A detect an introspection query.
          //  Add more structured logs and headers
          if (!msg.contains('IntrospectionQuery')) {
            print(msg);
          }
        }))
        .addMiddleware(cors())
        .addMiddleware(etag())
        .addMiddleware(jsonParse())
        // Add Router handler
        .addHandler(app),
    '0.0.0.0',
    port,
  );
  print(
    'GraphQL Endpoint at $endpoint\n'
    'GraphQL Subscriptions at $subscriptionEndpoint\n'
    'GraphQL Playground UI at http://localhost:$port/playground',
  );

  return server;
}

/// For a complete GraphQL client you probably want to use
/// Ferry (https://github.com/gql-dart/ferry)
/// Artemis (https://github.com/comigor/artemis)
/// or raw GQL Links (https://github.com/gql-dart/gql/tree/master/links)
Future<void> testServer(Uri url) async {
  final before = DateTime.now();
  const newState = 'NewState';
  // POST request which sets the state
  final response = await http.post(
    url,
    body: jsonEncode({
      'query':
          r'mutation setState ($state: String!) { setState(newState: $state) }',
      'variables': {'state': newState}
    }),
    headers: {'content-type': 'application/json'},
  );
  assert(response.statusCode == 200);
  final body = jsonDecode(response.body) as Map<String, Object?>;
  final data = body['data']! as Map<String, Object?>;
  assert(data['setState'] == true);

  // Also works with GET
  final responseGet = await http.get(url.replace(
    queryParameters: <String, String>{
      'query': '{ getState { state createdAt } }'
    },
  ));
  assert(responseGet.statusCode == 200);
  final bodyGet = jsonDecode(responseGet.body) as Map<String, Object?>;
  final dataGet = bodyGet['data']! as Map<String, dynamic>;
  assert(dataGet['getState']['state'] == newState);
  final createdAt = DateTime.parse(dataGet['getState']['createdAt'] as String);
  assert(createdAt.isAfter(before));
  assert(createdAt.isBefore(DateTime.now()));

  // To test subscriptions you can open the playground web UI at /playground
  // or programmatically using https://github.com/gql-dart/gql/tree/master/links/gql_websocket_link,
  // an example can be found in test/mutation_and_subscription_test.dart
}
