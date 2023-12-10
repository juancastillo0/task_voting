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

abstract class GgetUserData
    implements Built<GgetUserData, GgetUserDataBuilder> {
  GgetUserData._();

  factory GgetUserData([Function(GgetUserDataBuilder b) updates]) =
      _$GgetUserData;

  static void _initializeBuilder(GgetUserDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GgetUserData_registerUser get registerUser;
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

abstract class GgetUserData_registerUser
    implements
        Built<GgetUserData_registerUser, GgetUserData_registerUserBuilder>,
        GFullUser {
  GgetUserData_registerUser._();

  factory GgetUserData_registerUser(
          [Function(GgetUserData_registerUserBuilder b) updates]) =
      _$GgetUserData_registerUser;

  static void _initializeBuilder(GgetUserData_registerUserBuilder b) =>
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
  static Serializer<GgetUserData_registerUser> get serializer =>
      _$ggetUserDataRegisterUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetUserData_registerUser.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserData_registerUser? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetUserData_registerUser.serializer,
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
        GFullPoll {
  GinsertPollData_insertPoll._();

  factory GinsertPollData_insertPoll(
          [Function(GinsertPollData_insertPollBuilder b) updates]) =
      _$GinsertPollData_insertPoll;

  static void _initializeBuilder(GinsertPollData_insertPollBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GinsertPollData_insertPoll_options> get options;
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

abstract class GinsertPollData_insertPoll_options
    implements
        Built<GinsertPollData_insertPoll_options,
            GinsertPollData_insertPoll_optionsBuilder>,
        GFullPoll_options,
        GFullPollOption {
  GinsertPollData_insertPoll_options._();

  factory GinsertPollData_insertPoll_options(
          [Function(GinsertPollData_insertPoll_optionsBuilder b) updates]) =
      _$GinsertPollData_insertPoll_options;

  static void _initializeBuilder(GinsertPollData_insertPoll_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GinsertPollData_insertPoll_options_votes> get votes;
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
  static Serializer<GinsertPollData_insertPoll_options> get serializer =>
      _$ginsertPollDataInsertPollOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollData_insertPoll_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollData_insertPoll_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollData_insertPoll_options.serializer,
        json,
      );
}

abstract class GinsertPollData_insertPoll_options_votes
    implements
        Built<GinsertPollData_insertPoll_options_votes,
            GinsertPollData_insertPoll_options_votesBuilder>,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GinsertPollData_insertPoll_options_votes._();

  factory GinsertPollData_insertPoll_options_votes(
      [Function(GinsertPollData_insertPoll_options_votesBuilder b)
          updates]) = _$GinsertPollData_insertPoll_options_votes;

  static void _initializeBuilder(
          GinsertPollData_insertPoll_options_votesBuilder b) =>
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
  static Serializer<GinsertPollData_insertPoll_options_votes> get serializer =>
      _$ginsertPollDataInsertPollOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollData_insertPoll_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollData_insertPoll_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollData_insertPoll_options_votes.serializer,
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
        GFullPoll {
  GaddPollOptionsData_addPollOptions._();

  factory GaddPollOptionsData_addPollOptions(
          [Function(GaddPollOptionsData_addPollOptionsBuilder b) updates]) =
      _$GaddPollOptionsData_addPollOptions;

  static void _initializeBuilder(GaddPollOptionsData_addPollOptionsBuilder b) =>
      b..G__typename = 'Poll';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GaddPollOptionsData_addPollOptions_options> get options;
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

abstract class GaddPollOptionsData_addPollOptions_options
    implements
        Built<GaddPollOptionsData_addPollOptions_options,
            GaddPollOptionsData_addPollOptions_optionsBuilder>,
        GFullPoll_options,
        GFullPollOption {
  GaddPollOptionsData_addPollOptions_options._();

  factory GaddPollOptionsData_addPollOptions_options(
      [Function(GaddPollOptionsData_addPollOptions_optionsBuilder b)
          updates]) = _$GaddPollOptionsData_addPollOptions_options;

  static void _initializeBuilder(
          GaddPollOptionsData_addPollOptions_optionsBuilder b) =>
      b..G__typename = 'PollOption';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GaddPollOptionsData_addPollOptions_options_votes> get votes;
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
  static Serializer<GaddPollOptionsData_addPollOptions_options>
      get serializer => _$gaddPollOptionsDataAddPollOptionsOptionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsData_addPollOptions_options.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsData_addPollOptions_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsData_addPollOptions_options.serializer,
        json,
      );
}

abstract class GaddPollOptionsData_addPollOptions_options_votes
    implements
        Built<GaddPollOptionsData_addPollOptions_options_votes,
            GaddPollOptionsData_addPollOptions_options_votesBuilder>,
        GFullPoll_options_votes,
        GFullPollOption_votes,
        GFullPollOptionVote {
  GaddPollOptionsData_addPollOptions_options_votes._();

  factory GaddPollOptionsData_addPollOptions_options_votes(
      [Function(GaddPollOptionsData_addPollOptions_options_votesBuilder b)
          updates]) = _$GaddPollOptionsData_addPollOptions_options_votes;

  static void _initializeBuilder(
          GaddPollOptionsData_addPollOptions_options_votesBuilder b) =>
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
  static Serializer<GaddPollOptionsData_addPollOptions_options_votes>
      get serializer =>
          _$gaddPollOptionsDataAddPollOptionsOptionsVotesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsData_addPollOptions_options_votes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsData_addPollOptions_options_votes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsData_addPollOptions_options_votes.serializer,
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
