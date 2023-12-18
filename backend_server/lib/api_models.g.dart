// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_models.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final _userGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<User>>((setValue) {
  final __name = 'User';

  final __userGraphQLType = objectType<User>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__userGraphQLType);
  __userGraphQLType.fields.addAll(
    [
      ownerPollGraphQLType.nonNull().list().nonNull().field(
        'polls',
        resolve: (
          obj,
          ctx,
        ) {
          final args = ctx.args;

          return obj.polls(ctx);
        },
      ),
      pollOptionVoteGraphQLType.nonNull().list().nonNull().field(
        'votes',
        resolve: (
          obj,
          ctx,
        ) {
          final args = ctx.args;

          return obj.votes(ctx);
        },
      ),
      pollUserGraphQLType.nonNull().list().nonNull().field(
        'pollsWithVotes',
        resolve: (
          obj,
          ctx,
        ) {
          final args = ctx.args;

          return obj.pollsWithVotes(ctx);
        },
      ),
      graphQLInt.nonNull().field(
            'id',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.id,
          ),
      graphQLString.field(
        'name',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.name,
      ),
      graphQLString.nonNull().field(
            'refreshToken',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.refreshToken,
          ),
    ],
  );

  return __userGraphQLType;
});

/// Auto-generated from [User].
GraphQLObjectType<User> get userGraphQLType => _userGraphQLType.value;

final _pollGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<Poll>>((setValue) {
  final __name = 'Poll';

  final __pollGraphQLType = objectType<Poll>(
    __name,
    isInterface: false,
    interfaces: [],
    description: 'TODO: extends db.Poll',
  );

  setValue(__pollGraphQLType);
  __pollGraphQLType.fields.addAll(
    [
      pollOptionGraphQLType.nonNull().list().nonNull().field(
        'options',
        resolve: (
          obj,
          ctx,
        ) {
          final args = ctx.args;

          return obj.options(ctx);
        },
      ),
      graphQLInt.nonNull().field(
            'id',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.id,
          ),
      graphQLInt.nonNull().field(
            'userId',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.userId,
          ),
      graphQLString.nonNull().field(
            'title',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.title,
          ),
      graphQLString.field(
        'subtitle',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.subtitle,
      ),
      graphQLString.nonNull().field(
            'body',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.body,
          ),
      graphQLString.field(
        'pollKind',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.pollKind,
      ),
      graphQLString.field(
        'formJsonSchema',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.formJsonSchema,
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

  return __pollGraphQLType;
});

/// Auto-generated from [Poll].
GraphQLObjectType<Poll> get pollGraphQLType => _pollGraphQLType.value;

final _ownerPollGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<OwnerPoll>>((setValue) {
  final __name = 'OwnerPoll';

  final __ownerPollGraphQLType = objectType<OwnerPoll>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__ownerPollGraphQLType);
  __ownerPollGraphQLType.fields.addAll(
    [
      pollOptionVoteGraphQLType.nonNull().list().nonNull().field(
        'votes',
        resolve: (
          obj,
          ctx,
        ) {
          final args = ctx.args;

          return obj.votes(ctx);
        },
      ),
      pollGraphQLType.nonNull().field(
            'poll',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.poll,
          ),
      graphQLString.nonNull().field(
            'adminShareToken',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.adminShareToken,
          ),
      graphQLString.nonNull().field(
            'voterShareToken',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.voterShareToken,
          ),
    ],
  );

  return __ownerPollGraphQLType;
});

/// Auto-generated from [OwnerPoll].
GraphQLObjectType<OwnerPoll> get ownerPollGraphQLType =>
    _ownerPollGraphQLType.value;

final _pollUserGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<PollUser>>((setValue) {
  final __name = 'PollUser';

  final __pollUserGraphQLType = objectType<PollUser>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__pollUserGraphQLType);
  __pollUserGraphQLType.fields.addAll(
    [
      pollUserVoteGraphQLType.nonNull().list().nonNull().field(
            'userVotes',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.userVotes,
          ),
      pollGraphQLType.nonNull().field(
            'poll',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.poll,
          ),
    ],
  );

  return __pollUserGraphQLType;
});

/// Auto-generated from [PollUser].
GraphQLObjectType<PollUser> get pollUserGraphQLType =>
    _pollUserGraphQLType.value;

final _pollUserVoteGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<PollUserVote>>((setValue) {
  final __name = 'PollUserVote';

  final __pollUserVoteGraphQLType = objectType<PollUserVote>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__pollUserVoteGraphQLType);
  __pollUserVoteGraphQLType.fields.addAll(
    [
      pollOptionGraphQLType.nonNull().field(
            'option',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.option,
          ),
      pollOptionVoteGraphQLType.nonNull().field(
            'vote',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.vote,
          ),
    ],
  );

  return __pollUserVoteGraphQLType;
});

/// Auto-generated from [PollUserVote].
GraphQLObjectType<PollUserVote> get pollUserVoteGraphQLType =>
    _pollUserVoteGraphQLType.value;

final pollOptionSerializer = SerializerValue<PollOption>(
  key: "PollOption",
  fromJson: (ctx, json) => PollOption.fromJson(json), // _$PollOptionFromJson,
  // toJson: (m) => _$PollOptionToJson(m as PollOption),
);
final _pollOptionGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<PollOption>>((setValue) {
  final __name = 'PollOption';

  final __pollOptionGraphQLType = objectType<PollOption>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__pollOptionGraphQLType);
  __pollOptionGraphQLType.fields.addAll(
    [
      pollOptionVoteGraphQLType.nonNull().list().nonNull().field(
        'votes',
        resolve: (
          obj,
          ctx,
        ) {
          final args = ctx.args;

          return obj.votes(ctx);
        },
      ),
      graphQLInt.nonNull().field(
            'id',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.id,
          ),
      graphQLInt.nonNull().field(
            'pollId',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.pollId,
          ),
      graphQLInt.field(
        'priority',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.priority,
      ),
      graphQLString.field(
        'description',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.description,
      ),
      graphQLString.field(
        'url',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.url,
      ),
      graphQLString.field(
        'formJsonSchema',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.formJsonSchema,
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

  return __pollOptionGraphQLType;
});

/// Auto-generated from [PollOption].
GraphQLObjectType<PollOption> get pollOptionGraphQLType =>
    _pollOptionGraphQLType.value;

final pollInsertSerializer = SerializerValue<PollInsert>(
  key: "PollInsert",
  fromJson: (ctx, json) => PollInsert.fromJson(json), // _$$FromJson,
  // toJson: (m) => _$$ToJson(m as _$),
);
final _pollInsertGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<PollInsert>>((setValue) {
  final __name = 'PollInsert';

  final __pollInsertGraphQLTypeInput = inputObjectType<PollInsert>(__name);

  setValue(__pollInsertGraphQLTypeInput);
  __pollInsertGraphQLTypeInput.fields.addAll(
    [
      graphQLInt.inputField('id'),
      graphQLString.nonNull().inputField('title'),
      graphQLString.inputField('subtitle'),
      graphQLString.nonNull().inputField('body'),
      graphQLString.inputField('pollKind'),
      graphQLString.inputField('formJsonSchema'),
      pollOptionInsertGraphQLTypeInput.nonNull().list().inputField('options'),
    ],
  );

  return __pollInsertGraphQLTypeInput;
});

/// Auto-generated from [PollInsert].
GraphQLInputObjectType<PollInsert> get pollInsertGraphQLTypeInput =>
    _pollInsertGraphQLTypeInput.value;

final _pollOptionVoteGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<PollOptionVote>>((setValue) {
  final __name = 'PollOptionVote';

  final __pollOptionVoteGraphQLType = objectType<PollOptionVote>(
    __name,
    isInterface: false,
    interfaces: [],
  );

  setValue(__pollOptionVoteGraphQLType);
  __pollOptionVoteGraphQLType.fields.addAll(
    [
      graphQLInt.nonNull().field(
            'pollOptionId',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.pollOptionId,
          ),
      graphQLInt.nonNull().field(
            'userId',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.userId,
          ),
      graphQLInt.nonNull().field(
            'value',
            resolve: (
              obj,
              ctx,
            ) =>
                obj.value,
          ),
      graphQLString.field(
        'formResponse',
        resolve: (
          obj,
          ctx,
        ) =>
            obj.formResponse,
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

  return __pollOptionVoteGraphQLType;
});

/// Auto-generated from [PollOptionVote].
GraphQLObjectType<PollOptionVote> get pollOptionVoteGraphQLType =>
    _pollOptionVoteGraphQLType.value;

final pollOptionVoteInsertSerializer = SerializerValue<PollOptionVoteInsert>(
  key: "PollOptionVoteInsert",
  fromJson: (ctx, json) => PollOptionVoteInsert.fromJson(json), // _$$FromJson,
  // toJson: (m) => _$$ToJson(m as _$),
);
final _pollOptionVoteInsertGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<PollOptionVoteInsert>>(
        (setValue) {
  final __name = 'PollOptionVoteInsert';

  final __pollOptionVoteInsertGraphQLTypeInput =
      inputObjectType<PollOptionVoteInsert>(__name);

  setValue(__pollOptionVoteInsertGraphQLTypeInput);
  __pollOptionVoteInsertGraphQLTypeInput.fields.addAll(
    [
      graphQLInt.nonNull().inputField('pollOptionId'),
      graphQLInt.nonNull().inputField('userId'),
      graphQLInt.nonNull().inputField('value'),
      graphQLString.inputField('formResponse'),
      graphQLDate.inputField('createdAt'),
    ],
  );

  return __pollOptionVoteInsertGraphQLTypeInput;
});

/// Auto-generated from [PollOptionVoteInsert].
GraphQLInputObjectType<PollOptionVoteInsert>
    get pollOptionVoteInsertGraphQLTypeInput =>
        _pollOptionVoteInsertGraphQLTypeInput.value;

final pollOptionInsertSerializer = SerializerValue<PollOptionInsert>(
  key: "PollOptionInsert",
  fromJson: (ctx, json) => PollOptionInsert.fromJson(json), // _$$FromJson,
  // toJson: (m) => _$$ToJson(m as _$),
);
final _pollOptionInsertGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<PollOptionInsert>>(
        (setValue) {
  final __name = 'PollOptionInsert';

  final __pollOptionInsertGraphQLTypeInput =
      inputObjectType<PollOptionInsert>(__name);

  setValue(__pollOptionInsertGraphQLTypeInput);
  __pollOptionInsertGraphQLTypeInput.fields.addAll(
    [
      graphQLInt.inputField('id'),
      graphQLInt.inputField('priority'),
      graphQLString.inputField('description'),
      graphQLString.inputField('url'),
      graphQLString.inputField('formJsonSchema'),
      graphQLDate.inputField('createdAt'),
    ],
  );

  return __pollOptionInsertGraphQLTypeInput;
});

/// Auto-generated from [PollOptionInsert].
GraphQLInputObjectType<PollOptionInsert> get pollOptionInsertGraphQLTypeInput =>
    _pollOptionInsertGraphQLTypeInput.value;
