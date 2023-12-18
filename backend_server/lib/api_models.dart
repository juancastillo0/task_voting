import 'package:backend_server/api.dart';
import 'package:backend_server/table_queries.sql.dart' as db;
import 'package:leto_schema/leto_schema.dart';
import 'package:typesql/typesql.dart';

part 'api_models.g.dart';

typedef UserId = int;

@GraphQLObject()
class User {
  final int id;
  final String? name;
  final String refreshToken;
  const User({
    required this.id,
    required this.name,
    required this.refreshToken,
  });

  factory User.fromDB(db.Users u) => User(
        name: u.name,
        id: u.id,
        refreshToken: u.refreshToken,
      );

  Future<List<OwnerPoll>> polls(Ctx ctx) async => (await dbRef
          .get(ctx)
          .pollController
          .selectMany(FilterEq(db.PollUpdate(userId: id))))
      .map(OwnerPoll.fromDB)
      .toList(growable: false);

  Future<List<PollOptionVote>> votes(Ctx ctx) async => (await dbRef
          .get(ctx)
          .pollOptionVoteController
          .selectMany(FilterEq(db.PollOptionVoteUpdate(userId: id))))
      .map(PollOptionVote.fromDB)
      .toList(growable: false);

  Future<List<PollUser>> pollsWithVotes(Ctx ctx) async {
    final data =
        await dbRef.get(ctx).userWithVotes(db.UserWithVotesArgs(userId: id));
    final list = <int, PollUser>{};
    for (final p in data) {
      PollUser? poll = list[p.pollId];
      if (poll == null) {
        poll = PollUser(
          poll: Poll(
            id: p.pollId,
            userId: p.pollUserId,
            title: p.pollTitle,
            subtitle: p.pollSubtitle,
            body: p.pollBody,
            pollKind: p.pollPollKind,
            formJsonSchema: p.pollFormJsonSchema,
            createdAt: p.pollCreatedAt,
          ),
          userVotes: [],
          // TODO: options
        );
        list[p.pollId] = poll;
      }
      poll.userVotes.add(PollUserVote(
        option: PollOption(
          id: p.poId,
          pollId: p.poPollId,
          priority: p.poPriority,
          description: p.poDescription,
          url: p.poUrl,
          formJsonSchema: p.poFormJsonSchema,
          createdAt: p.poCreatedAt,
        ),
        vote: PollOptionVote(
          pollOptionId: p.povPollOptionId,
          userId: p.povUserId,
          value: p.povValue,
          formResponse: p.povFormResponse,
          createdAt: p.povCreatedAt,
        ),
      ));
    }
    return list.values.toList(growable: false);
  }
}

/// TODO: extends db.Poll

@GraphQLObject()
class Poll {
  final int id;
  final int userId;
  final String title;
  final String? subtitle;
  final String body;
  final String? pollKind;
  final String? formJsonSchema;
  final DateTime createdAt;
  final List<PollOption>? _options;

  const Poll({
    required this.id,
    required this.userId,
    required this.title,
    this.subtitle,
    required this.body,
    this.pollKind,
    this.formJsonSchema,
    required this.createdAt,
    List<PollOption>? options,
  }) : _options = options;

  factory Poll.fromDB(db.Poll v, {List<PollOption>? options}) {
    return Poll(
      id: v.id,
      userId: v.userId,
      title: v.title,
      subtitle: v.subtitle,
      body: v.body,
      pollKind: v.pollKind,
      formJsonSchema: v.formJsonSchema,
      createdAt: v.createdAt,
      options: options,
    );
  }

  Future<List<PollOption>> options(Ctx ctx) async =>
      _options ??
      (await dbRef
              .get(ctx)
              .pollOptionController
              .selectMany(FilterEq(db.PollOptionUpdate(pollId: id))))
          .map(PollOption.fromDB)
          .toList(growable: false);
}

@GraphQLObject()
class OwnerPoll {
  final Poll poll;
  final String adminShareToken;
  final String voterShareToken;

  const OwnerPoll({
    required this.poll,
    required this.adminShareToken,
    required this.voterShareToken,
  });

  factory OwnerPoll.fromDB(db.Poll v, {List<PollOption>? options}) {
    return OwnerPoll(
      poll: Poll.fromDB(v, options: options),
      adminShareToken: v.adminShareToken,
      voterShareToken: v.voterShareToken,
    );
  }

  Future<List<PollOptionVote>> votes(Ctx ctx) async =>
      (await dbRef.get(ctx).pollVotes(db.PollVotesArgs(pollId: poll.id)))
          .map((e) => db.PollOptionVote(
                createdAt: e.povCreatedAt,
                pollOptionId: e.povPollOptionId,
                userId: e.povUserId,
                value: e.povValue,
                formResponse: e.povFormResponse,
              ))
          .map(PollOptionVote.fromDB)
          .toList(growable: false);
}

// TODO: extends in schema str
@GraphQLObject()
class PollUser {
  final List<PollUserVote> userVotes;
  final Poll poll;

  const PollUser({
    required this.poll,
    required this.userVotes,
  });
}

@GraphQLObject()
class PollUserVote {
  final PollOption option;
  final PollOptionVote vote;

  const PollUserVote({
    required this.option,
    required this.vote,
  });
}

@GraphQLObject()
class PollOption {
  final int id;
  final int pollId;
  final int? priority;
  final String? description;
  final String? url;
  final String? formJsonSchema;
  final DateTime createdAt;
  final List<PollOptionVote>? _votes;

  const PollOption({
    required this.id,
    required this.pollId,
    this.priority,
    this.description,
    this.url,
    this.formJsonSchema,
    required this.createdAt,
    List<PollOptionVote>? votes,
  }) : _votes = votes;

  factory PollOption.fromJson(Object? json) {
    final v = db.PollOption.fromJson(json);
    return PollOption.fromDB(v);
  }

  factory PollOption.fromDB(db.PollOption v, {List<PollOptionVote>? votes}) {
    return PollOption(
      id: v.id,
      pollId: v.pollId,
      priority: v.priority,
      description: v.description,
      url: v.url,
      formJsonSchema: v.formJsonSchema,
      createdAt: v.createdAt,
      votes: votes,
    );
  }

  // TODO: authenticate, maybe create a custom SQL with userId as param
  Future<List<PollOptionVote>> votes(Ctx ctx) async =>
      _votes ??
      (await dbRef
              .get(ctx)
              .pollOptionVoteController
              .selectMany(FilterEq(db.PollOptionVoteUpdate(pollOptionId: id))))
          .map(PollOptionVote.fromDB)
          .toList(growable: false);
}

@GraphQLInput()
class PollInsert {
  final int? id;
  final String title;
  final String? subtitle;
  final String body;
  final String? pollKind;
  final String? formJsonSchema;
  final List<PollOptionInsert>? options;

  const PollInsert({
    this.id,
    required this.title,
    this.subtitle,
    required this.body,
    this.pollKind,
    this.formJsonSchema,
    this.options,
  });

  factory PollInsert.fromJson(Object? json) {
    final v = db.PollUpdate.fromJson(json);
    return PollInsert(
      id: v.id,
      title: v.title!,
      subtitle: v.subtitle?.value,
      body: v.body!,
      pollKind: v.pollKind?.value,
      formJsonSchema: v.formJsonSchema?.value,
      options: ((json as Map)['options'] as List?)
          ?.map(PollOptionInsert.fromJson)
          .toList(growable: false),
    );
  }

  factory PollInsert.fromDB(
    db.PollInsert v, {
    List<PollOptionInsert>? options,
  }) {
    return PollInsert(
      id: v.id,
      title: v.title,
      subtitle: v.subtitle,
      body: v.body,
      pollKind: v.pollKind,
      formJsonSchema: v.formJsonSchema,
      options: options,
    );
  }

  db.PollInsert toDB({
    required UserId userId,
    required String adminShareToken,
    required String voterShareToken,
  }) {
    return db.PollInsert(
      id: id,
      userId: userId,
      title: title,
      subtitle: subtitle,
      body: body,
      adminShareToken: adminShareToken,
      voterShareToken: voterShareToken,
      pollKind: pollKind,
      formJsonSchema: formJsonSchema,
    );
  }
}

@GraphQLObject()
class PollOptionVote {
  final int pollOptionId;
  final int userId;
  final int value;
  final String? formResponse;
  final DateTime createdAt;

  const PollOptionVote({
    required this.pollOptionId,
    required this.userId,
    required this.value,
    this.formResponse,
    required this.createdAt,
  });

  factory PollOptionVote.fromDB(db.PollOptionVote v) {
    return PollOptionVote(
      pollOptionId: v.pollOptionId,
      userId: v.userId,
      value: v.value,
      formResponse: v.formResponse,
      createdAt: v.createdAt,
    );
  }
}

abstract class ToKey<K extends SqlUniqueKeyModel<dynamic, dynamic>> {
  K toSqlKey();
}

abstract class ToUpdate<U extends SqlUpdateModel<dynamic>> {
  U toSqlUpdate();
}

@GraphQLInput()
class PollOptionVoteInsert
    implements ToKey<db.PollOptionVoteKeyPollOptionIdUserId> {
  final int pollOptionId;
  final int userId;
  final int value;
  final String? formResponse;
  final DateTime? createdAt;

  const PollOptionVoteInsert({
    required this.pollOptionId,
    required this.userId,
    required this.value,
    this.formResponse,
    this.createdAt,
  });

  factory PollOptionVoteInsert.fromJson(Object? json) {
    final v = db.PollOptionVoteInsert.fromJson(json);
    return PollOptionVoteInsert.fromDB(v);
  }

  factory PollOptionVoteInsert.fromDB(db.PollOptionVoteInsert v) {
    return PollOptionVoteInsert(
      pollOptionId: v.pollOptionId,
      userId: v.userId,
      value: v.value,
      formResponse: v.formResponse,
      createdAt: v.createdAt,
    );
  }

  db.PollOptionVoteInsert toDB() {
    return db.PollOptionVoteInsert(
      pollOptionId: pollOptionId,
      userId: userId,
      value: value,
      formResponse: formResponse,
      createdAt: createdAt,
    );
  }

  @override
  db.PollOptionVoteKeyPollOptionIdUserId toSqlKey() {
    return db.PollOptionVoteKeyPollOptionIdUserId(
      pollOptionId: pollOptionId,
      userId: userId,
    );
  }
}

@GraphQLInput()
class PollOptionInsert {
  final int? id;
  final int? priority;
  final String? description;
  final String? url;
  final String? formJsonSchema;
  final DateTime? createdAt;

  const PollOptionInsert({
    this.id,
    this.priority,
    this.description,
    this.url,
    this.formJsonSchema,
    this.createdAt,
  });

  factory PollOptionInsert.fromJson(Object? json) {
    // TODO: remove 'pollId': 0
    final v = db.PollOptionInsert.fromJson({'pollId': 0, ...json as Map});
    return PollOptionInsert.fromDB(v);
  }

  factory PollOptionInsert.fromDB(db.PollOptionInsert v) {
    return PollOptionInsert(
      id: v.id,
      priority: v.priority,
      description: v.description,
      url: v.url,
      formJsonSchema: v.formJsonSchema,
      createdAt: v.createdAt,
    );
  }

  db.PollOptionInsert toDB(int pollId) {
    return db.PollOptionInsert(
      id: id,
      pollId: pollId,
      priority: priority,
      description: description,
      url: url,
      formJsonSchema: formJsonSchema,
      createdAt: createdAt,
    );
  }
}
