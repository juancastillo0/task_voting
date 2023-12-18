import 'dart:async';
import 'dart:math';

import 'package:backend_server/api_models.dart';
import 'package:backend_server/table_queries.sql.dart' as db;
import 'package:leto_schema/leto_schema.dart';
import 'package:leto_shelf/leto_shelf.dart';
import 'package:typesql/typesql.dart';
import 'package:wasm_wit_component/wasm_wit_component.dart' show Result, Ok;

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

String _randomRefreshToken({int numChars = 64}) {
  const baseAlphabet = 'abcdefghijklmnopqrstuvwxyz';
  final alphabet = '$baseAlphabet${baseAlphabet.toUpperCase()}0123456789';
  final r = Random.secure();
  return List.generate(numChars, (_) => alphabet[r.nextInt(alphabet.length)])
      .join();
}

@GraphQLEnum()
enum PollPermission {
  OWNER,
  ADMIN,
  VOTER,
}

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
  Future<User> getUser({
    required Ctx ctx,
    String? name,
  }) async {
    db.Users found = await getAuthUser(ctx);
    if (name != null) {
      final updated = await controller.updateReturning(
        db.UsersKeyId(id: found.id),
        db.UsersUpdate(name: Some(name)),
      );
      found = updated ?? found;
    }
    return User.fromDB(found);
  }

  @Mutation()
  Future<User> registerUser(String? name) async {
    final refreshToken = _randomRefreshToken();
    final inserted = await controller.insertReturning(
        db.UsersInsert(name: name, refreshToken: refreshToken));
    return User.fromDB(inserted);
  }

  String getAuthHeader(Ctx ctx) {
    final authHeader = ctx.request.headers['authorization'];
    if (authHeader == null) {
      throwUnauthorized(ctx);
    }
    return authHeader;
  }

  Future<db.Users> getAuthUser(Ctx ctx) async {
    // TODO: save in ctx
    final authHeader = getAuthHeader(ctx);
    final found = await controller
        .selectUnique(db.UsersKeyRefreshToken(refreshToken: authHeader));
    if (found == null) {
      throwUnauthorized(ctx);
    }
    return found;
  }

  Never throwUnauthorized(Ctx ctx) {
    ctx.updateResponse((r) => Response(400));
    throw Exception('Unauthorized');
  }
}

@ClassResolver()
class PollController {
  PollController({
    required this.queries,
    required this.userController,
  });
  final db.TableQueriesQueries queries;
  final UserController userController;

  SqlTypedController<db.PollOptionVote, db.PollOptionVoteUpdate>
      get voteController => queries.pollOptionVoteController;
  SqlTypedController<db.Poll, db.PollUpdate> get controller =>
      queries.pollController;
  SqlTypedController<db.PollOption, db.PollOptionUpdate> get optionController =>
      queries.pollOptionController;

  static final ScopedRef<PollController> ref = ScopedRef.global(
    (ctx) => PollController(
      queries: dbRef.get(ctx),
      userController: UserController.ref.get(ctx),
    ),
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
  Future<OwnerPoll> insertPoll(Ctx ctx, PollInsert insert) async {
    // final db.Poll inserted;
    // if (insert.id != null) {
    //   final updated = await controller.updateReturning(
    //     db.PollKeyId(id: insert.id!),
    //     db.PollUpdate.fromJson(insert.toDB().toJson()),
    //   );
    //   if (updated == null) throw Exception('Poll not found');
    //   inserted = updated;
    // } else {
    //   inserted = await controller.insertReturning(insert.toDB());
    // }
    final user = await userController.getAuthUser(ctx);
    final isUpdate = insert.id != null;
    if (isUpdate) {
      await _pollUserWithAccess(
        ctx,
        userPoll:
            db.PollUsersKeyPollIdUserId(userId: user.id, pollId: insert.id!),
        canEdit: true,
      );
    }
    final dbPoll = insert.toDB(
      userId: user.id,
      adminShareToken: _randomRefreshToken(),
      voterShareToken: _randomRefreshToken(),
    );
    const ownerFields = [
      'userId',
      'adminShareToken',
      'voterShareToken',
    ];
    final inserted = await controller.upsertReturning(
      insert: dbPoll,
      update: db.PollUpdate.fromJson(
        dbPoll.toJson()..removeWhere((k, _) => ownerFields.contains(k)),
      ),
      getKey: (e) => e.id == null ? null : db.PollKeyId(id: e.id!),
    );
    if (!isUpdate) {
      await queries.pollUsersController.insertReturning(db.PollUsersInsert(
        userId: user.id,
        pollId: inserted.id,
        permission: PollPermission.OWNER.name,
      ));
    }
    final options = insert.options;
    if (options != null && options.isNotEmpty) {
      await _upsertOptions(inserted.id, options);
    }
    return OwnerPoll.fromDB(inserted);
  }

  Future<db.PollUsers> _pollUserWithAccess(
    Ctx ctx, {
    required db.PollUsersKeyPollIdUserId userPoll,
    required bool canEdit,
  }) async {
    final pollUser = await queries.pollUsersController.selectUnique(userPoll);
    final permissions = (canEdit
            ? const [PollPermission.OWNER, PollPermission.ADMIN]
            : const [
                PollPermission.OWNER,
                PollPermission.ADMIN,
                PollPermission.VOTER,
              ])
        .map((e) => e.name);
    if (pollUser == null || !permissions.contains(pollUser.permission)) {
      userController.throwUnauthorized(ctx);
    }
    return pollUser;
  }

  @Mutation()
  Future<OwnerPoll> addPollOptions(
    Ctx ctx,
    int pollId,
    List<PollOptionInsert> options,
  ) async {
    final user = await userController.getAuthUser(ctx);
    await _pollUserWithAccess(
      ctx,
      userPoll: db.PollUsersKeyPollIdUserId(pollId: pollId, userId: user.id),
      canEdit: true,
    );
    final poll = await controller.selectUnique(db.PollKeyId(id: pollId));
    if (poll == null) {
      throw Exception('Poll not found');
    }
    await _upsertOptions(pollId, options);
    return OwnerPoll.fromDB(
      poll,
      // TODO: send precomputed options
      // options: inserted.map(PollOption.fromDB).toList(growable: false),
    );
  }

  @Mutation()
  Future<Poll> accessPoll(Ctx ctx, String pollToken) async {
    final user = await userController.getAuthUser(ctx);

    final polls = await controller.selectMany(FilterOr([
      FilterEq(db.PollUpdate(voterShareToken: pollToken)),
      FilterEq(db.PollUpdate(adminShareToken: pollToken)),
    ]));
    if (polls.isEmpty) userController.throwUnauthorized(ctx);
    final poll = polls.fold(
        polls.first, (p, e) => e.adminShareToken == pollToken ? e : p);

    /// Previous state
    final key = db.PollUsersKeyPollIdUserId(pollId: poll.id, userId: user.id);
    final pollUser = await queries.pollUsersController.selectUnique(key);
    final permission = poll.adminShareToken == pollToken
        ? PollPermission.ADMIN.name
        : PollPermission.VOTER.name;
    if (pollUser != null) {
      if (pollUser.permission != permission) {
        await queries.pollUsersController.updateReturning(
          key,
          db.PollUsersUpdate(permission: permission),
        );
      }
    } else {
      await queries.pollUsersController.insertReturning(db.PollUsersInsert(
        userId: user.id,
        pollId: poll.id,
        permission: permission,
      ));
    }
    return Poll.fromDB(poll);
  }

  Future<List<db.PollOption>> _upsertOptions(
    int pollId,
    List<PollOptionInsert> options,
  ) {
    return optionController.upsertManyReturning(
      options.map((e) => e.toDB(pollId)).toList(growable: false),
      getUpdate: (e) => db.PollOptionUpdate.fromJson(e.toJson()),
      getKey: (e) => e.id == null ? null : db.PollOptionKeyId(id: e.id!),
    );
  }

  @Mutation()
  Future<Poll?> deletePoll(Ctx ctx, int pollId) async {
    final user = await userController.getAuthUser(ctx);
    final found = await controller.selectUnique(db.PollKeyId(id: pollId));
    if (found?.userId != user.id) userController.throwUnauthorized(ctx);

    final poll = await controller.updateReturning(
      db.PollKeyId(id: pollId),
      db.PollUpdate(deletedAt: Some(DateTime.now())),
    );
    return poll == null ? null : Poll.fromDB(poll);
  }

  @Mutation()
  Future<Result<int, String>> votePoll(
    Ctx ctx,
    int pollId,
    List<PollOptionVoteInsert> votes,
  ) async {
    final user = await userController.getAuthUser(ctx);
    await _pollUserWithAccess(
      ctx,
      userPoll: db.PollUsersKeyPollIdUserId(pollId: pollId, userId: user.id),
      canEdit: false,
    );
    final inserted = await voteController.upsertManyReturning(
      votes.map((e) => e.toDB()).toList(growable: false),
      getKey: (e) => db.PollOptionVoteKeyPollOptionIdUserId(
        pollOptionId: e.pollOptionId,
        userId: e.userId,
      ),
      // TODO: Option to update. Set null passed values in Update model not represented by the insert model.
      getUpdate: (e) => db.PollOptionVoteUpdate.fromJson(e.toJson()),
    );
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
      resolve: (result, ctx) => result.isOk ? result.unwrap() : null,
    ),
    t2Inner.field(
      'err',
      resolve: (result, ctx) => result.isOk ? null : result.unwrapErr(),
    ),
    graphQLBoolean.nonNull().field(
          'isOk',
          resolve: (result, ctx) => result.isOk,
        ),
  ]);
  return type;
}
