// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/__generated__/serializers.gql.dart' as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;

part 'schema.schema.gql.g.dart';

abstract class GDate implements Built<GDate, GDateBuilder> {
  GDate._();

  factory GDate([String? value]) =>
      _$GDate((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDate> get serializer => _i1.DefaultScalarSerializer<GDate>(
      (Object serialized) => GDate((serialized as String?)));
}

abstract class GPollInsert implements Built<GPollInsert, GPollInsertBuilder> {
  GPollInsert._();

  factory GPollInsert([Function(GPollInsertBuilder b) updates]) = _$GPollInsert;

  int? get id;
  String get title;
  String? get subtitle;
  String get body;
  String? get pollKind;
  String? get formJsonSchema;
  BuiltList<GPollOptionInsert>? get options;
  static Serializer<GPollInsert> get serializer => _$gPollInsertSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPollInsert.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPollInsert? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPollInsert.serializer,
        json,
      );
}

abstract class GPollOptionInsert
    implements Built<GPollOptionInsert, GPollOptionInsertBuilder> {
  GPollOptionInsert._();

  factory GPollOptionInsert([Function(GPollOptionInsertBuilder b) updates]) =
      _$GPollOptionInsert;

  int? get id;
  int? get priority;
  String? get description;
  String? get url;
  String? get formJsonSchema;
  GDate? get createdAt;
  static Serializer<GPollOptionInsert> get serializer =>
      _$gPollOptionInsertSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPollOptionInsert.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPollOptionInsert? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPollOptionInsert.serializer,
        json,
      );
}

abstract class GPollOptionVoteInsert
    implements Built<GPollOptionVoteInsert, GPollOptionVoteInsertBuilder> {
  GPollOptionVoteInsert._();

  factory GPollOptionVoteInsert(
          [Function(GPollOptionVoteInsertBuilder b) updates]) =
      _$GPollOptionVoteInsert;

  int get pollOptionId;
  int get userId;
  int get value;
  String? get formResponse;
  GDate? get createdAt;
  static Serializer<GPollOptionVoteInsert> get serializer =>
      _$gPollOptionVoteInsertSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPollOptionVoteInsert.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPollOptionVoteInsert? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPollOptionVoteInsert.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {};
