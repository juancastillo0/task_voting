// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/__generated__/schema.schema.gql.dart' as _i2;
import 'package:api_client/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'poll.var.gql.g.dart';

abstract class GgetPollsVars
    implements Built<GgetPollsVars, GgetPollsVarsBuilder> {
  GgetPollsVars._();

  factory GgetPollsVars([Function(GgetPollsVarsBuilder b) updates]) =
      _$GgetPollsVars;

  int? get id;
  int? get userId;
  static Serializer<GgetPollsVars> get serializer => _$ggetPollsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetPollsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetPollsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetPollsVars.serializer,
        json,
      );
}

abstract class GregisterUserVars
    implements Built<GregisterUserVars, GregisterUserVarsBuilder> {
  GregisterUserVars._();

  factory GregisterUserVars([Function(GregisterUserVarsBuilder b) updates]) =
      _$GregisterUserVars;

  String get name;
  static Serializer<GregisterUserVars> get serializer =>
      _$gregisterUserVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GregisterUserVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GregisterUserVars.serializer,
        json,
      );
}

abstract class GinsertPollVars
    implements Built<GinsertPollVars, GinsertPollVarsBuilder> {
  GinsertPollVars._();

  factory GinsertPollVars([Function(GinsertPollVarsBuilder b) updates]) =
      _$GinsertPollVars;

  _i2.GPollInsert get insert;
  static Serializer<GinsertPollVars> get serializer =>
      _$ginsertPollVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GinsertPollVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GinsertPollVars.serializer,
        json,
      );
}

abstract class GaddPollOptionsVars
    implements Built<GaddPollOptionsVars, GaddPollOptionsVarsBuilder> {
  GaddPollOptionsVars._();

  factory GaddPollOptionsVars(
      [Function(GaddPollOptionsVarsBuilder b) updates]) = _$GaddPollOptionsVars;

  int get pollId;
  BuiltList<_i2.GPollOptionInsert> get options;
  static Serializer<GaddPollOptionsVars> get serializer =>
      _$gaddPollOptionsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GaddPollOptionsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GaddPollOptionsVars.serializer,
        json,
      );
}

abstract class GvotePollVars
    implements Built<GvotePollVars, GvotePollVarsBuilder> {
  GvotePollVars._();

  factory GvotePollVars([Function(GvotePollVarsBuilder b) updates]) =
      _$GvotePollVars;

  int get pollId;
  BuiltList<_i2.GPollOptionVoteInsert> get votes;
  static Serializer<GvotePollVars> get serializer => _$gvotePollVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GvotePollVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GvotePollVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GvotePollVars.serializer,
        json,
      );
}

abstract class GFullUserVars
    implements Built<GFullUserVars, GFullUserVarsBuilder> {
  GFullUserVars._();

  factory GFullUserVars([Function(GFullUserVarsBuilder b) updates]) =
      _$GFullUserVars;

  static Serializer<GFullUserVars> get serializer => _$gFullUserVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullUserVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullUserVars.serializer,
        json,
      );
}

abstract class GFullPollVars
    implements Built<GFullPollVars, GFullPollVarsBuilder> {
  GFullPollVars._();

  factory GFullPollVars([Function(GFullPollVarsBuilder b) updates]) =
      _$GFullPollVars;

  static Serializer<GFullPollVars> get serializer => _$gFullPollVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollVars.serializer,
        json,
      );
}

abstract class GFullPollOptionVars
    implements Built<GFullPollOptionVars, GFullPollOptionVarsBuilder> {
  GFullPollOptionVars._();

  factory GFullPollOptionVars(
      [Function(GFullPollOptionVarsBuilder b) updates]) = _$GFullPollOptionVars;

  static Serializer<GFullPollOptionVars> get serializer =>
      _$gFullPollOptionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollOptionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollOptionVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollOptionVars.serializer,
        json,
      );
}

abstract class GFullPollOptionVoteVars
    implements Built<GFullPollOptionVoteVars, GFullPollOptionVoteVarsBuilder> {
  GFullPollOptionVoteVars._();

  factory GFullPollOptionVoteVars(
          [Function(GFullPollOptionVoteVarsBuilder b) updates]) =
      _$GFullPollOptionVoteVars;

  static Serializer<GFullPollOptionVoteVars> get serializer =>
      _$gFullPollOptionVoteVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFullPollOptionVoteVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollOptionVoteVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFullPollOptionVoteVars.serializer,
        json,
      );
}
