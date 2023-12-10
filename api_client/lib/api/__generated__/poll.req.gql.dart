// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/__generated__/serializers.gql.dart' as _i6;
import 'package:api_client/api/__generated__/poll.ast.gql.dart' as _i5;
import 'package:api_client/api/__generated__/poll.data.gql.dart' as _i2;
import 'package:api_client/api/__generated__/poll.var.gql.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'poll.req.gql.g.dart';

abstract class GgetPollsReq
    implements
        Built<GgetPollsReq, GgetPollsReqBuilder>,
        _i1.OperationRequest<_i2.GgetPollsData, _i3.GgetPollsVars> {
  GgetPollsReq._();

  factory GgetPollsReq([Function(GgetPollsReqBuilder b) updates]) =
      _$GgetPollsReq;

  static void _initializeBuilder(GgetPollsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'getPolls',
    )
    ..executeOnListen = true;

  @override
  _i3.GgetPollsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GgetPollsData? Function(
    _i2.GgetPollsData?,
    _i2.GgetPollsData?,
  )? get updateResult;
  @override
  _i2.GgetPollsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GgetPollsData? parseData(Map<String, dynamic> json) =>
      _i2.GgetPollsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GgetPollsData, _i3.GgetPollsVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GgetPollsReq> get serializer => _$ggetPollsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GgetPollsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetPollsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GgetPollsReq.serializer,
        json,
      );
}

abstract class GregisterUserReq
    implements
        Built<GregisterUserReq, GregisterUserReqBuilder>,
        _i1.OperationRequest<_i2.GregisterUserData, _i3.GregisterUserVars> {
  GregisterUserReq._();

  factory GregisterUserReq([Function(GregisterUserReqBuilder b) updates]) =
      _$GregisterUserReq;

  static void _initializeBuilder(GregisterUserReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'registerUser',
    )
    ..executeOnListen = true;

  @override
  _i3.GregisterUserVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GregisterUserData? Function(
    _i2.GregisterUserData?,
    _i2.GregisterUserData?,
  )? get updateResult;
  @override
  _i2.GregisterUserData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GregisterUserData? parseData(Map<String, dynamic> json) =>
      _i2.GregisterUserData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GregisterUserData, _i3.GregisterUserVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GregisterUserReq> get serializer =>
      _$gregisterUserReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GregisterUserReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GregisterUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GregisterUserReq.serializer,
        json,
      );
}

abstract class GgetUserReq
    implements
        Built<GgetUserReq, GgetUserReqBuilder>,
        _i1.OperationRequest<_i2.GgetUserData, _i3.GgetUserVars> {
  GgetUserReq._();

  factory GgetUserReq([Function(GgetUserReqBuilder b) updates]) = _$GgetUserReq;

  static void _initializeBuilder(GgetUserReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'getUser',
    )
    ..executeOnListen = true;

  @override
  _i3.GgetUserVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GgetUserData? Function(
    _i2.GgetUserData?,
    _i2.GgetUserData?,
  )? get updateResult;
  @override
  _i2.GgetUserData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GgetUserData? parseData(Map<String, dynamic> json) =>
      _i2.GgetUserData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GgetUserData, _i3.GgetUserVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GgetUserReq> get serializer => _$ggetUserReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GgetUserReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GgetUserReq.serializer,
        json,
      );
}

abstract class GinsertPollReq
    implements
        Built<GinsertPollReq, GinsertPollReqBuilder>,
        _i1.OperationRequest<_i2.GinsertPollData, _i3.GinsertPollVars> {
  GinsertPollReq._();

  factory GinsertPollReq([Function(GinsertPollReqBuilder b) updates]) =
      _$GinsertPollReq;

  static void _initializeBuilder(GinsertPollReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'insertPoll',
    )
    ..executeOnListen = true;

  @override
  _i3.GinsertPollVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GinsertPollData? Function(
    _i2.GinsertPollData?,
    _i2.GinsertPollData?,
  )? get updateResult;
  @override
  _i2.GinsertPollData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GinsertPollData? parseData(Map<String, dynamic> json) =>
      _i2.GinsertPollData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GinsertPollData, _i3.GinsertPollVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GinsertPollReq> get serializer =>
      _$ginsertPollReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GinsertPollReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GinsertPollReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GinsertPollReq.serializer,
        json,
      );
}

abstract class GaddPollOptionsReq
    implements
        Built<GaddPollOptionsReq, GaddPollOptionsReqBuilder>,
        _i1.OperationRequest<_i2.GaddPollOptionsData, _i3.GaddPollOptionsVars> {
  GaddPollOptionsReq._();

  factory GaddPollOptionsReq([Function(GaddPollOptionsReqBuilder b) updates]) =
      _$GaddPollOptionsReq;

  static void _initializeBuilder(GaddPollOptionsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'addPollOptions',
    )
    ..executeOnListen = true;

  @override
  _i3.GaddPollOptionsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GaddPollOptionsData? Function(
    _i2.GaddPollOptionsData?,
    _i2.GaddPollOptionsData?,
  )? get updateResult;
  @override
  _i2.GaddPollOptionsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GaddPollOptionsData? parseData(Map<String, dynamic> json) =>
      _i2.GaddPollOptionsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GaddPollOptionsData, _i3.GaddPollOptionsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GaddPollOptionsReq> get serializer =>
      _$gaddPollOptionsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GaddPollOptionsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GaddPollOptionsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GaddPollOptionsReq.serializer,
        json,
      );
}

abstract class GvotePollReq
    implements
        Built<GvotePollReq, GvotePollReqBuilder>,
        _i1.OperationRequest<_i2.GvotePollData, _i3.GvotePollVars> {
  GvotePollReq._();

  factory GvotePollReq([Function(GvotePollReqBuilder b) updates]) =
      _$GvotePollReq;

  static void _initializeBuilder(GvotePollReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'votePoll',
    )
    ..executeOnListen = true;

  @override
  _i3.GvotePollVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GvotePollData? Function(
    _i2.GvotePollData?,
    _i2.GvotePollData?,
  )? get updateResult;
  @override
  _i2.GvotePollData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GvotePollData? parseData(Map<String, dynamic> json) =>
      _i2.GvotePollData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GvotePollData, _i3.GvotePollVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GvotePollReq> get serializer => _$gvotePollReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GvotePollReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GvotePollReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GvotePollReq.serializer,
        json,
      );
}

abstract class GFullUserReq
    implements
        Built<GFullUserReq, GFullUserReqBuilder>,
        _i1.FragmentRequest<_i2.GFullUserData, _i3.GFullUserVars> {
  GFullUserReq._();

  factory GFullUserReq([Function(GFullUserReqBuilder b) updates]) =
      _$GFullUserReq;

  static void _initializeBuilder(GFullUserReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'FullUser';

  @override
  _i3.GFullUserVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GFullUserData? parseData(Map<String, dynamic> json) =>
      _i2.GFullUserData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  static Serializer<GFullUserReq> get serializer => _$gFullUserReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFullUserReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFullUserReq.serializer,
        json,
      );
}

abstract class GFullPollReq
    implements
        Built<GFullPollReq, GFullPollReqBuilder>,
        _i1.FragmentRequest<_i2.GFullPollData, _i3.GFullPollVars> {
  GFullPollReq._();

  factory GFullPollReq([Function(GFullPollReqBuilder b) updates]) =
      _$GFullPollReq;

  static void _initializeBuilder(GFullPollReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'FullPoll';

  @override
  _i3.GFullPollVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GFullPollData? parseData(Map<String, dynamic> json) =>
      _i2.GFullPollData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  static Serializer<GFullPollReq> get serializer => _$gFullPollReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFullPollReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFullPollReq.serializer,
        json,
      );
}

abstract class GFullPollOptionReq
    implements
        Built<GFullPollOptionReq, GFullPollOptionReqBuilder>,
        _i1.FragmentRequest<_i2.GFullPollOptionData, _i3.GFullPollOptionVars> {
  GFullPollOptionReq._();

  factory GFullPollOptionReq([Function(GFullPollOptionReqBuilder b) updates]) =
      _$GFullPollOptionReq;

  static void _initializeBuilder(GFullPollOptionReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'FullPollOption';

  @override
  _i3.GFullPollOptionVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GFullPollOptionData? parseData(Map<String, dynamic> json) =>
      _i2.GFullPollOptionData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  static Serializer<GFullPollOptionReq> get serializer =>
      _$gFullPollOptionReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFullPollOptionReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollOptionReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFullPollOptionReq.serializer,
        json,
      );
}

abstract class GFullPollOptionVoteReq
    implements
        Built<GFullPollOptionVoteReq, GFullPollOptionVoteReqBuilder>,
        _i1.FragmentRequest<_i2.GFullPollOptionVoteData,
            _i3.GFullPollOptionVoteVars> {
  GFullPollOptionVoteReq._();

  factory GFullPollOptionVoteReq(
          [Function(GFullPollOptionVoteReqBuilder b) updates]) =
      _$GFullPollOptionVoteReq;

  static void _initializeBuilder(GFullPollOptionVoteReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'FullPollOptionVote';

  @override
  _i3.GFullPollOptionVoteVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GFullPollOptionVoteData? parseData(Map<String, dynamic> json) =>
      _i2.GFullPollOptionVoteData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  static Serializer<GFullPollOptionVoteReq> get serializer =>
      _$gFullPollOptionVoteReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFullPollOptionVoteReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFullPollOptionVoteReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFullPollOptionVoteReq.serializer,
        json,
      );
}
