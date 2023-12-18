// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/__generated__/schema.schema.gql.dart' as _i2;
import 'package:api_client/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'poll.data.gql.g.dart';

abstract class GgetPollsData
    implements Built<GgetPollsData, GgetPollsDataBuilder> {
  GgetPollsData._();

  factory GgetPollsData([Function(GgetPollsDataBuilder b) updates]) =
      _$GgetPollsData;

  static void _initializeBuilder(GgetPollsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GgetPollsData_getPolls> get getPolls;
  static Serializer<GgetPollsData> get serializer => _$ggetPollsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetPollsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetPollsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetPollsData.serializer,
        json,
      );
}

abstract class GgetPollsData_getPolls
    implements
        Built<GgetPollsData_getPolls, GgetPollsData_getPollsBuilder>,
        GFullPoll {
  GgetPollsData_getPolls._();

  factory GgetPollsData_getPolls(
          [Function(GgetPollsData_getPollsBuilder b) updates]) =
      _$GgetPollsData_getPolls;

  static void _initializeBuilder(GgetPollsData_getPollsBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GgetPollsData_getPolls_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetPollsData_getPolls> get serializer =>
      _$ggetPollsDataGetPollsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetPollsData_getPolls.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetPollsData_getPolls? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetPollsData_getPolls.serializer,
        json,
      );
}

abstract class GgetPollsData_getPolls_options
    implements
        Built<GgetPollsData_getPolls_options,
            GgetPollsData_getPolls_optionsBuilder>,
        GFullPoll_options,
        GFullPollOption {
  GgetPollsData_getPolls_options._();

  factory GgetPollsData_getPolls_options(
          [Function(GgetPollsData_getPolls_optionsBuilder b) updates]) =
      _$GgetPollsData_getPolls_options;

  static void _initializeBuilder(GgetPollsData_getPolls_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GgetPollsData_getPolls_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetPollsData_getPolls_options> get serializer =>
      _$ggetPollsDataGetPollsOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetPollsData_getPolls_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetPollsData_getPolls_options? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetPollsData_getPolls_options.serializer,
        json,
      );
}

abstract class GgetPollsData_getPolls_options_votes
    implements
        Built<GgetPollsData_getPolls_options_votes,
            GgetPollsData_getPolls_options_votesBuilder>,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GgetPollsData_getPolls_options_votes._();

  factory GgetPollsData_getPolls_options_votes(
          [Function(GgetPollsData_getPolls_options_votesBuilder b) updates]) =
      _$GgetPollsData_getPolls_options_votes;

  static void _initializeBuilder(
          GgetPollsData_getPolls_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetPollsData_getPolls_options_votes> get serializer =>
      _$ggetPollsDataGetPollsOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetPollsData_getPolls_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetPollsData_getPolls_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetPollsData_getPolls_options_votes.serializer,
        json,
      );
}

abstract class GregisterUserData
    implements Built<GregisterUserData, GregisterUserDataBuilder> {
  GregisterUserData._();

  factory GregisterUserData([Function(GregisterUserDataBuilder b) updates]) =
      _$GregisterUserData;

  static void _initializeBuilder(GregisterUserDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GregisterUserData_registerUser get registerUser;
  static Serializer<GregisterUserData> get serializer =>
      _$gregisterUserDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser
    implements
        Built<GregisterUserData_registerUser,
            GregisterUserData_registerUserBuilder>,
        GFullUser {
  GregisterUserData_registerUser._();

  factory GregisterUserData_registerUser(
          [Function(GregisterUserData_registerUserBuilder b) updates]) =
      _$GregisterUserData_registerUser;

  static void _initializeBuilder(GregisterUserData_registerUserBuilder b) =>
      b..G__typename = 'User';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get id;
  @override
  String? get name;
  @override
  String get refreshToken;
  @override
  BuiltList<GregisterUserData_registerUser_polls> get polls;
  @override
  BuiltList<GregisterUserData_registerUser_pollsWithVotes> get pollsWithVotes;
  static Serializer<GregisterUserData_registerUser> get serializer =>
      _$gregisterUserDataRegisterUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_polls
    implements
        Built<GregisterUserData_registerUser_polls,
            GregisterUserData_registerUser_pollsBuilder>,
        GFullUser_polls,
        GFullOwnerPoll {
  GregisterUserData_registerUser_polls._();

  factory GregisterUserData_registerUser_polls(
          [Function(GregisterUserData_registerUser_pollsBuilder b) updates]) =
      _$GregisterUserData_registerUser_polls;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsBuilder b) =>
      b..G__typename = 'OwnerPoll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get adminShareToken;
  @override
  String get voterShareToken;
  @override
  BuiltList<GregisterUserData_registerUser_polls_votes> get votes;
  @override
  GregisterUserData_registerUser_polls_poll get poll;
  static Serializer<GregisterUserData_registerUser_polls> get serializer =>
      _$gregisterUserDataRegisterUserPollsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_polls.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_polls? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_polls.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_polls_votes
    implements
        Built<GregisterUserData_registerUser_polls_votes,
            GregisterUserData_registerUser_polls_votesBuilder>,
        GFullUser_polls_votes,
        GFullOwnerPoll_votes,
        GFullPollOptionVote {
  GregisterUserData_registerUser_polls_votes._();

  factory GregisterUserData_registerUser_polls_votes(
      [Function(GregisterUserData_registerUser_polls_votesBuilder b)
          updates]) = _$GregisterUserData_registerUser_polls_votes;

  static void _initializeBuilder(
          GregisterUserData_registerUser_polls_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GregisterUserData_registerUser_polls_votes>
      get serializer => _$gregisterUserDataRegisterUserPollsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_polls_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_polls_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_polls_votes.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_polls_poll
    implements
        Built<GregisterUserData_registerUser_polls_poll,
            GregisterUserData_registerUser_polls_pollBuilder>,
        GFullUser_polls_poll,
        GFullOwnerPoll_poll,
        GFullPoll {
  GregisterUserData_registerUser_polls_poll._();

  factory GregisterUserData_registerUser_polls_poll(
      [Function(GregisterUserData_registerUser_polls_pollBuilder b)
          updates]) = _$GregisterUserData_registerUser_polls_poll;

  static void _initializeBuilder(
          GregisterUserData_registerUser_polls_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GregisterUserData_registerUser_polls_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GregisterUserData_registerUser_polls_poll> get serializer =>
      _$gregisterUserDataRegisterUserPollsPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_polls_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_polls_poll? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_polls_poll.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_polls_poll_options
    implements
        Built<GregisterUserData_registerUser_polls_poll_options,
            GregisterUserData_registerUser_polls_poll_optionsBuilder>,
        GFullUser_polls_poll_options,
        GFullOwnerPoll_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GregisterUserData_registerUser_polls_poll_options._();

  factory GregisterUserData_registerUser_polls_poll_options(
      [Function(GregisterUserData_registerUser_polls_poll_optionsBuilder b)
          updates]) = _$GregisterUserData_registerUser_polls_poll_options;

  static void _initializeBuilder(
          GregisterUserData_registerUser_polls_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GregisterUserData_registerUser_polls_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GregisterUserData_registerUser_polls_poll_options>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_polls_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_polls_poll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_polls_poll_options.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_polls_poll_options_votes
    implements
        Built<GregisterUserData_registerUser_polls_poll_options_votes,
            GregisterUserData_registerUser_polls_poll_options_votesBuilder>,
        GFullUser_polls_poll_options_votes,
        GFullOwnerPoll_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GregisterUserData_registerUser_polls_poll_options_votes._();

  factory GregisterUserData_registerUser_polls_poll_options_votes(
      [Function(
              GregisterUserData_registerUser_polls_poll_options_votesBuilder b)
          updates]) = _$GregisterUserData_registerUser_polls_poll_options_votes;

  static void _initializeBuilder(
          GregisterUserData_registerUser_polls_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GregisterUserData_registerUser_polls_poll_options_votes>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_polls_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_polls_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_polls_poll_options_votes.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_pollsWithVotes
    implements
        Built<GregisterUserData_registerUser_pollsWithVotes,
            GregisterUserData_registerUser_pollsWithVotesBuilder>,
        GFullUser_pollsWithVotes,
        GFullPollUser {
  GregisterUserData_registerUser_pollsWithVotes._();

  factory GregisterUserData_registerUser_pollsWithVotes(
      [Function(GregisterUserData_registerUser_pollsWithVotesBuilder b)
          updates]) = _$GregisterUserData_registerUser_pollsWithVotes;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsWithVotesBuilder b) =>
      b..G__typename = 'PollUser';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GregisterUserData_registerUser_pollsWithVotes_poll get poll;
  @override
  BuiltList<GregisterUserData_registerUser_pollsWithVotes_userVotes>
      get userVotes;
  static Serializer<GregisterUserData_registerUser_pollsWithVotes>
      get serializer => _$gregisterUserDataRegisterUserPollsWithVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_pollsWithVotes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_pollsWithVotes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_pollsWithVotes.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_pollsWithVotes_poll
    implements
        Built<GregisterUserData_registerUser_pollsWithVotes_poll,
            GregisterUserData_registerUser_pollsWithVotes_pollBuilder>,
        GFullUser_pollsWithVotes_poll,
        GFullPollUser_poll,
        GFullPoll {
  GregisterUserData_registerUser_pollsWithVotes_poll._();

  factory GregisterUserData_registerUser_pollsWithVotes_poll(
      [Function(GregisterUserData_registerUser_pollsWithVotes_pollBuilder b)
          updates]) = _$GregisterUserData_registerUser_pollsWithVotes_poll;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsWithVotes_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GregisterUserData_registerUser_pollsWithVotes_poll_options>
      get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GregisterUserData_registerUser_pollsWithVotes_poll>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsWithVotesPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_pollsWithVotes_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_pollsWithVotes_poll? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_pollsWithVotes_poll.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_pollsWithVotes_poll_options
    implements
        Built<GregisterUserData_registerUser_pollsWithVotes_poll_options,
            GregisterUserData_registerUser_pollsWithVotes_poll_optionsBuilder>,
        GFullUser_pollsWithVotes_poll_options,
        GFullPollUser_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GregisterUserData_registerUser_pollsWithVotes_poll_options._();

  factory GregisterUserData_registerUser_pollsWithVotes_poll_options(
      [Function(
              GregisterUserData_registerUser_pollsWithVotes_poll_optionsBuilder
                  b)
          updates]) = _$GregisterUserData_registerUser_pollsWithVotes_poll_options;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsWithVotes_poll_optionsBuilder
              b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GregisterUserData_registerUser_pollsWithVotes_poll_options_votes>
      get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GregisterUserData_registerUser_pollsWithVotes_poll_options>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsWithVotesPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_pollsWithVotes_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_pollsWithVotes_poll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_pollsWithVotes_poll_options.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_pollsWithVotes_poll_options_votes
    implements
        Built<GregisterUserData_registerUser_pollsWithVotes_poll_options_votes,
            GregisterUserData_registerUser_pollsWithVotes_poll_options_votesBuilder>,
        GFullUser_pollsWithVotes_poll_options_votes,
        GFullPollUser_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GregisterUserData_registerUser_pollsWithVotes_poll_options_votes._();

  factory GregisterUserData_registerUser_pollsWithVotes_poll_options_votes(
          [Function(
                  GregisterUserData_registerUser_pollsWithVotes_poll_options_votesBuilder
                      b)
              updates]) =
      _$GregisterUserData_registerUser_pollsWithVotes_poll_options_votes;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsWithVotes_poll_options_votesBuilder
              b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<
          GregisterUserData_registerUser_pollsWithVotes_poll_options_votes>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsWithVotesPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_pollsWithVotes_poll_options_votes
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_pollsWithVotes_poll_options_votes?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GregisterUserData_registerUser_pollsWithVotes_poll_options_votes
                .serializer,
            json,
          );
}

abstract class GregisterUserData_registerUser_pollsWithVotes_userVotes
    implements
        Built<GregisterUserData_registerUser_pollsWithVotes_userVotes,
            GregisterUserData_registerUser_pollsWithVotes_userVotesBuilder>,
        GFullUser_pollsWithVotes_userVotes,
        GFullPollUser_userVotes,
        GFullPollUserVote {
  GregisterUserData_registerUser_pollsWithVotes_userVotes._();

  factory GregisterUserData_registerUser_pollsWithVotes_userVotes(
      [Function(
              GregisterUserData_registerUser_pollsWithVotes_userVotesBuilder b)
          updates]) = _$GregisterUserData_registerUser_pollsWithVotes_userVotes;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsWithVotes_userVotesBuilder b) =>
      b..G__typename = 'PollUserVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GregisterUserData_registerUser_pollsWithVotes_userVotes_option get option;
  @override
  GregisterUserData_registerUser_pollsWithVotes_userVotes_vote get vote;
  static Serializer<GregisterUserData_registerUser_pollsWithVotes_userVotes>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsWithVotesUserVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_pollsWithVotes_userVotes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_pollsWithVotes_userVotes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_pollsWithVotes_userVotes.serializer,
        json,
      );
}

abstract class GregisterUserData_registerUser_pollsWithVotes_userVotes_option
    implements
        Built<GregisterUserData_registerUser_pollsWithVotes_userVotes_option,
            GregisterUserData_registerUser_pollsWithVotes_userVotes_optionBuilder>,
        GFullUser_pollsWithVotes_userVotes_option,
        GFullPollUser_userVotes_option,
        GFullPollUserVote_option,
        GFullPollOption {
  GregisterUserData_registerUser_pollsWithVotes_userVotes_option._();

  factory GregisterUserData_registerUser_pollsWithVotes_userVotes_option(
          [Function(
                  GregisterUserData_registerUser_pollsWithVotes_userVotes_optionBuilder
                      b)
              updates]) =
      _$GregisterUserData_registerUser_pollsWithVotes_userVotes_option;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsWithVotes_userVotes_optionBuilder
              b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<
          GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes>
      get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<
          GregisterUserData_registerUser_pollsWithVotes_userVotes_option>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsWithVotesUserVotesOptionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_pollsWithVotes_userVotes_option
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_pollsWithVotes_userVotes_option?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GregisterUserData_registerUser_pollsWithVotes_userVotes_option
                .serializer,
            json,
          );
}

abstract class GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes
    implements
        Built<
            GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes,
            GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votesBuilder>,
        GFullUser_pollsWithVotes_userVotes_option_votes,
        GFullPollUser_userVotes_option_votes,
        GFullPollUserVote_option_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes._();

  factory GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes(
          [Function(
                  GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votesBuilder
                      b)
              updates]) =
      _$GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votesBuilder
              b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<
          GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsWithVotesUserVotesOptionVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes
                .serializer,
            json,
          );
}

abstract class GregisterUserData_registerUser_pollsWithVotes_userVotes_vote
    implements
        Built<GregisterUserData_registerUser_pollsWithVotes_userVotes_vote,
            GregisterUserData_registerUser_pollsWithVotes_userVotes_voteBuilder>,
        GFullUser_pollsWithVotes_userVotes_vote,
        GFullPollUser_userVotes_vote,
        GFullPollUserVote_vote,
        GFullPollOptionVote {
  GregisterUserData_registerUser_pollsWithVotes_userVotes_vote._();

  factory GregisterUserData_registerUser_pollsWithVotes_userVotes_vote(
          [Function(
                  GregisterUserData_registerUser_pollsWithVotes_userVotes_voteBuilder
                      b)
              updates]) =
      _$GregisterUserData_registerUser_pollsWithVotes_userVotes_vote;

  static void _initializeBuilder(
          GregisterUserData_registerUser_pollsWithVotes_userVotes_voteBuilder
              b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<
          GregisterUserData_registerUser_pollsWithVotes_userVotes_vote>
      get serializer =>
          _$gregisterUserDataRegisterUserPollsWithVotesUserVotesVoteSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserData_registerUser_pollsWithVotes_userVotes_vote.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserData_registerUser_pollsWithVotes_userVotes_vote? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserData_registerUser_pollsWithVotes_userVotes_vote.serializer,
        json,
      );
}

abstract class GgetUserData
    implements Built<GgetUserData, GgetUserDataBuilder> {
  GgetUserData._();

  factory GgetUserData([Function(GgetUserDataBuilder b) updates]) =
      _$GgetUserData;

  static void _initializeBuilder(GgetUserDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GgetUserData_getUser get getUser;
  static Serializer<GgetUserData> get serializer => _$ggetUserDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData.serializer,
        json,
      );
}

abstract class GgetUserData_getUser
    implements
        Built<GgetUserData_getUser, GgetUserData_getUserBuilder>,
        GFullUser {
  GgetUserData_getUser._();

  factory GgetUserData_getUser(
          [Function(GgetUserData_getUserBuilder b) updates]) =
      _$GgetUserData_getUser;

  static void _initializeBuilder(GgetUserData_getUserBuilder b) =>
      b..G__typename = 'User';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get id;
  @override
  String? get name;
  @override
  String get refreshToken;
  @override
  BuiltList<GgetUserData_getUser_polls> get polls;
  @override
  BuiltList<GgetUserData_getUser_pollsWithVotes> get pollsWithVotes;
  static Serializer<GgetUserData_getUser> get serializer =>
      _$ggetUserDataGetUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_polls
    implements
        Built<GgetUserData_getUser_polls, GgetUserData_getUser_pollsBuilder>,
        GFullUser_polls,
        GFullOwnerPoll {
  GgetUserData_getUser_polls._();

  factory GgetUserData_getUser_polls(
          [Function(GgetUserData_getUser_pollsBuilder b) updates]) =
      _$GgetUserData_getUser_polls;

  static void _initializeBuilder(GgetUserData_getUser_pollsBuilder b) =>
      b..G__typename = 'OwnerPoll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get adminShareToken;
  @override
  String get voterShareToken;
  @override
  BuiltList<GgetUserData_getUser_polls_votes> get votes;
  @override
  GgetUserData_getUser_polls_poll get poll;
  static Serializer<GgetUserData_getUser_polls> get serializer =>
      _$ggetUserDataGetUserPollsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_polls.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_polls? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_polls.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_polls_votes
    implements
        Built<GgetUserData_getUser_polls_votes,
            GgetUserData_getUser_polls_votesBuilder>,
        GFullUser_polls_votes,
        GFullOwnerPoll_votes,
        GFullPollOptionVote {
  GgetUserData_getUser_polls_votes._();

  factory GgetUserData_getUser_polls_votes(
          [Function(GgetUserData_getUser_polls_votesBuilder b) updates]) =
      _$GgetUserData_getUser_polls_votes;

  static void _initializeBuilder(GgetUserData_getUser_polls_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_polls_votes> get serializer =>
      _$ggetUserDataGetUserPollsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_polls_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_polls_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_polls_votes.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_polls_poll
    implements
        Built<GgetUserData_getUser_polls_poll,
            GgetUserData_getUser_polls_pollBuilder>,
        GFullUser_polls_poll,
        GFullOwnerPoll_poll,
        GFullPoll {
  GgetUserData_getUser_polls_poll._();

  factory GgetUserData_getUser_polls_poll(
          [Function(GgetUserData_getUser_polls_pollBuilder b) updates]) =
      _$GgetUserData_getUser_polls_poll;

  static void _initializeBuilder(GgetUserData_getUser_polls_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GgetUserData_getUser_polls_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_polls_poll> get serializer =>
      _$ggetUserDataGetUserPollsPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_polls_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_polls_poll? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_polls_poll.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_polls_poll_options
    implements
        Built<GgetUserData_getUser_polls_poll_options,
            GgetUserData_getUser_polls_poll_optionsBuilder>,
        GFullUser_polls_poll_options,
        GFullOwnerPoll_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GgetUserData_getUser_polls_poll_options._();

  factory GgetUserData_getUser_polls_poll_options(
      [Function(GgetUserData_getUser_polls_poll_optionsBuilder b)
          updates]) = _$GgetUserData_getUser_polls_poll_options;

  static void _initializeBuilder(
          GgetUserData_getUser_polls_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GgetUserData_getUser_polls_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_polls_poll_options> get serializer =>
      _$ggetUserDataGetUserPollsPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_polls_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_polls_poll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_polls_poll_options.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_polls_poll_options_votes
    implements
        Built<GgetUserData_getUser_polls_poll_options_votes,
            GgetUserData_getUser_polls_poll_options_votesBuilder>,
        GFullUser_polls_poll_options_votes,
        GFullOwnerPoll_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GgetUserData_getUser_polls_poll_options_votes._();

  factory GgetUserData_getUser_polls_poll_options_votes(
      [Function(GgetUserData_getUser_polls_poll_options_votesBuilder b)
          updates]) = _$GgetUserData_getUser_polls_poll_options_votes;

  static void _initializeBuilder(
          GgetUserData_getUser_polls_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_polls_poll_options_votes>
      get serializer => _$ggetUserDataGetUserPollsPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_polls_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_polls_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_polls_poll_options_votes.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_pollsWithVotes
    implements
        Built<GgetUserData_getUser_pollsWithVotes,
            GgetUserData_getUser_pollsWithVotesBuilder>,
        GFullUser_pollsWithVotes,
        GFullPollUser {
  GgetUserData_getUser_pollsWithVotes._();

  factory GgetUserData_getUser_pollsWithVotes(
          [Function(GgetUserData_getUser_pollsWithVotesBuilder b) updates]) =
      _$GgetUserData_getUser_pollsWithVotes;

  static void _initializeBuilder(
          GgetUserData_getUser_pollsWithVotesBuilder b) =>
      b..G__typename = 'PollUser';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GgetUserData_getUser_pollsWithVotes_poll get poll;
  @override
  BuiltList<GgetUserData_getUser_pollsWithVotes_userVotes> get userVotes;
  static Serializer<GgetUserData_getUser_pollsWithVotes> get serializer =>
      _$ggetUserDataGetUserPollsWithVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_pollsWithVotes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_pollsWithVotes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_pollsWithVotes.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_pollsWithVotes_poll
    implements
        Built<GgetUserData_getUser_pollsWithVotes_poll,
            GgetUserData_getUser_pollsWithVotes_pollBuilder>,
        GFullUser_pollsWithVotes_poll,
        GFullPollUser_poll,
        GFullPoll {
  GgetUserData_getUser_pollsWithVotes_poll._();

  factory GgetUserData_getUser_pollsWithVotes_poll(
      [Function(GgetUserData_getUser_pollsWithVotes_pollBuilder b)
          updates]) = _$GgetUserData_getUser_pollsWithVotes_poll;

  static void _initializeBuilder(
          GgetUserData_getUser_pollsWithVotes_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GgetUserData_getUser_pollsWithVotes_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_pollsWithVotes_poll> get serializer =>
      _$ggetUserDataGetUserPollsWithVotesPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_pollsWithVotes_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_pollsWithVotes_poll? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_pollsWithVotes_poll.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_pollsWithVotes_poll_options
    implements
        Built<GgetUserData_getUser_pollsWithVotes_poll_options,
            GgetUserData_getUser_pollsWithVotes_poll_optionsBuilder>,
        GFullUser_pollsWithVotes_poll_options,
        GFullPollUser_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GgetUserData_getUser_pollsWithVotes_poll_options._();

  factory GgetUserData_getUser_pollsWithVotes_poll_options(
      [Function(GgetUserData_getUser_pollsWithVotes_poll_optionsBuilder b)
          updates]) = _$GgetUserData_getUser_pollsWithVotes_poll_options;

  static void _initializeBuilder(
          GgetUserData_getUser_pollsWithVotes_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GgetUserData_getUser_pollsWithVotes_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_pollsWithVotes_poll_options>
      get serializer =>
          _$ggetUserDataGetUserPollsWithVotesPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_pollsWithVotes_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_pollsWithVotes_poll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_pollsWithVotes_poll_options.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_pollsWithVotes_poll_options_votes
    implements
        Built<GgetUserData_getUser_pollsWithVotes_poll_options_votes,
            GgetUserData_getUser_pollsWithVotes_poll_options_votesBuilder>,
        GFullUser_pollsWithVotes_poll_options_votes,
        GFullPollUser_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GgetUserData_getUser_pollsWithVotes_poll_options_votes._();

  factory GgetUserData_getUser_pollsWithVotes_poll_options_votes(
      [Function(GgetUserData_getUser_pollsWithVotes_poll_options_votesBuilder b)
          updates]) = _$GgetUserData_getUser_pollsWithVotes_poll_options_votes;

  static void _initializeBuilder(
          GgetUserData_getUser_pollsWithVotes_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_pollsWithVotes_poll_options_votes>
      get serializer =>
          _$ggetUserDataGetUserPollsWithVotesPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_pollsWithVotes_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_pollsWithVotes_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_pollsWithVotes_poll_options_votes.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_pollsWithVotes_userVotes
    implements
        Built<GgetUserData_getUser_pollsWithVotes_userVotes,
            GgetUserData_getUser_pollsWithVotes_userVotesBuilder>,
        GFullUser_pollsWithVotes_userVotes,
        GFullPollUser_userVotes,
        GFullPollUserVote {
  GgetUserData_getUser_pollsWithVotes_userVotes._();

  factory GgetUserData_getUser_pollsWithVotes_userVotes(
      [Function(GgetUserData_getUser_pollsWithVotes_userVotesBuilder b)
          updates]) = _$GgetUserData_getUser_pollsWithVotes_userVotes;

  static void _initializeBuilder(
          GgetUserData_getUser_pollsWithVotes_userVotesBuilder b) =>
      b..G__typename = 'PollUserVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GgetUserData_getUser_pollsWithVotes_userVotes_option get option;
  @override
  GgetUserData_getUser_pollsWithVotes_userVotes_vote get vote;
  static Serializer<GgetUserData_getUser_pollsWithVotes_userVotes>
      get serializer => _$ggetUserDataGetUserPollsWithVotesUserVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_pollsWithVotes_userVotes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_pollsWithVotes_userVotes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_pollsWithVotes_userVotes.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_pollsWithVotes_userVotes_option
    implements
        Built<GgetUserData_getUser_pollsWithVotes_userVotes_option,
            GgetUserData_getUser_pollsWithVotes_userVotes_optionBuilder>,
        GFullUser_pollsWithVotes_userVotes_option,
        GFullPollUser_userVotes_option,
        GFullPollUserVote_option,
        GFullPollOption {
  GgetUserData_getUser_pollsWithVotes_userVotes_option._();

  factory GgetUserData_getUser_pollsWithVotes_userVotes_option(
      [Function(GgetUserData_getUser_pollsWithVotes_userVotes_optionBuilder b)
          updates]) = _$GgetUserData_getUser_pollsWithVotes_userVotes_option;

  static void _initializeBuilder(
          GgetUserData_getUser_pollsWithVotes_userVotes_optionBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GgetUserData_getUser_pollsWithVotes_userVotes_option_votes>
      get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_pollsWithVotes_userVotes_option>
      get serializer =>
          _$ggetUserDataGetUserPollsWithVotesUserVotesOptionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_pollsWithVotes_userVotes_option.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_pollsWithVotes_userVotes_option? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_pollsWithVotes_userVotes_option.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_pollsWithVotes_userVotes_option_votes
    implements
        Built<GgetUserData_getUser_pollsWithVotes_userVotes_option_votes,
            GgetUserData_getUser_pollsWithVotes_userVotes_option_votesBuilder>,
        GFullUser_pollsWithVotes_userVotes_option_votes,
        GFullPollUser_userVotes_option_votes,
        GFullPollUserVote_option_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GgetUserData_getUser_pollsWithVotes_userVotes_option_votes._();

  factory GgetUserData_getUser_pollsWithVotes_userVotes_option_votes(
      [Function(
              GgetUserData_getUser_pollsWithVotes_userVotes_option_votesBuilder
                  b)
          updates]) = _$GgetUserData_getUser_pollsWithVotes_userVotes_option_votes;

  static void _initializeBuilder(
          GgetUserData_getUser_pollsWithVotes_userVotes_option_votesBuilder
              b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_pollsWithVotes_userVotes_option_votes>
      get serializer =>
          _$ggetUserDataGetUserPollsWithVotesUserVotesOptionVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_pollsWithVotes_userVotes_option_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_pollsWithVotes_userVotes_option_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_pollsWithVotes_userVotes_option_votes.serializer,
        json,
      );
}

abstract class GgetUserData_getUser_pollsWithVotes_userVotes_vote
    implements
        Built<GgetUserData_getUser_pollsWithVotes_userVotes_vote,
            GgetUserData_getUser_pollsWithVotes_userVotes_voteBuilder>,
        GFullUser_pollsWithVotes_userVotes_vote,
        GFullPollUser_userVotes_vote,
        GFullPollUserVote_vote,
        GFullPollOptionVote {
  GgetUserData_getUser_pollsWithVotes_userVotes_vote._();

  factory GgetUserData_getUser_pollsWithVotes_userVotes_vote(
      [Function(GgetUserData_getUser_pollsWithVotes_userVotes_voteBuilder b)
          updates]) = _$GgetUserData_getUser_pollsWithVotes_userVotes_vote;

  static void _initializeBuilder(
          GgetUserData_getUser_pollsWithVotes_userVotes_voteBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GgetUserData_getUser_pollsWithVotes_userVotes_vote>
      get serializer =>
          _$ggetUserDataGetUserPollsWithVotesUserVotesVoteSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_getUser_pollsWithVotes_userVotes_vote.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_getUser_pollsWithVotes_userVotes_vote? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_getUser_pollsWithVotes_userVotes_vote.serializer,
        json,
      );
}

abstract class GinsertPollData
    implements Built<GinsertPollData, GinsertPollDataBuilder> {
  GinsertPollData._();

  factory GinsertPollData([Function(GinsertPollDataBuilder b) updates]) =
      _$GinsertPollData;

  static void _initializeBuilder(GinsertPollDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GinsertPollData_insertPoll get insertPoll;
  static Serializer<GinsertPollData> get serializer =>
      _$ginsertPollDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollData.serializer,
        json,
      );
}

abstract class GinsertPollData_insertPoll
    implements
        Built<GinsertPollData_insertPoll, GinsertPollData_insertPollBuilder>,
        GFullOwnerPoll {
  GinsertPollData_insertPoll._();

  factory GinsertPollData_insertPoll(
          [Function(GinsertPollData_insertPollBuilder b) updates]) =
      _$GinsertPollData_insertPoll;

  static void _initializeBuilder(GinsertPollData_insertPollBuilder b) =>
      b..G__typename = 'OwnerPoll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get adminShareToken;
  @override
  String get voterShareToken;
  @override
  BuiltList<GinsertPollData_insertPoll_votes> get votes;
  @override
  GinsertPollData_insertPoll_poll get poll;
  static Serializer<GinsertPollData_insertPoll> get serializer =>
      _$ginsertPollDataInsertPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollData_insertPoll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollData_insertPoll? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollData_insertPoll.serializer,
        json,
      );
}

abstract class GinsertPollData_insertPoll_votes
    implements
        Built<GinsertPollData_insertPoll_votes,
            GinsertPollData_insertPoll_votesBuilder>,
        GFullOwnerPoll_votes,
        GFullPollOptionVote {
  GinsertPollData_insertPoll_votes._();

  factory GinsertPollData_insertPoll_votes(
          [Function(GinsertPollData_insertPoll_votesBuilder b) updates]) =
      _$GinsertPollData_insertPoll_votes;

  static void _initializeBuilder(GinsertPollData_insertPoll_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GinsertPollData_insertPoll_votes> get serializer =>
      _$ginsertPollDataInsertPollVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollData_insertPoll_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollData_insertPoll_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollData_insertPoll_votes.serializer,
        json,
      );
}

abstract class GinsertPollData_insertPoll_poll
    implements
        Built<GinsertPollData_insertPoll_poll,
            GinsertPollData_insertPoll_pollBuilder>,
        GFullOwnerPoll_poll,
        GFullPoll {
  GinsertPollData_insertPoll_poll._();

  factory GinsertPollData_insertPoll_poll(
          [Function(GinsertPollData_insertPoll_pollBuilder b) updates]) =
      _$GinsertPollData_insertPoll_poll;

  static void _initializeBuilder(GinsertPollData_insertPoll_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GinsertPollData_insertPoll_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GinsertPollData_insertPoll_poll> get serializer =>
      _$ginsertPollDataInsertPollPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollData_insertPoll_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollData_insertPoll_poll? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollData_insertPoll_poll.serializer,
        json,
      );
}

abstract class GinsertPollData_insertPoll_poll_options
    implements
        Built<GinsertPollData_insertPoll_poll_options,
            GinsertPollData_insertPoll_poll_optionsBuilder>,
        GFullOwnerPoll_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GinsertPollData_insertPoll_poll_options._();

  factory GinsertPollData_insertPoll_poll_options(
      [Function(GinsertPollData_insertPoll_poll_optionsBuilder b)
          updates]) = _$GinsertPollData_insertPoll_poll_options;

  static void _initializeBuilder(
          GinsertPollData_insertPoll_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GinsertPollData_insertPoll_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GinsertPollData_insertPoll_poll_options> get serializer =>
      _$ginsertPollDataInsertPollPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollData_insertPoll_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollData_insertPoll_poll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollData_insertPoll_poll_options.serializer,
        json,
      );
}

abstract class GinsertPollData_insertPoll_poll_options_votes
    implements
        Built<GinsertPollData_insertPoll_poll_options_votes,
            GinsertPollData_insertPoll_poll_options_votesBuilder>,
        GFullOwnerPoll_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GinsertPollData_insertPoll_poll_options_votes._();

  factory GinsertPollData_insertPoll_poll_options_votes(
      [Function(GinsertPollData_insertPoll_poll_options_votesBuilder b)
          updates]) = _$GinsertPollData_insertPoll_poll_options_votes;

  static void _initializeBuilder(
          GinsertPollData_insertPoll_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GinsertPollData_insertPoll_poll_options_votes>
      get serializer => _$ginsertPollDataInsertPollPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollData_insertPoll_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollData_insertPoll_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollData_insertPoll_poll_options_votes.serializer,
        json,
      );
}

abstract class GaddPollOptionsData
    implements Built<GaddPollOptionsData, GaddPollOptionsDataBuilder> {
  GaddPollOptionsData._();

  factory GaddPollOptionsData(
      [Function(GaddPollOptionsDataBuilder b) updates]) = _$GaddPollOptionsData;

  static void _initializeBuilder(GaddPollOptionsDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GaddPollOptionsData_addPollOptions get addPollOptions;
  static Serializer<GaddPollOptionsData> get serializer =>
      _$gaddPollOptionsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsData.serializer,
        json,
      );
}

abstract class GaddPollOptionsData_addPollOptions
    implements
        Built<GaddPollOptionsData_addPollOptions,
            GaddPollOptionsData_addPollOptionsBuilder>,
        GFullOwnerPoll {
  GaddPollOptionsData_addPollOptions._();

  factory GaddPollOptionsData_addPollOptions(
          [Function(GaddPollOptionsData_addPollOptionsBuilder b) updates]) =
      _$GaddPollOptionsData_addPollOptions;

  static void _initializeBuilder(GaddPollOptionsData_addPollOptionsBuilder b) =>
      b..G__typename = 'OwnerPoll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get adminShareToken;
  @override
  String get voterShareToken;
  @override
  BuiltList<GaddPollOptionsData_addPollOptions_votes> get votes;
  @override
  GaddPollOptionsData_addPollOptions_poll get poll;
  static Serializer<GaddPollOptionsData_addPollOptions> get serializer =>
      _$gaddPollOptionsDataAddPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsData_addPollOptions.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsData_addPollOptions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsData_addPollOptions.serializer,
        json,
      );
}

abstract class GaddPollOptionsData_addPollOptions_votes
    implements
        Built<GaddPollOptionsData_addPollOptions_votes,
            GaddPollOptionsData_addPollOptions_votesBuilder>,
        GFullOwnerPoll_votes,
        GFullPollOptionVote {
  GaddPollOptionsData_addPollOptions_votes._();

  factory GaddPollOptionsData_addPollOptions_votes(
      [Function(GaddPollOptionsData_addPollOptions_votesBuilder b)
          updates]) = _$GaddPollOptionsData_addPollOptions_votes;

  static void _initializeBuilder(
          GaddPollOptionsData_addPollOptions_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GaddPollOptionsData_addPollOptions_votes> get serializer =>
      _$gaddPollOptionsDataAddPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsData_addPollOptions_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsData_addPollOptions_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsData_addPollOptions_votes.serializer,
        json,
      );
}

abstract class GaddPollOptionsData_addPollOptions_poll
    implements
        Built<GaddPollOptionsData_addPollOptions_poll,
            GaddPollOptionsData_addPollOptions_pollBuilder>,
        GFullOwnerPoll_poll,
        GFullPoll {
  GaddPollOptionsData_addPollOptions_poll._();

  factory GaddPollOptionsData_addPollOptions_poll(
      [Function(GaddPollOptionsData_addPollOptions_pollBuilder b)
          updates]) = _$GaddPollOptionsData_addPollOptions_poll;

  static void _initializeBuilder(
          GaddPollOptionsData_addPollOptions_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GaddPollOptionsData_addPollOptions_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GaddPollOptionsData_addPollOptions_poll> get serializer =>
      _$gaddPollOptionsDataAddPollOptionsPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsData_addPollOptions_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsData_addPollOptions_poll? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsData_addPollOptions_poll.serializer,
        json,
      );
}

abstract class GaddPollOptionsData_addPollOptions_poll_options
    implements
        Built<GaddPollOptionsData_addPollOptions_poll_options,
            GaddPollOptionsData_addPollOptions_poll_optionsBuilder>,
        GFullOwnerPoll_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GaddPollOptionsData_addPollOptions_poll_options._();

  factory GaddPollOptionsData_addPollOptions_poll_options(
      [Function(GaddPollOptionsData_addPollOptions_poll_optionsBuilder b)
          updates]) = _$GaddPollOptionsData_addPollOptions_poll_options;

  static void _initializeBuilder(
          GaddPollOptionsData_addPollOptions_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GaddPollOptionsData_addPollOptions_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GaddPollOptionsData_addPollOptions_poll_options>
      get serializer =>
          _$gaddPollOptionsDataAddPollOptionsPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsData_addPollOptions_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsData_addPollOptions_poll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsData_addPollOptions_poll_options.serializer,
        json,
      );
}

abstract class GaddPollOptionsData_addPollOptions_poll_options_votes
    implements
        Built<GaddPollOptionsData_addPollOptions_poll_options_votes,
            GaddPollOptionsData_addPollOptions_poll_options_votesBuilder>,
        GFullOwnerPoll_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GaddPollOptionsData_addPollOptions_poll_options_votes._();

  factory GaddPollOptionsData_addPollOptions_poll_options_votes(
      [Function(GaddPollOptionsData_addPollOptions_poll_options_votesBuilder b)
          updates]) = _$GaddPollOptionsData_addPollOptions_poll_options_votes;

  static void _initializeBuilder(
          GaddPollOptionsData_addPollOptions_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GaddPollOptionsData_addPollOptions_poll_options_votes>
      get serializer =>
          _$gaddPollOptionsDataAddPollOptionsPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsData_addPollOptions_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsData_addPollOptions_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsData_addPollOptions_poll_options_votes.serializer,
        json,
      );
}

abstract class GvotePollData
    implements Built<GvotePollData, GvotePollDataBuilder> {
  GvotePollData._();

  factory GvotePollData([Function(GvotePollDataBuilder b) updates]) =
      _$GvotePollData;

  static void _initializeBuilder(GvotePollDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GvotePollData_votePoll get votePoll;
  static Serializer<GvotePollData> get serializer => _$gvotePollDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GvotePollData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GvotePollData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GvotePollData.serializer,
        json,
      );
}

abstract class GvotePollData_votePoll
    implements Built<GvotePollData_votePoll, GvotePollData_votePollBuilder> {
  GvotePollData_votePoll._();

  factory GvotePollData_votePoll(
          [Function(GvotePollData_votePollBuilder b) updates]) =
      _$GvotePollData_votePoll;

  static void _initializeBuilder(GvotePollData_votePollBuilder b) =>
      b..G__typename = 'ResultIntString';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get ok;
  String? get err;
  bool get isOk;
  static Serializer<GvotePollData_votePoll> get serializer =>
      _$gvotePollDataVotePollSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GvotePollData_votePoll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GvotePollData_votePoll? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GvotePollData_votePoll.serializer,
        json,
      );
}

abstract class GFullUser {
  String get G__typename;
  int get id;
  String? get name;
  String get refreshToken;
  BuiltList<GFullUser_polls> get polls;
  BuiltList<GFullUser_pollsWithVotes> get pollsWithVotes;
  Map<String, dynamic> toJson();
}

abstract class GFullUser_polls implements GFullOwnerPoll {
  @override
  String get G__typename;
  @override
  String get adminShareToken;
  @override
  String get voterShareToken;
  @override
  BuiltList<GFullUser_polls_votes> get votes;
  @override
  GFullUser_polls_poll get poll;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_polls_votes
    implements GFullOwnerPoll_votes, GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_polls_poll implements GFullOwnerPoll_poll, GFullPoll {
  @override
  String get G__typename;
  @override
  BuiltList<GFullUser_polls_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_polls_poll_options
    implements GFullOwnerPoll_poll_options, GFullPoll_options, GFullPollOption {
  @override
  String get G__typename;
  @override
  BuiltList<GFullUser_polls_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_polls_poll_options_votes
    implements
        GFullOwnerPoll_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_pollsWithVotes implements GFullPollUser {
  @override
  String get G__typename;
  @override
  GFullUser_pollsWithVotes_poll get poll;
  @override
  BuiltList<GFullUser_pollsWithVotes_userVotes> get userVotes;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_pollsWithVotes_poll
    implements GFullPollUser_poll, GFullPoll {
  @override
  String get G__typename;
  @override
  BuiltList<GFullUser_pollsWithVotes_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_pollsWithVotes_poll_options
    implements GFullPollUser_poll_options, GFullPoll_options, GFullPollOption {
  @override
  String get G__typename;
  @override
  BuiltList<GFullUser_pollsWithVotes_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_pollsWithVotes_poll_options_votes
    implements
        GFullPollUser_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_pollsWithVotes_userVotes
    implements GFullPollUser_userVotes, GFullPollUserVote {
  @override
  String get G__typename;
  @override
  GFullUser_pollsWithVotes_userVotes_option get option;
  @override
  GFullUser_pollsWithVotes_userVotes_vote get vote;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_pollsWithVotes_userVotes_option
    implements
        GFullPollUser_userVotes_option,
        GFullPollUserVote_option,
        GFullPollOption {
  @override
  String get G__typename;
  @override
  BuiltList<GFullUser_pollsWithVotes_userVotes_option_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_pollsWithVotes_userVotes_option_votes
    implements
        GFullPollUser_userVotes_option_votes,
        GFullPollUserVote_option_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUser_pollsWithVotes_userVotes_vote
    implements
        GFullPollUser_userVotes_vote,
        GFullPollUserVote_vote,
        GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullUserData
    implements Built<GFullUserData, GFullUserDataBuilder>, GFullUser {
  GFullUserData._();

  factory GFullUserData([Function(GFullUserDataBuilder b) updates]) =
      _$GFullUserData;

  static void _initializeBuilder(GFullUserDataBuilder b) =>
      b..G__typename = 'User';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get id;
  @override
  String? get name;
  @override
  String get refreshToken;
  @override
  BuiltList<GFullUserData_polls> get polls;
  @override
  BuiltList<GFullUserData_pollsWithVotes> get pollsWithVotes;
  static Serializer<GFullUserData> get serializer => _$gFullUserDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData.serializer,
        json,
      );
}

abstract class GFullUserData_polls
    implements
        Built<GFullUserData_polls, GFullUserData_pollsBuilder>,
        GFullUser_polls,
        GFullOwnerPoll {
  GFullUserData_polls._();

  factory GFullUserData_polls(
      [Function(GFullUserData_pollsBuilder b) updates]) = _$GFullUserData_polls;

  static void _initializeBuilder(GFullUserData_pollsBuilder b) =>
      b..G__typename = 'OwnerPoll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get adminShareToken;
  @override
  String get voterShareToken;
  @override
  BuiltList<GFullUserData_polls_votes> get votes;
  @override
  GFullUserData_polls_poll get poll;
  static Serializer<GFullUserData_polls> get serializer =>
      _$gFullUserDataPollsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_polls.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_polls? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_polls.serializer,
        json,
      );
}

abstract class GFullUserData_polls_votes
    implements
        Built<GFullUserData_polls_votes, GFullUserData_polls_votesBuilder>,
        GFullUser_polls_votes,
        GFullOwnerPoll_votes,
        GFullPollOptionVote {
  GFullUserData_polls_votes._();

  factory GFullUserData_polls_votes(
          [Function(GFullUserData_polls_votesBuilder b) updates]) =
      _$GFullUserData_polls_votes;

  static void _initializeBuilder(GFullUserData_polls_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_polls_votes> get serializer =>
      _$gFullUserDataPollsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_polls_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_polls_votes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_polls_votes.serializer,
        json,
      );
}

abstract class GFullUserData_polls_poll
    implements
        Built<GFullUserData_polls_poll, GFullUserData_polls_pollBuilder>,
        GFullUser_polls_poll,
        GFullOwnerPoll_poll,
        GFullPoll {
  GFullUserData_polls_poll._();

  factory GFullUserData_polls_poll(
          [Function(GFullUserData_polls_pollBuilder b) updates]) =
      _$GFullUserData_polls_poll;

  static void _initializeBuilder(GFullUserData_polls_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullUserData_polls_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_polls_poll> get serializer =>
      _$gFullUserDataPollsPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_polls_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_polls_poll? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_polls_poll.serializer,
        json,
      );
}

abstract class GFullUserData_polls_poll_options
    implements
        Built<GFullUserData_polls_poll_options,
            GFullUserData_polls_poll_optionsBuilder>,
        GFullUser_polls_poll_options,
        GFullOwnerPoll_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GFullUserData_polls_poll_options._();

  factory GFullUserData_polls_poll_options(
          [Function(GFullUserData_polls_poll_optionsBuilder b) updates]) =
      _$GFullUserData_polls_poll_options;

  static void _initializeBuilder(GFullUserData_polls_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullUserData_polls_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_polls_poll_options> get serializer =>
      _$gFullUserDataPollsPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_polls_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_polls_poll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_polls_poll_options.serializer,
        json,
      );
}

abstract class GFullUserData_polls_poll_options_votes
    implements
        Built<GFullUserData_polls_poll_options_votes,
            GFullUserData_polls_poll_options_votesBuilder>,
        GFullUser_polls_poll_options_votes,
        GFullOwnerPoll_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullUserData_polls_poll_options_votes._();

  factory GFullUserData_polls_poll_options_votes(
          [Function(GFullUserData_polls_poll_options_votesBuilder b) updates]) =
      _$GFullUserData_polls_poll_options_votes;

  static void _initializeBuilder(
          GFullUserData_polls_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_polls_poll_options_votes> get serializer =>
      _$gFullUserDataPollsPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_polls_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_polls_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_polls_poll_options_votes.serializer,
        json,
      );
}

abstract class GFullUserData_pollsWithVotes
    implements
        Built<GFullUserData_pollsWithVotes,
            GFullUserData_pollsWithVotesBuilder>,
        GFullUser_pollsWithVotes,
        GFullPollUser {
  GFullUserData_pollsWithVotes._();

  factory GFullUserData_pollsWithVotes(
          [Function(GFullUserData_pollsWithVotesBuilder b) updates]) =
      _$GFullUserData_pollsWithVotes;

  static void _initializeBuilder(GFullUserData_pollsWithVotesBuilder b) =>
      b..G__typename = 'PollUser';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GFullUserData_pollsWithVotes_poll get poll;
  @override
  BuiltList<GFullUserData_pollsWithVotes_userVotes> get userVotes;
  static Serializer<GFullUserData_pollsWithVotes> get serializer =>
      _$gFullUserDataPollsWithVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_pollsWithVotes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_pollsWithVotes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_pollsWithVotes.serializer,
        json,
      );
}

abstract class GFullUserData_pollsWithVotes_poll
    implements
        Built<GFullUserData_pollsWithVotes_poll,
            GFullUserData_pollsWithVotes_pollBuilder>,
        GFullUser_pollsWithVotes_poll,
        GFullPollUser_poll,
        GFullPoll {
  GFullUserData_pollsWithVotes_poll._();

  factory GFullUserData_pollsWithVotes_poll(
          [Function(GFullUserData_pollsWithVotes_pollBuilder b) updates]) =
      _$GFullUserData_pollsWithVotes_poll;

  static void _initializeBuilder(GFullUserData_pollsWithVotes_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullUserData_pollsWithVotes_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_pollsWithVotes_poll> get serializer =>
      _$gFullUserDataPollsWithVotesPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_pollsWithVotes_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_pollsWithVotes_poll? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_pollsWithVotes_poll.serializer,
        json,
      );
}

abstract class GFullUserData_pollsWithVotes_poll_options
    implements
        Built<GFullUserData_pollsWithVotes_poll_options,
            GFullUserData_pollsWithVotes_poll_optionsBuilder>,
        GFullUser_pollsWithVotes_poll_options,
        GFullPollUser_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GFullUserData_pollsWithVotes_poll_options._();

  factory GFullUserData_pollsWithVotes_poll_options(
      [Function(GFullUserData_pollsWithVotes_poll_optionsBuilder b)
          updates]) = _$GFullUserData_pollsWithVotes_poll_options;

  static void _initializeBuilder(
          GFullUserData_pollsWithVotes_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullUserData_pollsWithVotes_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_pollsWithVotes_poll_options> get serializer =>
      _$gFullUserDataPollsWithVotesPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_pollsWithVotes_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_pollsWithVotes_poll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_pollsWithVotes_poll_options.serializer,
        json,
      );
}

abstract class GFullUserData_pollsWithVotes_poll_options_votes
    implements
        Built<GFullUserData_pollsWithVotes_poll_options_votes,
            GFullUserData_pollsWithVotes_poll_options_votesBuilder>,
        GFullUser_pollsWithVotes_poll_options_votes,
        GFullPollUser_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullUserData_pollsWithVotes_poll_options_votes._();

  factory GFullUserData_pollsWithVotes_poll_options_votes(
      [Function(GFullUserData_pollsWithVotes_poll_options_votesBuilder b)
          updates]) = _$GFullUserData_pollsWithVotes_poll_options_votes;

  static void _initializeBuilder(
          GFullUserData_pollsWithVotes_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_pollsWithVotes_poll_options_votes>
      get serializer => _$gFullUserDataPollsWithVotesPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_pollsWithVotes_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_pollsWithVotes_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_pollsWithVotes_poll_options_votes.serializer,
        json,
      );
}

abstract class GFullUserData_pollsWithVotes_userVotes
    implements
        Built<GFullUserData_pollsWithVotes_userVotes,
            GFullUserData_pollsWithVotes_userVotesBuilder>,
        GFullUser_pollsWithVotes_userVotes,
        GFullPollUser_userVotes,
        GFullPollUserVote {
  GFullUserData_pollsWithVotes_userVotes._();

  factory GFullUserData_pollsWithVotes_userVotes(
          [Function(GFullUserData_pollsWithVotes_userVotesBuilder b) updates]) =
      _$GFullUserData_pollsWithVotes_userVotes;

  static void _initializeBuilder(
          GFullUserData_pollsWithVotes_userVotesBuilder b) =>
      b..G__typename = 'PollUserVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GFullUserData_pollsWithVotes_userVotes_option get option;
  @override
  GFullUserData_pollsWithVotes_userVotes_vote get vote;
  static Serializer<GFullUserData_pollsWithVotes_userVotes> get serializer =>
      _$gFullUserDataPollsWithVotesUserVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_pollsWithVotes_userVotes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_pollsWithVotes_userVotes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_pollsWithVotes_userVotes.serializer,
        json,
      );
}

abstract class GFullUserData_pollsWithVotes_userVotes_option
    implements
        Built<GFullUserData_pollsWithVotes_userVotes_option,
            GFullUserData_pollsWithVotes_userVotes_optionBuilder>,
        GFullUser_pollsWithVotes_userVotes_option,
        GFullPollUser_userVotes_option,
        GFullPollUserVote_option,
        GFullPollOption {
  GFullUserData_pollsWithVotes_userVotes_option._();

  factory GFullUserData_pollsWithVotes_userVotes_option(
      [Function(GFullUserData_pollsWithVotes_userVotes_optionBuilder b)
          updates]) = _$GFullUserData_pollsWithVotes_userVotes_option;

  static void _initializeBuilder(
          GFullUserData_pollsWithVotes_userVotes_optionBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullUserData_pollsWithVotes_userVotes_option_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_pollsWithVotes_userVotes_option>
      get serializer => _$gFullUserDataPollsWithVotesUserVotesOptionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_pollsWithVotes_userVotes_option.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_pollsWithVotes_userVotes_option? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_pollsWithVotes_userVotes_option.serializer,
        json,
      );
}

abstract class GFullUserData_pollsWithVotes_userVotes_option_votes
    implements
        Built<GFullUserData_pollsWithVotes_userVotes_option_votes,
            GFullUserData_pollsWithVotes_userVotes_option_votesBuilder>,
        GFullUser_pollsWithVotes_userVotes_option_votes,
        GFullPollUser_userVotes_option_votes,
        GFullPollUserVote_option_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullUserData_pollsWithVotes_userVotes_option_votes._();

  factory GFullUserData_pollsWithVotes_userVotes_option_votes(
      [Function(GFullUserData_pollsWithVotes_userVotes_option_votesBuilder b)
          updates]) = _$GFullUserData_pollsWithVotes_userVotes_option_votes;

  static void _initializeBuilder(
          GFullUserData_pollsWithVotes_userVotes_option_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_pollsWithVotes_userVotes_option_votes>
      get serializer =>
          _$gFullUserDataPollsWithVotesUserVotesOptionVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_pollsWithVotes_userVotes_option_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_pollsWithVotes_userVotes_option_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_pollsWithVotes_userVotes_option_votes.serializer,
        json,
      );
}

abstract class GFullUserData_pollsWithVotes_userVotes_vote
    implements
        Built<GFullUserData_pollsWithVotes_userVotes_vote,
            GFullUserData_pollsWithVotes_userVotes_voteBuilder>,
        GFullUser_pollsWithVotes_userVotes_vote,
        GFullPollUser_userVotes_vote,
        GFullPollUserVote_vote,
        GFullPollOptionVote {
  GFullUserData_pollsWithVotes_userVotes_vote._();

  factory GFullUserData_pollsWithVotes_userVotes_vote(
      [Function(GFullUserData_pollsWithVotes_userVotes_voteBuilder b)
          updates]) = _$GFullUserData_pollsWithVotes_userVotes_vote;

  static void _initializeBuilder(
          GFullUserData_pollsWithVotes_userVotes_voteBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullUserData_pollsWithVotes_userVotes_vote>
      get serializer => _$gFullUserDataPollsWithVotesUserVotesVoteSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserData_pollsWithVotes_userVotes_vote.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserData_pollsWithVotes_userVotes_vote? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserData_pollsWithVotes_userVotes_vote.serializer,
        json,
      );
}

abstract class GFullPollUser {
  String get G__typename;
  GFullPollUser_poll get poll;
  BuiltList<GFullPollUser_userVotes> get userVotes;
  Map<String, dynamic> toJson();
}

abstract class GFullPollUser_poll implements GFullPoll {
  @override
  String get G__typename;
  @override
  BuiltList<GFullPollUser_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUser_poll_options
    implements GFullPoll_options, GFullPollOption {
  @override
  String get G__typename;
  @override
  BuiltList<GFullPollUser_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUser_poll_options_votes
    implements
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUser_userVotes implements GFullPollUserVote {
  @override
  String get G__typename;
  @override
  GFullPollUser_userVotes_option get option;
  @override
  GFullPollUser_userVotes_vote get vote;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUser_userVotes_option
    implements GFullPollUserVote_option, GFullPollOption {
  @override
  String get G__typename;
  @override
  BuiltList<GFullPollUser_userVotes_option_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUser_userVotes_option_votes
    implements
        GFullPollUserVote_option_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUser_userVotes_vote
    implements GFullPollUserVote_vote, GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUserData
    implements
        Built<GFullPollUserData, GFullPollUserDataBuilder>,
        GFullPollUser {
  GFullPollUserData._();

  factory GFullPollUserData([Function(GFullPollUserDataBuilder b) updates]) =
      _$GFullPollUserData;

  static void _initializeBuilder(GFullPollUserDataBuilder b) =>
      b..G__typename = 'PollUser';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GFullPollUserData_poll get poll;
  @override
  BuiltList<GFullPollUserData_userVotes> get userVotes;
  static Serializer<GFullPollUserData> get serializer =>
      _$gFullPollUserDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserData.serializer,
        json,
      );
}

abstract class GFullPollUserData_poll
    implements
        Built<GFullPollUserData_poll, GFullPollUserData_pollBuilder>,
        GFullPollUser_poll,
        GFullPoll {
  GFullPollUserData_poll._();

  factory GFullPollUserData_poll(
          [Function(GFullPollUserData_pollBuilder b) updates]) =
      _$GFullPollUserData_poll;

  static void _initializeBuilder(GFullPollUserData_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullPollUserData_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserData_poll> get serializer =>
      _$gFullPollUserDataPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserData_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserData_poll? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserData_poll.serializer,
        json,
      );
}

abstract class GFullPollUserData_poll_options
    implements
        Built<GFullPollUserData_poll_options,
            GFullPollUserData_poll_optionsBuilder>,
        GFullPollUser_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GFullPollUserData_poll_options._();

  factory GFullPollUserData_poll_options(
          [Function(GFullPollUserData_poll_optionsBuilder b) updates]) =
      _$GFullPollUserData_poll_options;

  static void _initializeBuilder(GFullPollUserData_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullPollUserData_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserData_poll_options> get serializer =>
      _$gFullPollUserDataPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserData_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserData_poll_options? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserData_poll_options.serializer,
        json,
      );
}

abstract class GFullPollUserData_poll_options_votes
    implements
        Built<GFullPollUserData_poll_options_votes,
            GFullPollUserData_poll_options_votesBuilder>,
        GFullPollUser_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullPollUserData_poll_options_votes._();

  factory GFullPollUserData_poll_options_votes(
          [Function(GFullPollUserData_poll_options_votesBuilder b) updates]) =
      _$GFullPollUserData_poll_options_votes;

  static void _initializeBuilder(
          GFullPollUserData_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserData_poll_options_votes> get serializer =>
      _$gFullPollUserDataPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserData_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserData_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserData_poll_options_votes.serializer,
        json,
      );
}

abstract class GFullPollUserData_userVotes
    implements
        Built<GFullPollUserData_userVotes, GFullPollUserData_userVotesBuilder>,
        GFullPollUser_userVotes,
        GFullPollUserVote {
  GFullPollUserData_userVotes._();

  factory GFullPollUserData_userVotes(
          [Function(GFullPollUserData_userVotesBuilder b) updates]) =
      _$GFullPollUserData_userVotes;

  static void _initializeBuilder(GFullPollUserData_userVotesBuilder b) =>
      b..G__typename = 'PollUserVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GFullPollUserData_userVotes_option get option;
  @override
  GFullPollUserData_userVotes_vote get vote;
  static Serializer<GFullPollUserData_userVotes> get serializer =>
      _$gFullPollUserDataUserVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserData_userVotes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserData_userVotes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserData_userVotes.serializer,
        json,
      );
}

abstract class GFullPollUserData_userVotes_option
    implements
        Built<GFullPollUserData_userVotes_option,
            GFullPollUserData_userVotes_optionBuilder>,
        GFullPollUser_userVotes_option,
        GFullPollUserVote_option,
        GFullPollOption {
  GFullPollUserData_userVotes_option._();

  factory GFullPollUserData_userVotes_option(
          [Function(GFullPollUserData_userVotes_optionBuilder b) updates]) =
      _$GFullPollUserData_userVotes_option;

  static void _initializeBuilder(GFullPollUserData_userVotes_optionBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullPollUserData_userVotes_option_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserData_userVotes_option> get serializer =>
      _$gFullPollUserDataUserVotesOptionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserData_userVotes_option.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserData_userVotes_option? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserData_userVotes_option.serializer,
        json,
      );
}

abstract class GFullPollUserData_userVotes_option_votes
    implements
        Built<GFullPollUserData_userVotes_option_votes,
            GFullPollUserData_userVotes_option_votesBuilder>,
        GFullPollUser_userVotes_option_votes,
        GFullPollUserVote_option_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullPollUserData_userVotes_option_votes._();

  factory GFullPollUserData_userVotes_option_votes(
      [Function(GFullPollUserData_userVotes_option_votesBuilder b)
          updates]) = _$GFullPollUserData_userVotes_option_votes;

  static void _initializeBuilder(
          GFullPollUserData_userVotes_option_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserData_userVotes_option_votes> get serializer =>
      _$gFullPollUserDataUserVotesOptionVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserData_userVotes_option_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserData_userVotes_option_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserData_userVotes_option_votes.serializer,
        json,
      );
}

abstract class GFullPollUserData_userVotes_vote
    implements
        Built<GFullPollUserData_userVotes_vote,
            GFullPollUserData_userVotes_voteBuilder>,
        GFullPollUser_userVotes_vote,
        GFullPollUserVote_vote,
        GFullPollOptionVote {
  GFullPollUserData_userVotes_vote._();

  factory GFullPollUserData_userVotes_vote(
          [Function(GFullPollUserData_userVotes_voteBuilder b) updates]) =
      _$GFullPollUserData_userVotes_vote;

  static void _initializeBuilder(GFullPollUserData_userVotes_voteBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserData_userVotes_vote> get serializer =>
      _$gFullPollUserDataUserVotesVoteSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserData_userVotes_vote.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserData_userVotes_vote? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserData_userVotes_vote.serializer,
        json,
      );
}

abstract class GFullPollUserVote {
  String get G__typename;
  GFullPollUserVote_option get option;
  GFullPollUserVote_vote get vote;
  Map<String, dynamic> toJson();
}

abstract class GFullPollUserVote_option implements GFullPollOption {
  @override
  String get G__typename;
  @override
  BuiltList<GFullPollUserVote_option_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUserVote_option_votes
    implements GFullPollOption_votes, GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUserVote_vote implements GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollUserVoteData
    implements
        Built<GFullPollUserVoteData, GFullPollUserVoteDataBuilder>,
        GFullPollUserVote {
  GFullPollUserVoteData._();

  factory GFullPollUserVoteData(
          [Function(GFullPollUserVoteDataBuilder b) updates]) =
      _$GFullPollUserVoteData;

  static void _initializeBuilder(GFullPollUserVoteDataBuilder b) =>
      b..G__typename = 'PollUserVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GFullPollUserVoteData_option get option;
  @override
  GFullPollUserVoteData_vote get vote;
  static Serializer<GFullPollUserVoteData> get serializer =>
      _$gFullPollUserVoteDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserVoteData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserVoteData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserVoteData.serializer,
        json,
      );
}

abstract class GFullPollUserVoteData_option
    implements
        Built<GFullPollUserVoteData_option,
            GFullPollUserVoteData_optionBuilder>,
        GFullPollUserVote_option,
        GFullPollOption {
  GFullPollUserVoteData_option._();

  factory GFullPollUserVoteData_option(
          [Function(GFullPollUserVoteData_optionBuilder b) updates]) =
      _$GFullPollUserVoteData_option;

  static void _initializeBuilder(GFullPollUserVoteData_optionBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullPollUserVoteData_option_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserVoteData_option> get serializer =>
      _$gFullPollUserVoteDataOptionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserVoteData_option.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserVoteData_option? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserVoteData_option.serializer,
        json,
      );
}

abstract class GFullPollUserVoteData_option_votes
    implements
        Built<GFullPollUserVoteData_option_votes,
            GFullPollUserVoteData_option_votesBuilder>,
        GFullPollUserVote_option_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullPollUserVoteData_option_votes._();

  factory GFullPollUserVoteData_option_votes(
          [Function(GFullPollUserVoteData_option_votesBuilder b) updates]) =
      _$GFullPollUserVoteData_option_votes;

  static void _initializeBuilder(GFullPollUserVoteData_option_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserVoteData_option_votes> get serializer =>
      _$gFullPollUserVoteDataOptionVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserVoteData_option_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserVoteData_option_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserVoteData_option_votes.serializer,
        json,
      );
}

abstract class GFullPollUserVoteData_vote
    implements
        Built<GFullPollUserVoteData_vote, GFullPollUserVoteData_voteBuilder>,
        GFullPollUserVote_vote,
        GFullPollOptionVote {
  GFullPollUserVoteData_vote._();

  factory GFullPollUserVoteData_vote(
          [Function(GFullPollUserVoteData_voteBuilder b) updates]) =
      _$GFullPollUserVoteData_vote;

  static void _initializeBuilder(GFullPollUserVoteData_voteBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollUserVoteData_vote> get serializer =>
      _$gFullPollUserVoteDataVoteSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollUserVoteData_vote.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollUserVoteData_vote? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollUserVoteData_vote.serializer,
        json,
      );
}

abstract class GFullOwnerPoll {
  String get G__typename;
  String get adminShareToken;
  String get voterShareToken;
  BuiltList<GFullOwnerPoll_votes> get votes;
  GFullOwnerPoll_poll get poll;
  Map<String, dynamic> toJson();
}

abstract class GFullOwnerPoll_votes implements GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullOwnerPoll_poll implements GFullPoll {
  @override
  String get G__typename;
  @override
  BuiltList<GFullOwnerPoll_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullOwnerPoll_poll_options
    implements GFullPoll_options, GFullPollOption {
  @override
  String get G__typename;
  @override
  BuiltList<GFullOwnerPoll_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullOwnerPoll_poll_options_votes
    implements
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullOwnerPollData
    implements
        Built<GFullOwnerPollData, GFullOwnerPollDataBuilder>,
        GFullOwnerPoll {
  GFullOwnerPollData._();

  factory GFullOwnerPollData([Function(GFullOwnerPollDataBuilder b) updates]) =
      _$GFullOwnerPollData;

  static void _initializeBuilder(GFullOwnerPollDataBuilder b) =>
      b..G__typename = 'OwnerPoll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get adminShareToken;
  @override
  String get voterShareToken;
  @override
  BuiltList<GFullOwnerPollData_votes> get votes;
  @override
  GFullOwnerPollData_poll get poll;
  static Serializer<GFullOwnerPollData> get serializer =>
      _$gFullOwnerPollDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullOwnerPollData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullOwnerPollData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullOwnerPollData.serializer,
        json,
      );
}

abstract class GFullOwnerPollData_votes
    implements
        Built<GFullOwnerPollData_votes, GFullOwnerPollData_votesBuilder>,
        GFullOwnerPoll_votes,
        GFullPollOptionVote {
  GFullOwnerPollData_votes._();

  factory GFullOwnerPollData_votes(
          [Function(GFullOwnerPollData_votesBuilder b) updates]) =
      _$GFullOwnerPollData_votes;

  static void _initializeBuilder(GFullOwnerPollData_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullOwnerPollData_votes> get serializer =>
      _$gFullOwnerPollDataVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullOwnerPollData_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullOwnerPollData_votes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullOwnerPollData_votes.serializer,
        json,
      );
}

abstract class GFullOwnerPollData_poll
    implements
        Built<GFullOwnerPollData_poll, GFullOwnerPollData_pollBuilder>,
        GFullOwnerPoll_poll,
        GFullPoll {
  GFullOwnerPollData_poll._();

  factory GFullOwnerPollData_poll(
          [Function(GFullOwnerPollData_pollBuilder b) updates]) =
      _$GFullOwnerPollData_poll;

  static void _initializeBuilder(GFullOwnerPollData_pollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullOwnerPollData_poll_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullOwnerPollData_poll> get serializer =>
      _$gFullOwnerPollDataPollSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullOwnerPollData_poll.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullOwnerPollData_poll? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullOwnerPollData_poll.serializer,
        json,
      );
}

abstract class GFullOwnerPollData_poll_options
    implements
        Built<GFullOwnerPollData_poll_options,
            GFullOwnerPollData_poll_optionsBuilder>,
        GFullOwnerPoll_poll_options,
        GFullPoll_options,
        GFullPollOption {
  GFullOwnerPollData_poll_options._();

  factory GFullOwnerPollData_poll_options(
          [Function(GFullOwnerPollData_poll_optionsBuilder b) updates]) =
      _$GFullOwnerPollData_poll_options;

  static void _initializeBuilder(GFullOwnerPollData_poll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullOwnerPollData_poll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullOwnerPollData_poll_options> get serializer =>
      _$gFullOwnerPollDataPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullOwnerPollData_poll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullOwnerPollData_poll_options? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullOwnerPollData_poll_options.serializer,
        json,
      );
}

abstract class GFullOwnerPollData_poll_options_votes
    implements
        Built<GFullOwnerPollData_poll_options_votes,
            GFullOwnerPollData_poll_options_votesBuilder>,
        GFullOwnerPoll_poll_options_votes,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullOwnerPollData_poll_options_votes._();

  factory GFullOwnerPollData_poll_options_votes(
          [Function(GFullOwnerPollData_poll_options_votesBuilder b) updates]) =
      _$GFullOwnerPollData_poll_options_votes;

  static void _initializeBuilder(
          GFullOwnerPollData_poll_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullOwnerPollData_poll_options_votes> get serializer =>
      _$gFullOwnerPollDataPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullOwnerPollData_poll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullOwnerPollData_poll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullOwnerPollData_poll_options_votes.serializer,
        json,
      );
}

abstract class GFullPoll {
  String get G__typename;
  BuiltList<GFullPoll_options> get options;
  int get id;
  int get userId;
  String get title;
  String? get subtitle;
  String get body;
  String? get pollKind;
  String? get formJsonSchema;
  _i2.GDate get createdAt;
  Map<String, dynamic> toJson();
}

abstract class GFullPoll_options implements GFullPollOption {
  @override
  String get G__typename;
  @override
  BuiltList<GFullPoll_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPoll_options_votes
    implements GFullPollOption_votes, GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollData
    implements Built<GFullPollData, GFullPollDataBuilder>, GFullPoll {
  GFullPollData._();

  factory GFullPollData([Function(GFullPollDataBuilder b) updates]) =
      _$GFullPollData;

  static void _initializeBuilder(GFullPollDataBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullPollData_options> get options;
  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get body;
  @override
  String? get pollKind;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollData> get serializer => _$gFullPollDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollData.serializer,
        json,
      );
}

abstract class GFullPollData_options
    implements
        Built<GFullPollData_options, GFullPollData_optionsBuilder>,
        GFullPoll_options,
        GFullPollOption {
  GFullPollData_options._();

  factory GFullPollData_options(
          [Function(GFullPollData_optionsBuilder b) updates]) =
      _$GFullPollData_options;

  static void _initializeBuilder(GFullPollData_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullPollData_options_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollData_options> get serializer =>
      _$gFullPollDataOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollData_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollData_options? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollData_options.serializer,
        json,
      );
}

abstract class GFullPollData_options_votes
    implements
        Built<GFullPollData_options_votes, GFullPollData_options_votesBuilder>,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullPollData_options_votes._();

  factory GFullPollData_options_votes(
          [Function(GFullPollData_options_votesBuilder b) updates]) =
      _$GFullPollData_options_votes;

  static void _initializeBuilder(GFullPollData_options_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollData_options_votes> get serializer =>
      _$gFullPollDataOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollData_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollData_options_votes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollData_options_votes.serializer,
        json,
      );
}

abstract class GFullPollOption {
  String get G__typename;
  BuiltList<GFullPollOption_votes> get votes;
  int get id;
  int get pollId;
  int? get priority;
  String? get description;
  String? get url;
  String? get formJsonSchema;
  _i2.GDate get createdAt;
  Map<String, dynamic> toJson();
}

abstract class GFullPollOption_votes implements GFullPollOptionVote {
  @override
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFullPollOptionData
    implements
        Built<GFullPollOptionData, GFullPollOptionDataBuilder>,
        GFullPollOption {
  GFullPollOptionData._();

  factory GFullPollOptionData(
      [Function(GFullPollOptionDataBuilder b) updates]) = _$GFullPollOptionData;

  static void _initializeBuilder(GFullPollOptionDataBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFullPollOptionData_votes> get votes;
  @override
  int get id;
  @override
  int get pollId;
  @override
  int? get priority;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get formJsonSchema;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollOptionData> get serializer =>
      _$gFullPollOptionDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollOptionData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollOptionData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollOptionData.serializer,
        json,
      );
}

abstract class GFullPollOptionData_votes
    implements
        Built<GFullPollOptionData_votes, GFullPollOptionData_votesBuilder>,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GFullPollOptionData_votes._();

  factory GFullPollOptionData_votes(
          [Function(GFullPollOptionData_votesBuilder b) updates]) =
      _$GFullPollOptionData_votes;

  static void _initializeBuilder(GFullPollOptionData_votesBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollOptionData_votes> get serializer =>
      _$gFullPollOptionDataVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollOptionData_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollOptionData_votes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollOptionData_votes.serializer,
        json,
      );
}

abstract class GFullPollOptionVote {
  String get G__typename;
  int get pollOptionId;
  int get userId;
  int get value;
  String? get formResponse;
  _i2.GDate get createdAt;
  Map<String, dynamic> toJson();
}

abstract class GFullPollOptionVoteData
    implements
        Built<GFullPollOptionVoteData, GFullPollOptionVoteDataBuilder>,
        GFullPollOptionVote {
  GFullPollOptionVoteData._();

  factory GFullPollOptionVoteData(
          [Function(GFullPollOptionVoteDataBuilder b) updates]) =
      _$GFullPollOptionVoteData;

  static void _initializeBuilder(GFullPollOptionVoteDataBuilder b) =>
      b..G__typename = 'PollOptionVote';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get pollOptionId;
  @override
  int get userId;
  @override
  int get value;
  @override
  String? get formResponse;
  @override
  _i2.GDate get createdAt;
  static Serializer<GFullPollOptionVoteData> get serializer =>
      _$gFullPollOptionVoteDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollOptionVoteData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollOptionVoteData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollOptionVoteData.serializer,
        json,
      );
}
