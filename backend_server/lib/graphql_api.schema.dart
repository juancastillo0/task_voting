// ignore: depend_on_referenced_packages
import 'package:leto_schema/leto_schema.dart';
import 'package:backend_server/api.dart';
import 'package:backend_server/api_models.dart';

GraphQLSchema recreateGraphQLApiSchema() {
  HotReloadableDefinition.incrementCounter();
  _graphqlApiSchema = null;
  return graphqlApiSchema;
}

GraphQLSchema? _graphqlApiSchema;
GraphQLSchema get graphqlApiSchema => _graphqlApiSchema ??= GraphQLSchema(
      serdeCtx: SerdeCtx()
        ..addAll([
          pollOptionSerializer,
          pollInsertSerializer,
          pollOptionVoteInsertSerializer,
          pollOptionInsertSerializer,
        ])
        ..children.addAll([]),
      queryType: objectType(
        'Query',
        fields: [
          getStateGraphQLField,
          getPollsGraphQLField,
        ],
      ),
      mutationType: objectType(
        'Mutation',
        fields: [
          setStateGraphQLField,
          registerUserGraphQLField,
          insertPollGraphQLField,
          addPollOptionsGraphQLField,
          votePollGraphQLField,
        ],
      ),
      subscriptionType: objectType(
        'Subscription',
        fields: [
          onStateChangeGraphQLField,
        ],
      ),
    );
