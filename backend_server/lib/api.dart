import 'dart:async';

import 'package:backend_server/api_models.dart';
import 'package:backend_server/table_queries.sql.dart' as db;
import 'package:leto_schema/leto_schema.dart';
import 'package:typesql/typesql.dart';
import 'package:oxidized/oxidized.dart';

part 'api.g.dart';

// this annotations is only necessary for code generation
@GraphQLObject()
class Model {
  final String state;
  final DateTime createdAt;

  const Model(this.state, this.createdAt);
}

final ScopedRef<SqlExecutor> dbExecutorRef =
    ScopedRef.global((ctx) => throw Exception('Not implemented'));

final ScopedRef<db.TableQueriesQueries> dbRef =
    ScopedRef.global((ctx) => db.TableQueriesQueries(dbExecutorRef.get(ctx)));

@ClassResolver()
class UserController {
  UserController({
    required this.queries,
  });
  final db.TableQueriesQueries queries;
  SqlTypedController<db.Users, db.UsersUpdate> get controller =>
      queries.usersController;

  static final ScopedRef<UserController> ref = ScopedRef.global(
    (ctx) => UserController(queries: dbRef.get(ctx)),
  );

  @Mutation()
  Future<User> registerUser(String name) async {
    final inserted =
        await controller.insertReturning(db.UsersInsert(name: name));
    return User(id: inserted.id, name: inserted.name);
  }
}

@ClassResolver()
class PollController {
  PollController({
    required this.queries,
  });
  final db.TableQueriesQueries queries;
  SqlTypedController<db.PollOptionVote, db.PollOptionVoteUpdate>
      get voteController => queries.pollOptionVoteController;
  SqlTypedController<db.Poll, db.PollUpdate> get controller =>
      queries.pollController;
  SqlTypedController<db.PollOption, db.PollOptionUpdate> get optionController =>
      queries.pollOptionController;

  static final ScopedRef<PollController> ref = ScopedRef.global(
    (ctx) => PollController(queries: dbRef.get(ctx)),
  );

  @Query()
  Future<List<Poll>> getPolls(
    int? id,
    int? userId,
  ) async {
    final polls = await controller
        .selectMany(FilterEq(db.PollUpdate(id: id, userId: userId)));
    return polls.map(Poll.fromDB).toList(growable: false);
  }

  @Mutation()
  Future<Poll> insertPoll(PollInsert insert) async {
    final inserted = await controller.insertReturning(insert.toDB());
    final options = insert.options;
    if (options != null && options.isNotEmpty) {
      return addPollOptions(inserted.id, options);
    }
    return Poll.fromDB(inserted);
  }

  @Mutation()
  Future<Poll> addPollOptions(
    int pollId,
    List<PollOptionInsert> options,
  ) async {
    final poll = await controller.selectUnique(db.PollKeyId(id: pollId));
    if (poll == null) {
      throw Exception('Poll not found');
    }
    await optionController.insertManyReturning(
        options.map((e) => e.toDB(pollId)).toList(growable: false));
    return Poll.fromDB(
      poll,
      // TODO: send precomputed options
      // options: inserted.map(PollOption.fromDB).toList(growable: false),
    );
  }

  @Mutation()
  Future<Result<int, String>> votePoll(
    int pollId,
    List<PollOptionVoteInsert> votes,
  ) async {
    final inserted = await voteController.insertManyReturning(
        votes.map((e) => e.toDB()).toList(growable: false));
    return Ok(inserted.length);
  }
}

/// Set up your state.
/// This could be anything such as a database connection.
///
/// Global means that there will only be one instance of [ModelController]
/// for this reference. As opposed to [ScopedRef.local] where there will be
/// one [ModelController] for each request (for saving user information
/// or a [DataLoader], for example).
final stateRef = ScopedRef<ModelController>.global(
  (scope) => ModelController(
    Model('InitialState', DateTime.now()),
  ),
);

class ModelController {
  Model? _value;
  Model? get value => _value;

  final _streamController = StreamController<Model>.broadcast();
  Stream<Model> get stream => _streamController.stream;

  ModelController(this._value);

  void setValue(Model newValue) {
    if (newValue.state == 'InvalidState') {
      // This will appear as an GraphQLError in the response.
      // You can pass more information using custom extensions.
      throw GraphQLError(
        "Can't be in InvalidState.",
        extensions: {'errorCodeExtension': 'INVALID_STATE'},
      );
    }
    _value = newValue;
    _streamController.add(newValue);
  }
}

/// Get the current state
@Query()
Model? getState(Ctx ctx) {
  return stateRef.get(ctx).value;
}

@Mutation()
bool setState(
  Ctx ctx,
  // The new state, can't be 'WrongState'!.
  String newState,
) {
  if (newState == 'WrongState') {
    return false;
  }

  stateRef.get(ctx).setValue(Model(newState, DateTime.now()));
  return true;
}

@Subscription()
Stream<Model> onStateChange(Ctx ctx) {
  return stateRef.get(ctx).stream;
}

// TODO: Result, ResultU and custom types
final _resultGraphQLTypes = <String, GraphQLObjectType<Result>>{};

GraphQLObjectType<Result<T, T2>>
    resultGraphQLType<T extends Object, T2 extends Object>(
  GraphQLType<T, Object> t1,
  GraphQLType<T2, Object> t2, {
  String? name,
}) {
  final t1Inner = t1.nullable();
  final t2Inner = t2.nullable();
  final name_ =
      name ?? 'Result${t1Inner.printableName}${t2Inner.printableName}';
  if (_resultGraphQLTypes.containsKey(name_)) {
    return _resultGraphQLTypes[name_]! as GraphQLObjectType<Result<T, T2>>;
  }

  final type = objectType<Result<T, T2>>(
    name_,
    description: '$t1 when the operation was successful or'
        ' $t2 when an error was encountered.',
  );
  _resultGraphQLTypes[name_] = type;

  type.fields.addAll([
    t1Inner.field(
      'ok',
      resolve: (result, ctx) => result.isOk() ? result.unwrap() : null,
    ),
    t2Inner.field(
      'err',
      resolve: (result, ctx) => result.isOk() ? null : result.unwrapErr(),
    ),
    graphQLBoolean.nonNull().field(
          'isOk',
          resolve: (result, ctx) => result.isOk(),
        ),
  ]);
  return type;
}
