// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetPollsVars> _$ggetPollsVarsSerializer =
    new _$GgetPollsVarsSerializer();
Serializer<GregisterUserVars> _$gregisterUserVarsSerializer =
    new _$GregisterUserVarsSerializer();
Serializer<GinsertPollVars> _$ginsertPollVarsSerializer =
    new _$GinsertPollVarsSerializer();
Serializer<GaddPollOptionsVars> _$gaddPollOptionsVarsSerializer =
    new _$GaddPollOptionsVarsSerializer();
Serializer<GvotePollVars> _$gvotePollVarsSerializer =
    new _$GvotePollVarsSerializer();
Serializer<GFullUserVars> _$gFullUserVarsSerializer =
    new _$GFullUserVarsSerializer();
Serializer<GFullPollVars> _$gFullPollVarsSerializer =
    new _$GFullPollVarsSerializer();
Serializer<GFullPollOptionVars> _$gFullPollOptionVarsSerializer =
    new _$GFullPollOptionVarsSerializer();
Serializer<GFullPollOptionVoteVars> _$gFullPollOptionVoteVarsSerializer =
    new _$GFullPollOptionVoteVarsSerializer();

class _$GgetPollsVarsSerializer implements StructuredSerializer<GgetPollsVars> {
  @override
  final Iterable<Type> types = const [GgetPollsVars, _$GgetPollsVars];
  @override
  final String wireName = 'GgetPollsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GgetPollsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GgetPollsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetPollsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GregisterUserVarsSerializer
    implements StructuredSerializer<GregisterUserVars> {
  @override
  final Iterable<Type> types = const [GregisterUserVars, _$GregisterUserVars];
  @override
  final String wireName = 'GregisterUserVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GregisterUserVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GregisterUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GregisterUserVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GinsertPollVarsSerializer
    implements StructuredSerializer<GinsertPollVars> {
  @override
  final Iterable<Type> types = const [GinsertPollVars, _$GinsertPollVars];
  @override
  final String wireName = 'GinsertPollVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GinsertPollVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'insert',
      serializers.serialize(object.insert,
          specifiedType: const FullType(_i2.GPollInsert)),
    ];

    return result;
  }

  @override
  GinsertPollVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GinsertPollVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'insert':
          result.insert.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GPollInsert))!
              as _i2.GPollInsert);
          break;
      }
    }

    return result.build();
  }
}

class _$GaddPollOptionsVarsSerializer
    implements StructuredSerializer<GaddPollOptionsVars> {
  @override
  final Iterable<Type> types = const [
    GaddPollOptionsVars,
    _$GaddPollOptionsVars
  ];
  @override
  final String wireName = 'GaddPollOptionsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GaddPollOptionsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pollId',
      serializers.serialize(object.pollId, specifiedType: const FullType(int)),
      'options',
      serializers.serialize(object.options,
          specifiedType: const FullType(
              BuiltList, const [const FullType(_i2.GPollOptionInsert)])),
    ];

    return result;
  }

  @override
  GaddPollOptionsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GaddPollOptionsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pollId':
          result.pollId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(_i2.GPollOptionInsert)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GvotePollVarsSerializer implements StructuredSerializer<GvotePollVars> {
  @override
  final Iterable<Type> types = const [GvotePollVars, _$GvotePollVars];
  @override
  final String wireName = 'GvotePollVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GvotePollVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pollId',
      serializers.serialize(object.pollId, specifiedType: const FullType(int)),
      'votes',
      serializers.serialize(object.votes,
          specifiedType: const FullType(
              BuiltList, const [const FullType(_i2.GPollOptionVoteInsert)])),
    ];

    return result;
  }

  @override
  GvotePollVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GvotePollVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pollId':
          result.pollId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'votes':
          result.votes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(_i2.GPollOptionVoteInsert)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullUserVarsSerializer implements StructuredSerializer<GFullUserVars> {
  @override
  final Iterable<Type> types = const [GFullUserVars, _$GFullUserVars];
  @override
  final String wireName = 'GFullUserVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFullUserVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GFullUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GFullUserVarsBuilder().build();
  }
}

class _$GFullPollVarsSerializer implements StructuredSerializer<GFullPollVars> {
  @override
  final Iterable<Type> types = const [GFullPollVars, _$GFullPollVars];
  @override
  final String wireName = 'GFullPollVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFullPollVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GFullPollVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GFullPollVarsBuilder().build();
  }
}

class _$GFullPollOptionVarsSerializer
    implements StructuredSerializer<GFullPollOptionVars> {
  @override
  final Iterable<Type> types = const [
    GFullPollOptionVars,
    _$GFullPollOptionVars
  ];
  @override
  final String wireName = 'GFullPollOptionVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullPollOptionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GFullPollOptionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GFullPollOptionVarsBuilder().build();
  }
}

class _$GFullPollOptionVoteVarsSerializer
    implements StructuredSerializer<GFullPollOptionVoteVars> {
  @override
  final Iterable<Type> types = const [
    GFullPollOptionVoteVars,
    _$GFullPollOptionVoteVars
  ];
  @override
  final String wireName = 'GFullPollOptionVoteVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullPollOptionVoteVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GFullPollOptionVoteVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GFullPollOptionVoteVarsBuilder().build();
  }
}

class _$GgetPollsVars extends GgetPollsVars {
  @override
  final int? id;
  @override
  final int? userId;

  factory _$GgetPollsVars([void Function(GgetPollsVarsBuilder)? updates]) =>
      (new GgetPollsVarsBuilder()..update(updates))._build();

  _$GgetPollsVars._({this.id, this.userId}) : super._();

  @override
  GgetPollsVars rebuild(void Function(GgetPollsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetPollsVarsBuilder toBuilder() => new GgetPollsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetPollsVars && id == other.id && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetPollsVars')
          ..add('id', id)
          ..add('userId', userId))
        .toString();
  }
}

class GgetPollsVarsBuilder
    implements Builder<GgetPollsVars, GgetPollsVarsBuilder> {
  _$GgetPollsVars? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  GgetPollsVarsBuilder();

  GgetPollsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetPollsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetPollsVars;
  }

  @override
  void update(void Function(GgetPollsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetPollsVars build() => _build();

  _$GgetPollsVars _build() {
    final _$result = _$v ?? new _$GgetPollsVars._(id: id, userId: userId);
    replace(_$result);
    return _$result;
  }
}

class _$GregisterUserVars extends GregisterUserVars {
  @override
  final String name;

  factory _$GregisterUserVars(
          [void Function(GregisterUserVarsBuilder)? updates]) =>
      (new GregisterUserVarsBuilder()..update(updates))._build();

  _$GregisterUserVars._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'GregisterUserVars', 'name');
  }

  @override
  GregisterUserVars rebuild(void Function(GregisterUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GregisterUserVarsBuilder toBuilder() =>
      new GregisterUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GregisterUserVars && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GregisterUserVars')
          ..add('name', name))
        .toString();
  }
}

class GregisterUserVarsBuilder
    implements Builder<GregisterUserVars, GregisterUserVarsBuilder> {
  _$GregisterUserVars? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GregisterUserVarsBuilder();

  GregisterUserVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GregisterUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GregisterUserVars;
  }

  @override
  void update(void Function(GregisterUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GregisterUserVars build() => _build();

  _$GregisterUserVars _build() {
    final _$result = _$v ??
        new _$GregisterUserVars._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GregisterUserVars', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GinsertPollVars extends GinsertPollVars {
  @override
  final _i2.GPollInsert insert;

  factory _$GinsertPollVars([void Function(GinsertPollVarsBuilder)? updates]) =>
      (new GinsertPollVarsBuilder()..update(updates))._build();

  _$GinsertPollVars._({required this.insert}) : super._() {
    BuiltValueNullFieldError.checkNotNull(insert, r'GinsertPollVars', 'insert');
  }

  @override
  GinsertPollVars rebuild(void Function(GinsertPollVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GinsertPollVarsBuilder toBuilder() =>
      new GinsertPollVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GinsertPollVars && insert == other.insert;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, insert.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GinsertPollVars')
          ..add('insert', insert))
        .toString();
  }
}

class GinsertPollVarsBuilder
    implements Builder<GinsertPollVars, GinsertPollVarsBuilder> {
  _$GinsertPollVars? _$v;

  _i2.GPollInsertBuilder? _insert;
  _i2.GPollInsertBuilder get insert =>
      _$this._insert ??= new _i2.GPollInsertBuilder();
  set insert(_i2.GPollInsertBuilder? insert) => _$this._insert = insert;

  GinsertPollVarsBuilder();

  GinsertPollVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _insert = $v.insert.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GinsertPollVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GinsertPollVars;
  }

  @override
  void update(void Function(GinsertPollVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GinsertPollVars build() => _build();

  _$GinsertPollVars _build() {
    _$GinsertPollVars _$result;
    try {
      _$result = _$v ?? new _$GinsertPollVars._(insert: insert.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'insert';
        insert.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GinsertPollVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GaddPollOptionsVars extends GaddPollOptionsVars {
  @override
  final int pollId;
  @override
  final BuiltList<_i2.GPollOptionInsert> options;

  factory _$GaddPollOptionsVars(
          [void Function(GaddPollOptionsVarsBuilder)? updates]) =>
      (new GaddPollOptionsVarsBuilder()..update(updates))._build();

  _$GaddPollOptionsVars._({required this.pollId, required this.options})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pollId, r'GaddPollOptionsVars', 'pollId');
    BuiltValueNullFieldError.checkNotNull(
        options, r'GaddPollOptionsVars', 'options');
  }

  @override
  GaddPollOptionsVars rebuild(
          void Function(GaddPollOptionsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GaddPollOptionsVarsBuilder toBuilder() =>
      new GaddPollOptionsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GaddPollOptionsVars &&
        pollId == other.pollId &&
        options == other.options;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pollId.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GaddPollOptionsVars')
          ..add('pollId', pollId)
          ..add('options', options))
        .toString();
  }
}

class GaddPollOptionsVarsBuilder
    implements Builder<GaddPollOptionsVars, GaddPollOptionsVarsBuilder> {
  _$GaddPollOptionsVars? _$v;

  int? _pollId;
  int? get pollId => _$this._pollId;
  set pollId(int? pollId) => _$this._pollId = pollId;

  ListBuilder<_i2.GPollOptionInsert>? _options;
  ListBuilder<_i2.GPollOptionInsert> get options =>
      _$this._options ??= new ListBuilder<_i2.GPollOptionInsert>();
  set options(ListBuilder<_i2.GPollOptionInsert>? options) =>
      _$this._options = options;

  GaddPollOptionsVarsBuilder();

  GaddPollOptionsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pollId = $v.pollId;
      _options = $v.options.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GaddPollOptionsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GaddPollOptionsVars;
  }

  @override
  void update(void Function(GaddPollOptionsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GaddPollOptionsVars build() => _build();

  _$GaddPollOptionsVars _build() {
    _$GaddPollOptionsVars _$result;
    try {
      _$result = _$v ??
          new _$GaddPollOptionsVars._(
              pollId: BuiltValueNullFieldError.checkNotNull(
                  pollId, r'GaddPollOptionsVars', 'pollId'),
              options: options.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        options.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GaddPollOptionsVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GvotePollVars extends GvotePollVars {
  @override
  final int pollId;
  @override
  final BuiltList<_i2.GPollOptionVoteInsert> votes;

  factory _$GvotePollVars([void Function(GvotePollVarsBuilder)? updates]) =>
      (new GvotePollVarsBuilder()..update(updates))._build();

  _$GvotePollVars._({required this.pollId, required this.votes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(pollId, r'GvotePollVars', 'pollId');
    BuiltValueNullFieldError.checkNotNull(votes, r'GvotePollVars', 'votes');
  }

  @override
  GvotePollVars rebuild(void Function(GvotePollVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GvotePollVarsBuilder toBuilder() => new GvotePollVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GvotePollVars &&
        pollId == other.pollId &&
        votes == other.votes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pollId.hashCode);
    _$hash = $jc(_$hash, votes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GvotePollVars')
          ..add('pollId', pollId)
          ..add('votes', votes))
        .toString();
  }
}

class GvotePollVarsBuilder
    implements Builder<GvotePollVars, GvotePollVarsBuilder> {
  _$GvotePollVars? _$v;

  int? _pollId;
  int? get pollId => _$this._pollId;
  set pollId(int? pollId) => _$this._pollId = pollId;

  ListBuilder<_i2.GPollOptionVoteInsert>? _votes;
  ListBuilder<_i2.GPollOptionVoteInsert> get votes =>
      _$this._votes ??= new ListBuilder<_i2.GPollOptionVoteInsert>();
  set votes(ListBuilder<_i2.GPollOptionVoteInsert>? votes) =>
      _$this._votes = votes;

  GvotePollVarsBuilder();

  GvotePollVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pollId = $v.pollId;
      _votes = $v.votes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GvotePollVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GvotePollVars;
  }

  @override
  void update(void Function(GvotePollVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GvotePollVars build() => _build();

  _$GvotePollVars _build() {
    _$GvotePollVars _$result;
    try {
      _$result = _$v ??
          new _$GvotePollVars._(
              pollId: BuiltValueNullFieldError.checkNotNull(
                  pollId, r'GvotePollVars', 'pollId'),
              votes: votes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'votes';
        votes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GvotePollVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullUserVars extends GFullUserVars {
  factory _$GFullUserVars([void Function(GFullUserVarsBuilder)? updates]) =>
      (new GFullUserVarsBuilder()..update(updates))._build();

  _$GFullUserVars._() : super._();

  @override
  GFullUserVars rebuild(void Function(GFullUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullUserVarsBuilder toBuilder() => new GFullUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullUserVars;
  }

  @override
  int get hashCode {
    return 1017070611;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GFullUserVars').toString();
  }
}

class GFullUserVarsBuilder
    implements Builder<GFullUserVars, GFullUserVarsBuilder> {
  _$GFullUserVars? _$v;

  GFullUserVarsBuilder();

  @override
  void replace(GFullUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullUserVars;
  }

  @override
  void update(void Function(GFullUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullUserVars build() => _build();

  _$GFullUserVars _build() {
    final _$result = _$v ?? new _$GFullUserVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollVars extends GFullPollVars {
  factory _$GFullPollVars([void Function(GFullPollVarsBuilder)? updates]) =>
      (new GFullPollVarsBuilder()..update(updates))._build();

  _$GFullPollVars._() : super._();

  @override
  GFullPollVars rebuild(void Function(GFullPollVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollVarsBuilder toBuilder() => new GFullPollVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollVars;
  }

  @override
  int get hashCode {
    return 759081575;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GFullPollVars').toString();
  }
}

class GFullPollVarsBuilder
    implements Builder<GFullPollVars, GFullPollVarsBuilder> {
  _$GFullPollVars? _$v;

  GFullPollVarsBuilder();

  @override
  void replace(GFullPollVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollVars;
  }

  @override
  void update(void Function(GFullPollVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollVars build() => _build();

  _$GFullPollVars _build() {
    final _$result = _$v ?? new _$GFullPollVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollOptionVars extends GFullPollOptionVars {
  factory _$GFullPollOptionVars(
          [void Function(GFullPollOptionVarsBuilder)? updates]) =>
      (new GFullPollOptionVarsBuilder()..update(updates))._build();

  _$GFullPollOptionVars._() : super._();

  @override
  GFullPollOptionVars rebuild(
          void Function(GFullPollOptionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollOptionVarsBuilder toBuilder() =>
      new GFullPollOptionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollOptionVars;
  }

  @override
  int get hashCode {
    return 337825493;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GFullPollOptionVars').toString();
  }
}

class GFullPollOptionVarsBuilder
    implements Builder<GFullPollOptionVars, GFullPollOptionVarsBuilder> {
  _$GFullPollOptionVars? _$v;

  GFullPollOptionVarsBuilder();

  @override
  void replace(GFullPollOptionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollOptionVars;
  }

  @override
  void update(void Function(GFullPollOptionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollOptionVars build() => _build();

  _$GFullPollOptionVars _build() {
    final _$result = _$v ?? new _$GFullPollOptionVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollOptionVoteVars extends GFullPollOptionVoteVars {
  factory _$GFullPollOptionVoteVars(
          [void Function(GFullPollOptionVoteVarsBuilder)? updates]) =>
      (new GFullPollOptionVoteVarsBuilder()..update(updates))._build();

  _$GFullPollOptionVoteVars._() : super._();

  @override
  GFullPollOptionVoteVars rebuild(
          void Function(GFullPollOptionVoteVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollOptionVoteVarsBuilder toBuilder() =>
      new GFullPollOptionVoteVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollOptionVoteVars;
  }

  @override
  int get hashCode {
    return 250434997;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GFullPollOptionVoteVars').toString();
  }
}

class GFullPollOptionVoteVarsBuilder
    implements
        Builder<GFullPollOptionVoteVars, GFullPollOptionVoteVarsBuilder> {
  _$GFullPollOptionVoteVars? _$v;

  GFullPollOptionVoteVarsBuilder();

  @override
  void replace(GFullPollOptionVoteVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollOptionVoteVars;
  }

  @override
  void update(void Function(GFullPollOptionVoteVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollOptionVoteVars build() => _build();

  _$GFullPollOptionVoteVars _build() {
    final _$result = _$v ?? new _$GFullPollOptionVoteVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
