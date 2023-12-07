// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

GraphQLObjectField<List<Poll>, Object?, Object?> get getPollsGraphQLField =>
    _getPollsGraphQLField.value;
final _getPollsGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<List<Poll>, Object?, Object?>>(
        (setValue) =>
            setValue(pollGraphQLType.nonNull().list().nonNull().field<Object?>(
              'getPolls',
              resolve: (obj, ctx) {
                final args = ctx.args;

                final _call = (PollController r) =>
                    r.getPolls((args["id"] as int?), (args["userId"] as int?));
                final FutureOr<PollController> _obj =
// ignore: unnecessary_non_null_assertion
                    PollController.ref.get(ctx)!;
                if (_obj is Future<PollController>)
                  return _obj.then(_call);
                else
                  return _call(_obj);
              },
            ))
              ..inputs.addAll([
                graphQLInt.inputField('id'),
                graphQLInt.inputField('userId')
              ]));

GraphQLObjectField<Poll, Object?, Object?> get insertPollGraphQLField =>
    _insertPollGraphQLField.value;
final _insertPollGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<Poll, Object?, Object?>>(
        (setValue) => setValue(pollGraphQLType.nonNull().field<Object?>(
              'insertPoll',
              resolve: (obj, ctx) {
                final args = ctx.args;

                final _call = (PollController r) =>
                    r.insertPoll((args["insert"] as PollInsert));
                final FutureOr<PollController> _obj =
// ignore: unnecessary_non_null_assertion
                    PollController.ref.get(ctx)!;
                if (_obj is Future<PollController>)
                  return _obj.then(_call);
                else
                  return _call(_obj);
              },
            ))
              ..inputs.addAll(
                  [pollInsertGraphQLTypeInput.nonNull().inputField('insert')]));

GraphQLObjectField<Poll, Object?, Object?> get addPollOptionsGraphQLField =>
    _addPollOptionsGraphQLField.value;
final _addPollOptionsGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<Poll, Object?, Object?>>(
        (setValue) => setValue(pollGraphQLType.nonNull().field<Object?>(
              'addPollOptions',
              resolve: (obj, ctx) {
                final args = ctx.args;

                final _call = (PollController r) => r.addPollOptions(
                    (args["pollId"] as int),
                    (args["options"] as List<PollOptionInsert>));
                final FutureOr<PollController> _obj =
// ignore: unnecessary_non_null_assertion
                    PollController.ref.get(ctx)!;
                if (_obj is Future<PollController>)
                  return _obj.then(_call);
                else
                  return _call(_obj);
              },
            ))
              ..inputs.addAll([
                graphQLInt.nonNull().inputField('pollId'),
                pollOptionInsertGraphQLTypeInput
                    .nonNull()
                    .list()
                    .nonNull()
                    .inputField('options')
              ]));

GraphQLObjectField<Result<int, String>, Object?, Object?>
    get votePollGraphQLField => _votePollGraphQLField.value;
final _votePollGraphQLField = HotReloadableDefinition<
        GraphQLObjectField<Result<int, String>, Object?, Object?>>(
    (setValue) => setValue(resultGraphQLType<int, String>(
          graphQLInt.nonNull(),
          graphQLString.nonNull(),
        ).nonNull().field<Object?>(
          'votePoll',
          resolve: (obj, ctx) {
            final args = ctx.args;

            final _call = (PollController r) => r.votePoll(
                (args["pollId"] as int),
                (args["votes"] as List<PollOptionVoteInsert>));
            final FutureOr<PollController> _obj =
// ignore: unnecessary_non_null_assertion
                PollController.ref.get(ctx)!;
            if (_obj is Future<PollController>)
              return _obj.then(_call);
            else
              return _call(_obj);
          },
        ))
          ..inputs.addAll([
            graphQLInt.nonNull().inputField('pollId'),
            pollOptionVoteInsertGraphQLTypeInput
                .nonNull()
                .list()
                .nonNull()
                .inputField('votes')
          ]));

GraphQLObjectField<Model?, Object?, Object?> get getStateGraphQLField =>
    _getStateGraphQLField.value;
final _getStateGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<Model?, Object?, Object?>>(
        (setValue) => setValue(modelGraphQLType.field<Object?>(
              'getState',
              resolve: (obj, ctx) {
                final args = ctx.args;

                return getState(ctx);
              },
              description: 'Get the current state',
            )));

GraphQLObjectField<bool, Object?, Object?> get setStateGraphQLField =>
    _setStateGraphQLField.value;
final _setStateGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<bool, Object?, Object?>>(
        (setValue) => setValue(graphQLBoolean.nonNull().field<Object?>(
              'setState',
              resolve: (obj, ctx) {
                final args = ctx.args;

                return setState(ctx, (args["newState"] as String));
              },
            ))
              ..inputs.addAll([
                graphQLString.nonNull().inputField(
                      'newState',
                      description: 'The new state, can\'t be \'WrongState\'!.',
                    )
              ]));

GraphQLObjectField<Model, Object?, Object?> get onStateChangeGraphQLField =>
    _onStateChangeGraphQLField.value;
final _onStateChangeGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<Model, Object?, Object?>>(
        (setValue) => setValue(modelGraphQLType.nonNull().field<Object?>(
              'onStateChange',
              subscribe: (obj, ctx) {
                final args = ctx.args;

                return onStateChange(ctx);
              },
            )));

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final _modelGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<Model>>((setValue) {
  final __name = 'Model';

  final __modelGraphQLType = objectType<Model>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__modelGraphQLType);
  __modelGraphQLType.fields.addAll(
    [
      graphQLString.nonNull().field(
            'state',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.state,
          ),
      graphQLDate.nonNull().field(
            'createdAt',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.createdAt,
          ),
    ],
  );

  return __modelGraphQLType;
});

/// Auto-generated from [Model].
GraphQLObjectType<Model> get modelGraphQLType => _modelGraphQLType.value;
