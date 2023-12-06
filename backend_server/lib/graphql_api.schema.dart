// ignore: depend_on_referenced_packages
import 'package:leto_schema/leto_schema.dart';
import 'package:backend_server/api.dart';

GraphQLSchema recreateGraphQLApiSchema() {
  HotReloadableDefinition.incrementCounter();
  _graphqlApiSchema = null;
  return graphqlApiSchema;
}

GraphQLSchema? _graphqlApiSchema;
GraphQLSchema get graphqlApiSchema => _graphqlApiSchema ??= GraphQLSchema(
      serdeCtx: SerdeCtx()
        ..addAll([])
        ..children.addAll([]),
      queryType: objectType(
        'Query',
        fields: [
          getStateGraphQLField,
        ],
      ),
      mutationType: objectType(
        'Mutation',
        fields: [
          setStateGraphQLField,
        ],
      ),
      subscriptionType: objectType(
        'Subscription',
        fields: [
          onStateChangeGraphQLField,
        ],
      ),
    );
