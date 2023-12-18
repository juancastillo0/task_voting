// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPollInsert> _$gPollInsertSerializer = new _$GPollInsertSerializer();
Serializer<GPollOptionInsert> _$gPollOptionInsertSerializer =
    new _$GPollOptionInsertSerializer();
Serializer<GPollOptionVoteInsert> _$gPollOptionVoteInsertSerializer =
    new _$GPollOptionVoteInsertSerializer();

class _$GPollInsertSerializer implements StructuredSerializer<GPollInsert> {
  @override
  final Iterable<Type> types = const [GPollInsert, _$GPollInsert];
  @override
  final String wireName = 'GPollInsert';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPollInsert object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pollKind;
    if (value != null) {
      result
        ..add('pollKind')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.formJsonSchema;
    if (value != null) {
      result
        ..add('formJsonSchema')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GPollOptionInsert)])));
    }
    return result;
  }

  @override
  GPollInsert deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPollInsertBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pollKind':
          result.pollKind = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'formJsonSchema':
          result.formJsonSchema = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GPollOptionInsert)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPollOptionInsertSerializer
    implements StructuredSerializer<GPollOptionInsert> {
  @override
  final Iterable<Type> types = const [GPollOptionInsert, _$GPollOptionInsert];
  @override
  final String wireName = 'GPollOptionInsert';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPollOptionInsert object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.priority;
    if (value != null) {
      result
        ..add('priority')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.formJsonSchema;
    if (value != null) {
      result
        ..add('formJsonSchema')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(GDate)));
    }
    return result;
  }

  @override
  GPollOptionInsert deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPollOptionInsertBuilder();

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
        case 'priority':
          result.priority = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'formJsonSchema':
          result.formJsonSchema = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDate))! as GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GPollOptionVoteInsertSerializer
    implements StructuredSerializer<GPollOptionVoteInsert> {
  @override
  final Iterable<Type> types = const [
    GPollOptionVoteInsert,
    _$GPollOptionVoteInsert
  ];
  @override
  final String wireName = 'GPollOptionVoteInsert';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPollOptionVoteInsert object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pollOptionId',
      serializers.serialize(object.pollOptionId,
          specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.formResponse;
    if (value != null) {
      result
        ..add('formResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(GDate)));
    }
    return result;
  }

  @override
  GPollOptionVoteInsert deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPollOptionVoteInsertBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pollOptionId':
          result.pollOptionId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'formResponse':
          result.formResponse = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDate))! as GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GDate extends GDate {
  @override
  final String value;

  factory _$GDate([void Function(GDateBuilder)? updates]) =>
      (new GDateBuilder()..update(updates))._build();

  _$GDate._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GDate', 'value');
  }

  @override
  GDate rebuild(void Function(GDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDateBuilder toBuilder() => new GDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDate && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDate')..add('value', value))
        .toString();
  }
}

class GDateBuilder implements Builder<GDate, GDateBuilder> {
  _$GDate? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GDateBuilder();

  GDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDate;
  }

  @override
  void update(void Function(GDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDate build() => _build();

  _$GDate _build() {
    final _$result = _$v ??
        new _$GDate._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GDate', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GPollInsert extends GPollInsert {
  @override
  final int? id;
  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final String body;
  @override
  final String? pollKind;
  @override
  final String? formJsonSchema;
  @override
  final BuiltList<GPollOptionInsert>? options;

  factory _$GPollInsert([void Function(GPollInsertBuilder)? updates]) =>
      (new GPollInsertBuilder()..update(updates))._build();

  _$GPollInsert._(
      {this.id,
      required this.title,
      this.subtitle,
      required this.body,
      this.pollKind,
      this.formJsonSchema,
      this.options})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'GPollInsert', 'title');
    BuiltValueNullFieldError.checkNotNull(body, r'GPollInsert', 'body');
  }

  @override
  GPollInsert rebuild(void Function(GPollInsertBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPollInsertBuilder toBuilder() => new GPollInsertBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPollInsert &&
        id == other.id &&
        title == other.title &&
        subtitle == other.subtitle &&
        body == other.body &&
        pollKind == other.pollKind &&
        formJsonSchema == other.formJsonSchema &&
        options == other.options;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, pollKind.hashCode);
    _$hash = $jc(_$hash, formJsonSchema.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPollInsert')
          ..add('id', id)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('body', body)
          ..add('pollKind', pollKind)
          ..add('formJsonSchema', formJsonSchema)
          ..add('options', options))
        .toString();
  }
}

class GPollInsertBuilder implements Builder<GPollInsert, GPollInsertBuilder> {
  _$GPollInsert? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _pollKind;
  String? get pollKind => _$this._pollKind;
  set pollKind(String? pollKind) => _$this._pollKind = pollKind;

  String? _formJsonSchema;
  String? get formJsonSchema => _$this._formJsonSchema;
  set formJsonSchema(String? formJsonSchema) =>
      _$this._formJsonSchema = formJsonSchema;

  ListBuilder<GPollOptionInsert>? _options;
  ListBuilder<GPollOptionInsert> get options =>
      _$this._options ??= new ListBuilder<GPollOptionInsert>();
  set options(ListBuilder<GPollOptionInsert>? options) =>
      _$this._options = options;

  GPollInsertBuilder();

  GPollInsertBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _body = $v.body;
      _pollKind = $v.pollKind;
      _formJsonSchema = $v.formJsonSchema;
      _options = $v.options?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPollInsert other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPollInsert;
  }

  @override
  void update(void Function(GPollInsertBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPollInsert build() => _build();

  _$GPollInsert _build() {
    _$GPollInsert _$result;
    try {
      _$result = _$v ??
          new _$GPollInsert._(
              id: id,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GPollInsert', 'title'),
              subtitle: subtitle,
              body: BuiltValueNullFieldError.checkNotNull(
                  body, r'GPollInsert', 'body'),
              pollKind: pollKind,
              formJsonSchema: formJsonSchema,
              options: _options?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPollInsert', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPollOptionInsert extends GPollOptionInsert {
  @override
  final int? id;
  @override
  final int? priority;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? formJsonSchema;
  @override
  final GDate? createdAt;

  factory _$GPollOptionInsert(
          [void Function(GPollOptionInsertBuilder)? updates]) =>
      (new GPollOptionInsertBuilder()..update(updates))._build();

  _$GPollOptionInsert._(
      {this.id,
      this.priority,
      this.description,
      this.url,
      this.formJsonSchema,
      this.createdAt})
      : super._();

  @override
  GPollOptionInsert rebuild(void Function(GPollOptionInsertBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPollOptionInsertBuilder toBuilder() =>
      new GPollOptionInsertBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPollOptionInsert &&
        id == other.id &&
        priority == other.priority &&
        description == other.description &&
        url == other.url &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, priority.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, formJsonSchema.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPollOptionInsert')
          ..add('id', id)
          ..add('priority', priority)
          ..add('description', description)
          ..add('url', url)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GPollOptionInsertBuilder
    implements Builder<GPollOptionInsert, GPollOptionInsertBuilder> {
  _$GPollOptionInsert? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _priority;
  int? get priority => _$this._priority;
  set priority(int? priority) => _$this._priority = priority;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _formJsonSchema;
  String? get formJsonSchema => _$this._formJsonSchema;
  set formJsonSchema(String? formJsonSchema) =>
      _$this._formJsonSchema = formJsonSchema;

  GDateBuilder? _createdAt;
  GDateBuilder get createdAt => _$this._createdAt ??= new GDateBuilder();
  set createdAt(GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GPollOptionInsertBuilder();

  GPollOptionInsertBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _priority = $v.priority;
      _description = $v.description;
      _url = $v.url;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPollOptionInsert other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPollOptionInsert;
  }

  @override
  void update(void Function(GPollOptionInsertBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPollOptionInsert build() => _build();

  _$GPollOptionInsert _build() {
    _$GPollOptionInsert _$result;
    try {
      _$result = _$v ??
          new _$GPollOptionInsert._(
              id: id,
              priority: priority,
              description: description,
              url: url,
              formJsonSchema: formJsonSchema,
              createdAt: _createdAt?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdAt';
        _createdAt?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPollOptionInsert', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPollOptionVoteInsert extends GPollOptionVoteInsert {
  @override
  final int pollOptionId;
  @override
  final int userId;
  @override
  final int value;
  @override
  final String? formResponse;
  @override
  final GDate? createdAt;

  factory _$GPollOptionVoteInsert(
          [void Function(GPollOptionVoteInsertBuilder)? updates]) =>
      (new GPollOptionVoteInsertBuilder()..update(updates))._build();

  _$GPollOptionVoteInsert._(
      {required this.pollOptionId,
      required this.userId,
      required this.value,
      this.formResponse,
      this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pollOptionId, r'GPollOptionVoteInsert', 'pollOptionId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GPollOptionVoteInsert', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        value, r'GPollOptionVoteInsert', 'value');
  }

  @override
  GPollOptionVoteInsert rebuild(
          void Function(GPollOptionVoteInsertBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPollOptionVoteInsertBuilder toBuilder() =>
      new GPollOptionVoteInsertBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPollOptionVoteInsert &&
        pollOptionId == other.pollOptionId &&
        userId == other.userId &&
        value == other.value &&
        formResponse == other.formResponse &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pollOptionId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, formResponse.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPollOptionVoteInsert')
          ..add('pollOptionId', pollOptionId)
          ..add('userId', userId)
          ..add('value', value)
          ..add('formResponse', formResponse)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GPollOptionVoteInsertBuilder
    implements Builder<GPollOptionVoteInsert, GPollOptionVoteInsertBuilder> {
  _$GPollOptionVoteInsert? _$v;

  int? _pollOptionId;
  int? get pollOptionId => _$this._pollOptionId;
  set pollOptionId(int? pollOptionId) => _$this._pollOptionId = pollOptionId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  String? _formResponse;
  String? get formResponse => _$this._formResponse;
  set formResponse(String? formResponse) => _$this._formResponse = formResponse;

  GDateBuilder? _createdAt;
  GDateBuilder get createdAt => _$this._createdAt ??= new GDateBuilder();
  set createdAt(GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GPollOptionVoteInsertBuilder();

  GPollOptionVoteInsertBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pollOptionId = $v.pollOptionId;
      _userId = $v.userId;
      _value = $v.value;
      _formResponse = $v.formResponse;
      _createdAt = $v.createdAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPollOptionVoteInsert other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPollOptionVoteInsert;
  }

  @override
  void update(void Function(GPollOptionVoteInsertBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPollOptionVoteInsert build() => _build();

  _$GPollOptionVoteInsert _build() {
    _$GPollOptionVoteInsert _$result;
    try {
      _$result = _$v ??
          new _$GPollOptionVoteInsert._(
              pollOptionId: BuiltValueNullFieldError.checkNotNull(
                  pollOptionId, r'GPollOptionVoteInsert', 'pollOptionId'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GPollOptionVoteInsert', 'userId'),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'GPollOptionVoteInsert', 'value'),
              formResponse: formResponse,
              createdAt: _createdAt?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdAt';
        _createdAt?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPollOptionVoteInsert', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
