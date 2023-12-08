// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetPollsData> _$ggetPollsDataSerializer =
    new _$GgetPollsDataSerializer();
Serializer<GgetPollsData_getPolls> _$ggetPollsDataGetPollsSerializer =
    new _$GgetPollsData_getPollsSerializer();
Serializer<GgetPollsData_getPolls_options>
    _$ggetPollsDataGetPollsOptionsSerializer =
    new _$GgetPollsData_getPolls_optionsSerializer();
Serializer<GgetPollsData_getPolls_options_votes>
    _$ggetPollsDataGetPollsOptionsVotesSerializer =
    new _$GgetPollsData_getPolls_options_votesSerializer();
Serializer<GregisterUserData> _$gregisterUserDataSerializer =
    new _$GregisterUserDataSerializer();
Serializer<GregisterUserData_registerUser>
    _$gregisterUserDataRegisterUserSerializer =
    new _$GregisterUserData_registerUserSerializer();
Serializer<GinsertPollData> _$ginsertPollDataSerializer =
    new _$GinsertPollDataSerializer();
Serializer<GinsertPollData_insertPoll> _$ginsertPollDataInsertPollSerializer =
    new _$GinsertPollData_insertPollSerializer();
Serializer<GinsertPollData_insertPoll_options>
    _$ginsertPollDataInsertPollOptionsSerializer =
    new _$GinsertPollData_insertPoll_optionsSerializer();
Serializer<GinsertPollData_insertPoll_options_votes>
    _$ginsertPollDataInsertPollOptionsVotesSerializer =
    new _$GinsertPollData_insertPoll_options_votesSerializer();
Serializer<GaddPollOptionsData> _$gaddPollOptionsDataSerializer =
    new _$GaddPollOptionsDataSerializer();
Serializer<GaddPollOptionsData_addPollOptions>
    _$gaddPollOptionsDataAddPollOptionsSerializer =
    new _$GaddPollOptionsData_addPollOptionsSerializer();
Serializer<GaddPollOptionsData_addPollOptions_options>
    _$gaddPollOptionsDataAddPollOptionsOptionsSerializer =
    new _$GaddPollOptionsData_addPollOptions_optionsSerializer();
Serializer<GaddPollOptionsData_addPollOptions_options_votes>
    _$gaddPollOptionsDataAddPollOptionsOptionsVotesSerializer =
    new _$GaddPollOptionsData_addPollOptions_options_votesSerializer();
Serializer<GvotePollData> _$gvotePollDataSerializer =
    new _$GvotePollDataSerializer();
Serializer<GvotePollData_votePoll> _$gvotePollDataVotePollSerializer =
    new _$GvotePollData_votePollSerializer();
Serializer<GFullUserData> _$gFullUserDataSerializer =
    new _$GFullUserDataSerializer();
Serializer<GFullPollData> _$gFullPollDataSerializer =
    new _$GFullPollDataSerializer();
Serializer<GFullPollData_options> _$gFullPollDataOptionsSerializer =
    new _$GFullPollData_optionsSerializer();
Serializer<GFullPollData_options_votes> _$gFullPollDataOptionsVotesSerializer =
    new _$GFullPollData_options_votesSerializer();
Serializer<GFullPollOptionData> _$gFullPollOptionDataSerializer =
    new _$GFullPollOptionDataSerializer();
Serializer<GFullPollOptionData_votes> _$gFullPollOptionDataVotesSerializer =
    new _$GFullPollOptionData_votesSerializer();
Serializer<GFullPollOptionVoteData> _$gFullPollOptionVoteDataSerializer =
    new _$GFullPollOptionVoteDataSerializer();

class _$GgetPollsDataSerializer implements StructuredSerializer<GgetPollsData> {
  @override
  final Iterable<Type> types = const [GgetPollsData, _$GgetPollsData];
  @override
  final String wireName = 'GgetPollsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GgetPollsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'getPolls',
      serializers.serialize(object.getPolls,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GgetPollsData_getPolls)])),
    ];

    return result;
  }

  @override
  GgetPollsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetPollsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'getPolls':
          result.getPolls.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GgetPollsData_getPolls)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetPollsData_getPollsSerializer
    implements StructuredSerializer<GgetPollsData_getPolls> {
  @override
  final Iterable<Type> types = const [
    GgetPollsData_getPolls,
    _$GgetPollsData_getPolls
  ];
  @override
  final String wireName = 'GgetPollsData_getPolls';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetPollsData_getPolls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'options',
      serializers.serialize(object.options,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GgetPollsData_getPolls_options)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GgetPollsData_getPolls deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetPollsData_getPollsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GgetPollsData_getPolls_options)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetPollsData_getPolls_optionsSerializer
    implements StructuredSerializer<GgetPollsData_getPolls_options> {
  @override
  final Iterable<Type> types = const [
    GgetPollsData_getPolls_options,
    _$GgetPollsData_getPolls_options
  ];
  @override
  final String wireName = 'GgetPollsData_getPolls_options';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetPollsData_getPolls_options object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'votes',
      serializers.serialize(object.votes,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GgetPollsData_getPolls_options_votes)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'pollId',
      serializers.serialize(object.pollId, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GgetPollsData_getPolls_options deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetPollsData_getPolls_optionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'votes':
          result.votes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GgetPollsData_getPolls_options_votes)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pollId':
          result.pollId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetPollsData_getPolls_options_votesSerializer
    implements StructuredSerializer<GgetPollsData_getPolls_options_votes> {
  @override
  final Iterable<Type> types = const [
    GgetPollsData_getPolls_options_votes,
    _$GgetPollsData_getPolls_options_votes
  ];
  @override
  final String wireName = 'GgetPollsData_getPolls_options_votes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetPollsData_getPolls_options_votes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pollOptionId',
      serializers.serialize(object.pollOptionId,
          specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
    value = object.formResponse;
    if (value != null) {
      result
        ..add('formResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GgetPollsData_getPolls_options_votes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetPollsData_getPolls_options_votesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GregisterUserDataSerializer
    implements StructuredSerializer<GregisterUserData> {
  @override
  final Iterable<Type> types = const [GregisterUserData, _$GregisterUserData];
  @override
  final String wireName = 'GregisterUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GregisterUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'registerUser',
      serializers.serialize(object.registerUser,
          specifiedType: const FullType(GregisterUserData_registerUser)),
    ];

    return result;
  }

  @override
  GregisterUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GregisterUserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'registerUser':
          result.registerUser.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GregisterUserData_registerUser))!
              as GregisterUserData_registerUser);
          break;
      }
    }

    return result.build();
  }
}

class _$GregisterUserData_registerUserSerializer
    implements StructuredSerializer<GregisterUserData_registerUser> {
  @override
  final Iterable<Type> types = const [
    GregisterUserData_registerUser,
    _$GregisterUserData_registerUser
  ];
  @override
  final String wireName = 'GregisterUserData_registerUser';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GregisterUserData_registerUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GregisterUserData_registerUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GregisterUserData_registerUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GinsertPollDataSerializer
    implements StructuredSerializer<GinsertPollData> {
  @override
  final Iterable<Type> types = const [GinsertPollData, _$GinsertPollData];
  @override
  final String wireName = 'GinsertPollData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GinsertPollData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'insertPoll',
      serializers.serialize(object.insertPoll,
          specifiedType: const FullType(GinsertPollData_insertPoll)),
    ];

    return result;
  }

  @override
  GinsertPollData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GinsertPollDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'insertPoll':
          result.insertPoll.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GinsertPollData_insertPoll))!
              as GinsertPollData_insertPoll);
          break;
      }
    }

    return result.build();
  }
}

class _$GinsertPollData_insertPollSerializer
    implements StructuredSerializer<GinsertPollData_insertPoll> {
  @override
  final Iterable<Type> types = const [
    GinsertPollData_insertPoll,
    _$GinsertPollData_insertPoll
  ];
  @override
  final String wireName = 'GinsertPollData_insertPoll';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GinsertPollData_insertPoll object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'options',
      serializers.serialize(object.options,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GinsertPollData_insertPoll_options)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GinsertPollData_insertPoll deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GinsertPollData_insertPollBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GinsertPollData_insertPoll_options)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GinsertPollData_insertPoll_optionsSerializer
    implements StructuredSerializer<GinsertPollData_insertPoll_options> {
  @override
  final Iterable<Type> types = const [
    GinsertPollData_insertPoll_options,
    _$GinsertPollData_insertPoll_options
  ];
  @override
  final String wireName = 'GinsertPollData_insertPoll_options';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GinsertPollData_insertPoll_options object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'votes',
      serializers.serialize(object.votes,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GinsertPollData_insertPoll_options_votes)
          ])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'pollId',
      serializers.serialize(object.pollId, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GinsertPollData_insertPoll_options deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GinsertPollData_insertPoll_optionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'votes':
          result.votes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GinsertPollData_insertPoll_options_votes)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pollId':
          result.pollId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GinsertPollData_insertPoll_options_votesSerializer
    implements StructuredSerializer<GinsertPollData_insertPoll_options_votes> {
  @override
  final Iterable<Type> types = const [
    GinsertPollData_insertPoll_options_votes,
    _$GinsertPollData_insertPoll_options_votes
  ];
  @override
  final String wireName = 'GinsertPollData_insertPoll_options_votes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GinsertPollData_insertPoll_options_votes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pollOptionId',
      serializers.serialize(object.pollOptionId,
          specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
    value = object.formResponse;
    if (value != null) {
      result
        ..add('formResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GinsertPollData_insertPoll_options_votes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GinsertPollData_insertPoll_options_votesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GaddPollOptionsDataSerializer
    implements StructuredSerializer<GaddPollOptionsData> {
  @override
  final Iterable<Type> types = const [
    GaddPollOptionsData,
    _$GaddPollOptionsData
  ];
  @override
  final String wireName = 'GaddPollOptionsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GaddPollOptionsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'addPollOptions',
      serializers.serialize(object.addPollOptions,
          specifiedType: const FullType(GaddPollOptionsData_addPollOptions)),
    ];

    return result;
  }

  @override
  GaddPollOptionsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GaddPollOptionsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'addPollOptions':
          result.addPollOptions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GaddPollOptionsData_addPollOptions))!
              as GaddPollOptionsData_addPollOptions);
          break;
      }
    }

    return result.build();
  }
}

class _$GaddPollOptionsData_addPollOptionsSerializer
    implements StructuredSerializer<GaddPollOptionsData_addPollOptions> {
  @override
  final Iterable<Type> types = const [
    GaddPollOptionsData_addPollOptions,
    _$GaddPollOptionsData_addPollOptions
  ];
  @override
  final String wireName = 'GaddPollOptionsData_addPollOptions';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GaddPollOptionsData_addPollOptions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'options',
      serializers.serialize(object.options,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GaddPollOptionsData_addPollOptions_options)
          ])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GaddPollOptionsData_addPollOptions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GaddPollOptionsData_addPollOptionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GaddPollOptionsData_addPollOptions_options)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GaddPollOptionsData_addPollOptions_optionsSerializer
    implements
        StructuredSerializer<GaddPollOptionsData_addPollOptions_options> {
  @override
  final Iterable<Type> types = const [
    GaddPollOptionsData_addPollOptions_options,
    _$GaddPollOptionsData_addPollOptions_options
  ];
  @override
  final String wireName = 'GaddPollOptionsData_addPollOptions_options';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GaddPollOptionsData_addPollOptions_options object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'votes',
      serializers.serialize(object.votes,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GaddPollOptionsData_addPollOptions_options_votes)
          ])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'pollId',
      serializers.serialize(object.pollId, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GaddPollOptionsData_addPollOptions_options deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GaddPollOptionsData_addPollOptions_optionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'votes':
          result.votes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GaddPollOptionsData_addPollOptions_options_votes)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pollId':
          result.pollId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GaddPollOptionsData_addPollOptions_options_votesSerializer
    implements
        StructuredSerializer<GaddPollOptionsData_addPollOptions_options_votes> {
  @override
  final Iterable<Type> types = const [
    GaddPollOptionsData_addPollOptions_options_votes,
    _$GaddPollOptionsData_addPollOptions_options_votes
  ];
  @override
  final String wireName = 'GaddPollOptionsData_addPollOptions_options_votes';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GaddPollOptionsData_addPollOptions_options_votes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pollOptionId',
      serializers.serialize(object.pollOptionId,
          specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
    value = object.formResponse;
    if (value != null) {
      result
        ..add('formResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GaddPollOptionsData_addPollOptions_options_votes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GaddPollOptionsData_addPollOptions_options_votesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GvotePollDataSerializer implements StructuredSerializer<GvotePollData> {
  @override
  final Iterable<Type> types = const [GvotePollData, _$GvotePollData];
  @override
  final String wireName = 'GvotePollData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GvotePollData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'votePoll',
      serializers.serialize(object.votePoll,
          specifiedType: const FullType(GvotePollData_votePoll)),
    ];

    return result;
  }

  @override
  GvotePollData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GvotePollDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'votePoll':
          result.votePoll.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GvotePollData_votePoll))!
              as GvotePollData_votePoll);
          break;
      }
    }

    return result.build();
  }
}

class _$GvotePollData_votePollSerializer
    implements StructuredSerializer<GvotePollData_votePoll> {
  @override
  final Iterable<Type> types = const [
    GvotePollData_votePoll,
    _$GvotePollData_votePoll
  ];
  @override
  final String wireName = 'GvotePollData_votePoll';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GvotePollData_votePoll object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'isOk',
      serializers.serialize(object.isOk, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.ok;
    if (value != null) {
      result
        ..add('ok')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.err;
    if (value != null) {
      result
        ..add('err')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GvotePollData_votePoll deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GvotePollData_votePollBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ok':
          result.ok = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'err':
          result.err = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isOk':
          result.isOk = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullUserDataSerializer implements StructuredSerializer<GFullUserData> {
  @override
  final Iterable<Type> types = const [GFullUserData, _$GFullUserData];
  @override
  final String wireName = 'GFullUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFullUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFullUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullUserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFullPollDataSerializer implements StructuredSerializer<GFullPollData> {
  @override
  final Iterable<Type> types = const [GFullPollData, _$GFullPollData];
  @override
  final String wireName = 'GFullPollData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFullPollData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'options',
      serializers.serialize(object.options,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GFullPollData_options)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GFullPollData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullPollDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFullPollData_options)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullPollData_optionsSerializer
    implements StructuredSerializer<GFullPollData_options> {
  @override
  final Iterable<Type> types = const [
    GFullPollData_options,
    _$GFullPollData_options
  ];
  @override
  final String wireName = 'GFullPollData_options';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullPollData_options object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'votes',
      serializers.serialize(object.votes,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GFullPollData_options_votes)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'pollId',
      serializers.serialize(object.pollId, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GFullPollData_options deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullPollData_optionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'votes':
          result.votes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFullPollData_options_votes)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pollId':
          result.pollId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullPollData_options_votesSerializer
    implements StructuredSerializer<GFullPollData_options_votes> {
  @override
  final Iterable<Type> types = const [
    GFullPollData_options_votes,
    _$GFullPollData_options_votes
  ];
  @override
  final String wireName = 'GFullPollData_options_votes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullPollData_options_votes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pollOptionId',
      serializers.serialize(object.pollOptionId,
          specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
    value = object.formResponse;
    if (value != null) {
      result
        ..add('formResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFullPollData_options_votes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullPollData_options_votesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullPollOptionDataSerializer
    implements StructuredSerializer<GFullPollOptionData> {
  @override
  final Iterable<Type> types = const [
    GFullPollOptionData,
    _$GFullPollOptionData
  ];
  @override
  final String wireName = 'GFullPollOptionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullPollOptionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'votes',
      serializers.serialize(object.votes,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GFullPollOptionData_votes)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'pollId',
      serializers.serialize(object.pollId, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
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
    return result;
  }

  @override
  GFullPollOptionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullPollOptionDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'votes':
          result.votes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFullPollOptionData_votes)
              ]))! as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pollId':
          result.pollId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullPollOptionData_votesSerializer
    implements StructuredSerializer<GFullPollOptionData_votes> {
  @override
  final Iterable<Type> types = const [
    GFullPollOptionData_votes,
    _$GFullPollOptionData_votes
  ];
  @override
  final String wireName = 'GFullPollOptionData_votes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullPollOptionData_votes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pollOptionId',
      serializers.serialize(object.pollOptionId,
          specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
    value = object.formResponse;
    if (value != null) {
      result
        ..add('formResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFullPollOptionData_votes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullPollOptionData_votesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GFullPollOptionVoteDataSerializer
    implements StructuredSerializer<GFullPollOptionVoteData> {
  @override
  final Iterable<Type> types = const [
    GFullPollOptionVoteData,
    _$GFullPollOptionVoteData
  ];
  @override
  final String wireName = 'GFullPollOptionVoteData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFullPollOptionVoteData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pollOptionId',
      serializers.serialize(object.pollOptionId,
          specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDate)),
    ];
    Object? value;
    value = object.formResponse;
    if (value != null) {
      result
        ..add('formResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFullPollOptionVoteData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFullPollOptionVoteDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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
              specifiedType: const FullType(_i2.GDate))! as _i2.GDate);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetPollsData extends GgetPollsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GgetPollsData_getPolls> getPolls;

  factory _$GgetPollsData([void Function(GgetPollsDataBuilder)? updates]) =>
      (new GgetPollsDataBuilder()..update(updates))._build();

  _$GgetPollsData._({required this.G__typename, required this.getPolls})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetPollsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        getPolls, r'GgetPollsData', 'getPolls');
  }

  @override
  GgetPollsData rebuild(void Function(GgetPollsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetPollsDataBuilder toBuilder() => new GgetPollsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetPollsData &&
        G__typename == other.G__typename &&
        getPolls == other.getPolls;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, getPolls.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetPollsData')
          ..add('G__typename', G__typename)
          ..add('getPolls', getPolls))
        .toString();
  }
}

class GgetPollsDataBuilder
    implements Builder<GgetPollsData, GgetPollsDataBuilder> {
  _$GgetPollsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GgetPollsData_getPolls>? _getPolls;
  ListBuilder<GgetPollsData_getPolls> get getPolls =>
      _$this._getPolls ??= new ListBuilder<GgetPollsData_getPolls>();
  set getPolls(ListBuilder<GgetPollsData_getPolls>? getPolls) =>
      _$this._getPolls = getPolls;

  GgetPollsDataBuilder() {
    GgetPollsData._initializeBuilder(this);
  }

  GgetPollsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _getPolls = $v.getPolls.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetPollsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetPollsData;
  }

  @override
  void update(void Function(GgetPollsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetPollsData build() => _build();

  _$GgetPollsData _build() {
    _$GgetPollsData _$result;
    try {
      _$result = _$v ??
          new _$GgetPollsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GgetPollsData', 'G__typename'),
              getPolls: getPolls.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'getPolls';
        getPolls.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetPollsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GgetPollsData_getPolls extends GgetPollsData_getPolls {
  @override
  final String G__typename;
  @override
  final BuiltList<GgetPollsData_getPolls_options> options;
  @override
  final int id;
  @override
  final int userId;
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
  final _i2.GDate createdAt;

  factory _$GgetPollsData_getPolls(
          [void Function(GgetPollsData_getPollsBuilder)? updates]) =>
      (new GgetPollsData_getPollsBuilder()..update(updates))._build();

  _$GgetPollsData_getPolls._(
      {required this.G__typename,
      required this.options,
      required this.id,
      required this.userId,
      required this.title,
      this.subtitle,
      required this.body,
      this.pollKind,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetPollsData_getPolls', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        options, r'GgetPollsData_getPolls', 'options');
    BuiltValueNullFieldError.checkNotNull(id, r'GgetPollsData_getPolls', 'id');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GgetPollsData_getPolls', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GgetPollsData_getPolls', 'title');
    BuiltValueNullFieldError.checkNotNull(
        body, r'GgetPollsData_getPolls', 'body');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GgetPollsData_getPolls', 'createdAt');
  }

  @override
  GgetPollsData_getPolls rebuild(
          void Function(GgetPollsData_getPollsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetPollsData_getPollsBuilder toBuilder() =>
      new GgetPollsData_getPollsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetPollsData_getPolls &&
        G__typename == other.G__typename &&
        options == other.options &&
        id == other.id &&
        userId == other.userId &&
        title == other.title &&
        subtitle == other.subtitle &&
        body == other.body &&
        pollKind == other.pollKind &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, pollKind.hashCode);
    _$hash = $jc(_$hash, formJsonSchema.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetPollsData_getPolls')
          ..add('G__typename', G__typename)
          ..add('options', options)
          ..add('id', id)
          ..add('userId', userId)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('body', body)
          ..add('pollKind', pollKind)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GgetPollsData_getPollsBuilder
    implements Builder<GgetPollsData_getPolls, GgetPollsData_getPollsBuilder> {
  _$GgetPollsData_getPolls? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GgetPollsData_getPolls_options>? _options;
  ListBuilder<GgetPollsData_getPolls_options> get options =>
      _$this._options ??= new ListBuilder<GgetPollsData_getPolls_options>();
  set options(ListBuilder<GgetPollsData_getPolls_options>? options) =>
      _$this._options = options;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GgetPollsData_getPollsBuilder() {
    GgetPollsData_getPolls._initializeBuilder(this);
  }

  GgetPollsData_getPollsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _options = $v.options.toBuilder();
      _id = $v.id;
      _userId = $v.userId;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _body = $v.body;
      _pollKind = $v.pollKind;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetPollsData_getPolls other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetPollsData_getPolls;
  }

  @override
  void update(void Function(GgetPollsData_getPollsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetPollsData_getPolls build() => _build();

  _$GgetPollsData_getPolls _build() {
    _$GgetPollsData_getPolls _$result;
    try {
      _$result = _$v ??
          new _$GgetPollsData_getPolls._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GgetPollsData_getPolls', 'G__typename'),
              options: options.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GgetPollsData_getPolls', 'id'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GgetPollsData_getPolls', 'userId'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GgetPollsData_getPolls', 'title'),
              subtitle: subtitle,
              body: BuiltValueNullFieldError.checkNotNull(
                  body, r'GgetPollsData_getPolls', 'body'),
              pollKind: pollKind,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        options.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetPollsData_getPolls', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GgetPollsData_getPolls_options extends GgetPollsData_getPolls_options {
  @override
  final String G__typename;
  @override
  final BuiltList<GgetPollsData_getPolls_options_votes> votes;
  @override
  final int id;
  @override
  final int pollId;
  @override
  final int? priority;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? formJsonSchema;
  @override
  final _i2.GDate createdAt;

  factory _$GgetPollsData_getPolls_options(
          [void Function(GgetPollsData_getPolls_optionsBuilder)? updates]) =>
      (new GgetPollsData_getPolls_optionsBuilder()..update(updates))._build();

  _$GgetPollsData_getPolls_options._(
      {required this.G__typename,
      required this.votes,
      required this.id,
      required this.pollId,
      this.priority,
      this.description,
      this.url,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetPollsData_getPolls_options', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        votes, r'GgetPollsData_getPolls_options', 'votes');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GgetPollsData_getPolls_options', 'id');
    BuiltValueNullFieldError.checkNotNull(
        pollId, r'GgetPollsData_getPolls_options', 'pollId');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GgetPollsData_getPolls_options', 'createdAt');
  }

  @override
  GgetPollsData_getPolls_options rebuild(
          void Function(GgetPollsData_getPolls_optionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetPollsData_getPolls_optionsBuilder toBuilder() =>
      new GgetPollsData_getPolls_optionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetPollsData_getPolls_options &&
        G__typename == other.G__typename &&
        votes == other.votes &&
        id == other.id &&
        pollId == other.pollId &&
        priority == other.priority &&
        description == other.description &&
        url == other.url &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, votes.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pollId.hashCode);
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
    return (newBuiltValueToStringHelper(r'GgetPollsData_getPolls_options')
          ..add('G__typename', G__typename)
          ..add('votes', votes)
          ..add('id', id)
          ..add('pollId', pollId)
          ..add('priority', priority)
          ..add('description', description)
          ..add('url', url)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GgetPollsData_getPolls_optionsBuilder
    implements
        Builder<GgetPollsData_getPolls_options,
            GgetPollsData_getPolls_optionsBuilder> {
  _$GgetPollsData_getPolls_options? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GgetPollsData_getPolls_options_votes>? _votes;
  ListBuilder<GgetPollsData_getPolls_options_votes> get votes =>
      _$this._votes ??= new ListBuilder<GgetPollsData_getPolls_options_votes>();
  set votes(ListBuilder<GgetPollsData_getPolls_options_votes>? votes) =>
      _$this._votes = votes;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _pollId;
  int? get pollId => _$this._pollId;
  set pollId(int? pollId) => _$this._pollId = pollId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GgetPollsData_getPolls_optionsBuilder() {
    GgetPollsData_getPolls_options._initializeBuilder(this);
  }

  GgetPollsData_getPolls_optionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _votes = $v.votes.toBuilder();
      _id = $v.id;
      _pollId = $v.pollId;
      _priority = $v.priority;
      _description = $v.description;
      _url = $v.url;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetPollsData_getPolls_options other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetPollsData_getPolls_options;
  }

  @override
  void update(void Function(GgetPollsData_getPolls_optionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetPollsData_getPolls_options build() => _build();

  _$GgetPollsData_getPolls_options _build() {
    _$GgetPollsData_getPolls_options _$result;
    try {
      _$result = _$v ??
          new _$GgetPollsData_getPolls_options._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GgetPollsData_getPolls_options', 'G__typename'),
              votes: votes.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GgetPollsData_getPolls_options', 'id'),
              pollId: BuiltValueNullFieldError.checkNotNull(
                  pollId, r'GgetPollsData_getPolls_options', 'pollId'),
              priority: priority,
              description: description,
              url: url,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'votes';
        votes.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetPollsData_getPolls_options', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GgetPollsData_getPolls_options_votes
    extends GgetPollsData_getPolls_options_votes {
  @override
  final String G__typename;
  @override
  final int pollOptionId;
  @override
  final int userId;
  @override
  final int value;
  @override
  final String? formResponse;
  @override
  final _i2.GDate createdAt;

  factory _$GgetPollsData_getPolls_options_votes(
          [void Function(GgetPollsData_getPolls_options_votesBuilder)?
              updates]) =>
      (new GgetPollsData_getPolls_options_votesBuilder()..update(updates))
          ._build();

  _$GgetPollsData_getPolls_options_votes._(
      {required this.G__typename,
      required this.pollOptionId,
      required this.userId,
      required this.value,
      this.formResponse,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetPollsData_getPolls_options_votes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        pollOptionId, r'GgetPollsData_getPolls_options_votes', 'pollOptionId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GgetPollsData_getPolls_options_votes', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        value, r'GgetPollsData_getPolls_options_votes', 'value');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GgetPollsData_getPolls_options_votes', 'createdAt');
  }

  @override
  GgetPollsData_getPolls_options_votes rebuild(
          void Function(GgetPollsData_getPolls_options_votesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetPollsData_getPolls_options_votesBuilder toBuilder() =>
      new GgetPollsData_getPolls_options_votesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetPollsData_getPolls_options_votes &&
        G__typename == other.G__typename &&
        pollOptionId == other.pollOptionId &&
        userId == other.userId &&
        value == other.value &&
        formResponse == other.formResponse &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
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
    return (newBuiltValueToStringHelper(r'GgetPollsData_getPolls_options_votes')
          ..add('G__typename', G__typename)
          ..add('pollOptionId', pollOptionId)
          ..add('userId', userId)
          ..add('value', value)
          ..add('formResponse', formResponse)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GgetPollsData_getPolls_options_votesBuilder
    implements
        Builder<GgetPollsData_getPolls_options_votes,
            GgetPollsData_getPolls_options_votesBuilder> {
  _$GgetPollsData_getPolls_options_votes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GgetPollsData_getPolls_options_votesBuilder() {
    GgetPollsData_getPolls_options_votes._initializeBuilder(this);
  }

  GgetPollsData_getPolls_options_votesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pollOptionId = $v.pollOptionId;
      _userId = $v.userId;
      _value = $v.value;
      _formResponse = $v.formResponse;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetPollsData_getPolls_options_votes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetPollsData_getPolls_options_votes;
  }

  @override
  void update(
      void Function(GgetPollsData_getPolls_options_votesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetPollsData_getPolls_options_votes build() => _build();

  _$GgetPollsData_getPolls_options_votes _build() {
    _$GgetPollsData_getPolls_options_votes _$result;
    try {
      _$result = _$v ??
          new _$GgetPollsData_getPolls_options_votes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GgetPollsData_getPolls_options_votes', 'G__typename'),
              pollOptionId: BuiltValueNullFieldError.checkNotNull(pollOptionId,
                  r'GgetPollsData_getPolls_options_votes', 'pollOptionId'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GgetPollsData_getPolls_options_votes', 'userId'),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'GgetPollsData_getPolls_options_votes', 'value'),
              formResponse: formResponse,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetPollsData_getPolls_options_votes',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GregisterUserData extends GregisterUserData {
  @override
  final String G__typename;
  @override
  final GregisterUserData_registerUser registerUser;

  factory _$GregisterUserData(
          [void Function(GregisterUserDataBuilder)? updates]) =>
      (new GregisterUserDataBuilder()..update(updates))._build();

  _$GregisterUserData._({required this.G__typename, required this.registerUser})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GregisterUserData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        registerUser, r'GregisterUserData', 'registerUser');
  }

  @override
  GregisterUserData rebuild(void Function(GregisterUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GregisterUserDataBuilder toBuilder() =>
      new GregisterUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GregisterUserData &&
        G__typename == other.G__typename &&
        registerUser == other.registerUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, registerUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GregisterUserData')
          ..add('G__typename', G__typename)
          ..add('registerUser', registerUser))
        .toString();
  }
}

class GregisterUserDataBuilder
    implements Builder<GregisterUserData, GregisterUserDataBuilder> {
  _$GregisterUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GregisterUserData_registerUserBuilder? _registerUser;
  GregisterUserData_registerUserBuilder get registerUser =>
      _$this._registerUser ??= new GregisterUserData_registerUserBuilder();
  set registerUser(GregisterUserData_registerUserBuilder? registerUser) =>
      _$this._registerUser = registerUser;

  GregisterUserDataBuilder() {
    GregisterUserData._initializeBuilder(this);
  }

  GregisterUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _registerUser = $v.registerUser.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GregisterUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GregisterUserData;
  }

  @override
  void update(void Function(GregisterUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GregisterUserData build() => _build();

  _$GregisterUserData _build() {
    _$GregisterUserData _$result;
    try {
      _$result = _$v ??
          new _$GregisterUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GregisterUserData', 'G__typename'),
              registerUser: registerUser.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'registerUser';
        registerUser.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GregisterUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GregisterUserData_registerUser extends GregisterUserData_registerUser {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GregisterUserData_registerUser(
          [void Function(GregisterUserData_registerUserBuilder)? updates]) =>
      (new GregisterUserData_registerUserBuilder()..update(updates))._build();

  _$GregisterUserData_registerUser._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GregisterUserData_registerUser', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GregisterUserData_registerUser', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GregisterUserData_registerUser', 'name');
  }

  @override
  GregisterUserData_registerUser rebuild(
          void Function(GregisterUserData_registerUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GregisterUserData_registerUserBuilder toBuilder() =>
      new GregisterUserData_registerUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GregisterUserData_registerUser &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GregisterUserData_registerUser')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GregisterUserData_registerUserBuilder
    implements
        Builder<GregisterUserData_registerUser,
            GregisterUserData_registerUserBuilder> {
  _$GregisterUserData_registerUser? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GregisterUserData_registerUserBuilder() {
    GregisterUserData_registerUser._initializeBuilder(this);
  }

  GregisterUserData_registerUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GregisterUserData_registerUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GregisterUserData_registerUser;
  }

  @override
  void update(void Function(GregisterUserData_registerUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GregisterUserData_registerUser build() => _build();

  _$GregisterUserData_registerUser _build() {
    final _$result = _$v ??
        new _$GregisterUserData_registerUser._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GregisterUserData_registerUser', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GregisterUserData_registerUser', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GregisterUserData_registerUser', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GinsertPollData extends GinsertPollData {
  @override
  final String G__typename;
  @override
  final GinsertPollData_insertPoll insertPoll;

  factory _$GinsertPollData([void Function(GinsertPollDataBuilder)? updates]) =>
      (new GinsertPollDataBuilder()..update(updates))._build();

  _$GinsertPollData._({required this.G__typename, required this.insertPoll})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GinsertPollData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        insertPoll, r'GinsertPollData', 'insertPoll');
  }

  @override
  GinsertPollData rebuild(void Function(GinsertPollDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GinsertPollDataBuilder toBuilder() =>
      new GinsertPollDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GinsertPollData &&
        G__typename == other.G__typename &&
        insertPoll == other.insertPoll;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, insertPoll.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GinsertPollData')
          ..add('G__typename', G__typename)
          ..add('insertPoll', insertPoll))
        .toString();
  }
}

class GinsertPollDataBuilder
    implements Builder<GinsertPollData, GinsertPollDataBuilder> {
  _$GinsertPollData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GinsertPollData_insertPollBuilder? _insertPoll;
  GinsertPollData_insertPollBuilder get insertPoll =>
      _$this._insertPoll ??= new GinsertPollData_insertPollBuilder();
  set insertPoll(GinsertPollData_insertPollBuilder? insertPoll) =>
      _$this._insertPoll = insertPoll;

  GinsertPollDataBuilder() {
    GinsertPollData._initializeBuilder(this);
  }

  GinsertPollDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _insertPoll = $v.insertPoll.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GinsertPollData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GinsertPollData;
  }

  @override
  void update(void Function(GinsertPollDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GinsertPollData build() => _build();

  _$GinsertPollData _build() {
    _$GinsertPollData _$result;
    try {
      _$result = _$v ??
          new _$GinsertPollData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GinsertPollData', 'G__typename'),
              insertPoll: insertPoll.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'insertPoll';
        insertPoll.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GinsertPollData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GinsertPollData_insertPoll extends GinsertPollData_insertPoll {
  @override
  final String G__typename;
  @override
  final BuiltList<GinsertPollData_insertPoll_options> options;
  @override
  final int id;
  @override
  final int userId;
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
  final _i2.GDate createdAt;

  factory _$GinsertPollData_insertPoll(
          [void Function(GinsertPollData_insertPollBuilder)? updates]) =>
      (new GinsertPollData_insertPollBuilder()..update(updates))._build();

  _$GinsertPollData_insertPoll._(
      {required this.G__typename,
      required this.options,
      required this.id,
      required this.userId,
      required this.title,
      this.subtitle,
      required this.body,
      this.pollKind,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GinsertPollData_insertPoll', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        options, r'GinsertPollData_insertPoll', 'options');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GinsertPollData_insertPoll', 'id');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GinsertPollData_insertPoll', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GinsertPollData_insertPoll', 'title');
    BuiltValueNullFieldError.checkNotNull(
        body, r'GinsertPollData_insertPoll', 'body');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GinsertPollData_insertPoll', 'createdAt');
  }

  @override
  GinsertPollData_insertPoll rebuild(
          void Function(GinsertPollData_insertPollBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GinsertPollData_insertPollBuilder toBuilder() =>
      new GinsertPollData_insertPollBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GinsertPollData_insertPoll &&
        G__typename == other.G__typename &&
        options == other.options &&
        id == other.id &&
        userId == other.userId &&
        title == other.title &&
        subtitle == other.subtitle &&
        body == other.body &&
        pollKind == other.pollKind &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, pollKind.hashCode);
    _$hash = $jc(_$hash, formJsonSchema.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GinsertPollData_insertPoll')
          ..add('G__typename', G__typename)
          ..add('options', options)
          ..add('id', id)
          ..add('userId', userId)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('body', body)
          ..add('pollKind', pollKind)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GinsertPollData_insertPollBuilder
    implements
        Builder<GinsertPollData_insertPoll, GinsertPollData_insertPollBuilder> {
  _$GinsertPollData_insertPoll? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GinsertPollData_insertPoll_options>? _options;
  ListBuilder<GinsertPollData_insertPoll_options> get options =>
      _$this._options ??= new ListBuilder<GinsertPollData_insertPoll_options>();
  set options(ListBuilder<GinsertPollData_insertPoll_options>? options) =>
      _$this._options = options;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GinsertPollData_insertPollBuilder() {
    GinsertPollData_insertPoll._initializeBuilder(this);
  }

  GinsertPollData_insertPollBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _options = $v.options.toBuilder();
      _id = $v.id;
      _userId = $v.userId;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _body = $v.body;
      _pollKind = $v.pollKind;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GinsertPollData_insertPoll other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GinsertPollData_insertPoll;
  }

  @override
  void update(void Function(GinsertPollData_insertPollBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GinsertPollData_insertPoll build() => _build();

  _$GinsertPollData_insertPoll _build() {
    _$GinsertPollData_insertPoll _$result;
    try {
      _$result = _$v ??
          new _$GinsertPollData_insertPoll._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GinsertPollData_insertPoll', 'G__typename'),
              options: options.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GinsertPollData_insertPoll', 'id'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GinsertPollData_insertPoll', 'userId'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GinsertPollData_insertPoll', 'title'),
              subtitle: subtitle,
              body: BuiltValueNullFieldError.checkNotNull(
                  body, r'GinsertPollData_insertPoll', 'body'),
              pollKind: pollKind,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        options.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GinsertPollData_insertPoll', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GinsertPollData_insertPoll_options
    extends GinsertPollData_insertPoll_options {
  @override
  final String G__typename;
  @override
  final BuiltList<GinsertPollData_insertPoll_options_votes> votes;
  @override
  final int id;
  @override
  final int pollId;
  @override
  final int? priority;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? formJsonSchema;
  @override
  final _i2.GDate createdAt;

  factory _$GinsertPollData_insertPoll_options(
          [void Function(GinsertPollData_insertPoll_optionsBuilder)?
              updates]) =>
      (new GinsertPollData_insertPoll_optionsBuilder()..update(updates))
          ._build();

  _$GinsertPollData_insertPoll_options._(
      {required this.G__typename,
      required this.votes,
      required this.id,
      required this.pollId,
      this.priority,
      this.description,
      this.url,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GinsertPollData_insertPoll_options', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        votes, r'GinsertPollData_insertPoll_options', 'votes');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GinsertPollData_insertPoll_options', 'id');
    BuiltValueNullFieldError.checkNotNull(
        pollId, r'GinsertPollData_insertPoll_options', 'pollId');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GinsertPollData_insertPoll_options', 'createdAt');
  }

  @override
  GinsertPollData_insertPoll_options rebuild(
          void Function(GinsertPollData_insertPoll_optionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GinsertPollData_insertPoll_optionsBuilder toBuilder() =>
      new GinsertPollData_insertPoll_optionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GinsertPollData_insertPoll_options &&
        G__typename == other.G__typename &&
        votes == other.votes &&
        id == other.id &&
        pollId == other.pollId &&
        priority == other.priority &&
        description == other.description &&
        url == other.url &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, votes.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pollId.hashCode);
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
    return (newBuiltValueToStringHelper(r'GinsertPollData_insertPoll_options')
          ..add('G__typename', G__typename)
          ..add('votes', votes)
          ..add('id', id)
          ..add('pollId', pollId)
          ..add('priority', priority)
          ..add('description', description)
          ..add('url', url)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GinsertPollData_insertPoll_optionsBuilder
    implements
        Builder<GinsertPollData_insertPoll_options,
            GinsertPollData_insertPoll_optionsBuilder> {
  _$GinsertPollData_insertPoll_options? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GinsertPollData_insertPoll_options_votes>? _votes;
  ListBuilder<GinsertPollData_insertPoll_options_votes> get votes =>
      _$this._votes ??=
          new ListBuilder<GinsertPollData_insertPoll_options_votes>();
  set votes(ListBuilder<GinsertPollData_insertPoll_options_votes>? votes) =>
      _$this._votes = votes;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _pollId;
  int? get pollId => _$this._pollId;
  set pollId(int? pollId) => _$this._pollId = pollId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GinsertPollData_insertPoll_optionsBuilder() {
    GinsertPollData_insertPoll_options._initializeBuilder(this);
  }

  GinsertPollData_insertPoll_optionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _votes = $v.votes.toBuilder();
      _id = $v.id;
      _pollId = $v.pollId;
      _priority = $v.priority;
      _description = $v.description;
      _url = $v.url;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GinsertPollData_insertPoll_options other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GinsertPollData_insertPoll_options;
  }

  @override
  void update(
      void Function(GinsertPollData_insertPoll_optionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GinsertPollData_insertPoll_options build() => _build();

  _$GinsertPollData_insertPoll_options _build() {
    _$GinsertPollData_insertPoll_options _$result;
    try {
      _$result = _$v ??
          new _$GinsertPollData_insertPoll_options._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GinsertPollData_insertPoll_options', 'G__typename'),
              votes: votes.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GinsertPollData_insertPoll_options', 'id'),
              pollId: BuiltValueNullFieldError.checkNotNull(
                  pollId, r'GinsertPollData_insertPoll_options', 'pollId'),
              priority: priority,
              description: description,
              url: url,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'votes';
        votes.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GinsertPollData_insertPoll_options', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GinsertPollData_insertPoll_options_votes
    extends GinsertPollData_insertPoll_options_votes {
  @override
  final String G__typename;
  @override
  final int pollOptionId;
  @override
  final int userId;
  @override
  final int value;
  @override
  final String? formResponse;
  @override
  final _i2.GDate createdAt;

  factory _$GinsertPollData_insertPoll_options_votes(
          [void Function(GinsertPollData_insertPoll_options_votesBuilder)?
              updates]) =>
      (new GinsertPollData_insertPoll_options_votesBuilder()..update(updates))
          ._build();

  _$GinsertPollData_insertPoll_options_votes._(
      {required this.G__typename,
      required this.pollOptionId,
      required this.userId,
      required this.value,
      this.formResponse,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GinsertPollData_insertPoll_options_votes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(pollOptionId,
        r'GinsertPollData_insertPoll_options_votes', 'pollOptionId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GinsertPollData_insertPoll_options_votes', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        value, r'GinsertPollData_insertPoll_options_votes', 'value');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GinsertPollData_insertPoll_options_votes', 'createdAt');
  }

  @override
  GinsertPollData_insertPoll_options_votes rebuild(
          void Function(GinsertPollData_insertPoll_options_votesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GinsertPollData_insertPoll_options_votesBuilder toBuilder() =>
      new GinsertPollData_insertPoll_options_votesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GinsertPollData_insertPoll_options_votes &&
        G__typename == other.G__typename &&
        pollOptionId == other.pollOptionId &&
        userId == other.userId &&
        value == other.value &&
        formResponse == other.formResponse &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
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
    return (newBuiltValueToStringHelper(
            r'GinsertPollData_insertPoll_options_votes')
          ..add('G__typename', G__typename)
          ..add('pollOptionId', pollOptionId)
          ..add('userId', userId)
          ..add('value', value)
          ..add('formResponse', formResponse)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GinsertPollData_insertPoll_options_votesBuilder
    implements
        Builder<GinsertPollData_insertPoll_options_votes,
            GinsertPollData_insertPoll_options_votesBuilder> {
  _$GinsertPollData_insertPoll_options_votes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GinsertPollData_insertPoll_options_votesBuilder() {
    GinsertPollData_insertPoll_options_votes._initializeBuilder(this);
  }

  GinsertPollData_insertPoll_options_votesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pollOptionId = $v.pollOptionId;
      _userId = $v.userId;
      _value = $v.value;
      _formResponse = $v.formResponse;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GinsertPollData_insertPoll_options_votes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GinsertPollData_insertPoll_options_votes;
  }

  @override
  void update(
      void Function(GinsertPollData_insertPoll_options_votesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GinsertPollData_insertPoll_options_votes build() => _build();

  _$GinsertPollData_insertPoll_options_votes _build() {
    _$GinsertPollData_insertPoll_options_votes _$result;
    try {
      _$result = _$v ??
          new _$GinsertPollData_insertPoll_options_votes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GinsertPollData_insertPoll_options_votes', 'G__typename'),
              pollOptionId: BuiltValueNullFieldError.checkNotNull(pollOptionId,
                  r'GinsertPollData_insertPoll_options_votes', 'pollOptionId'),
              userId: BuiltValueNullFieldError.checkNotNull(userId,
                  r'GinsertPollData_insertPoll_options_votes', 'userId'),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'GinsertPollData_insertPoll_options_votes', 'value'),
              formResponse: formResponse,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GinsertPollData_insertPoll_options_votes',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GaddPollOptionsData extends GaddPollOptionsData {
  @override
  final String G__typename;
  @override
  final GaddPollOptionsData_addPollOptions addPollOptions;

  factory _$GaddPollOptionsData(
          [void Function(GaddPollOptionsDataBuilder)? updates]) =>
      (new GaddPollOptionsDataBuilder()..update(updates))._build();

  _$GaddPollOptionsData._(
      {required this.G__typename, required this.addPollOptions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GaddPollOptionsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        addPollOptions, r'GaddPollOptionsData', 'addPollOptions');
  }

  @override
  GaddPollOptionsData rebuild(
          void Function(GaddPollOptionsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GaddPollOptionsDataBuilder toBuilder() =>
      new GaddPollOptionsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GaddPollOptionsData &&
        G__typename == other.G__typename &&
        addPollOptions == other.addPollOptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, addPollOptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GaddPollOptionsData')
          ..add('G__typename', G__typename)
          ..add('addPollOptions', addPollOptions))
        .toString();
  }
}

class GaddPollOptionsDataBuilder
    implements Builder<GaddPollOptionsData, GaddPollOptionsDataBuilder> {
  _$GaddPollOptionsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GaddPollOptionsData_addPollOptionsBuilder? _addPollOptions;
  GaddPollOptionsData_addPollOptionsBuilder get addPollOptions =>
      _$this._addPollOptions ??=
          new GaddPollOptionsData_addPollOptionsBuilder();
  set addPollOptions(
          GaddPollOptionsData_addPollOptionsBuilder? addPollOptions) =>
      _$this._addPollOptions = addPollOptions;

  GaddPollOptionsDataBuilder() {
    GaddPollOptionsData._initializeBuilder(this);
  }

  GaddPollOptionsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _addPollOptions = $v.addPollOptions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GaddPollOptionsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GaddPollOptionsData;
  }

  @override
  void update(void Function(GaddPollOptionsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GaddPollOptionsData build() => _build();

  _$GaddPollOptionsData _build() {
    _$GaddPollOptionsData _$result;
    try {
      _$result = _$v ??
          new _$GaddPollOptionsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GaddPollOptionsData', 'G__typename'),
              addPollOptions: addPollOptions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'addPollOptions';
        addPollOptions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GaddPollOptionsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GaddPollOptionsData_addPollOptions
    extends GaddPollOptionsData_addPollOptions {
  @override
  final String G__typename;
  @override
  final BuiltList<GaddPollOptionsData_addPollOptions_options> options;
  @override
  final int id;
  @override
  final int userId;
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
  final _i2.GDate createdAt;

  factory _$GaddPollOptionsData_addPollOptions(
          [void Function(GaddPollOptionsData_addPollOptionsBuilder)?
              updates]) =>
      (new GaddPollOptionsData_addPollOptionsBuilder()..update(updates))
          ._build();

  _$GaddPollOptionsData_addPollOptions._(
      {required this.G__typename,
      required this.options,
      required this.id,
      required this.userId,
      required this.title,
      this.subtitle,
      required this.body,
      this.pollKind,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GaddPollOptionsData_addPollOptions', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        options, r'GaddPollOptionsData_addPollOptions', 'options');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GaddPollOptionsData_addPollOptions', 'id');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GaddPollOptionsData_addPollOptions', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GaddPollOptionsData_addPollOptions', 'title');
    BuiltValueNullFieldError.checkNotNull(
        body, r'GaddPollOptionsData_addPollOptions', 'body');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GaddPollOptionsData_addPollOptions', 'createdAt');
  }

  @override
  GaddPollOptionsData_addPollOptions rebuild(
          void Function(GaddPollOptionsData_addPollOptionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GaddPollOptionsData_addPollOptionsBuilder toBuilder() =>
      new GaddPollOptionsData_addPollOptionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GaddPollOptionsData_addPollOptions &&
        G__typename == other.G__typename &&
        options == other.options &&
        id == other.id &&
        userId == other.userId &&
        title == other.title &&
        subtitle == other.subtitle &&
        body == other.body &&
        pollKind == other.pollKind &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, pollKind.hashCode);
    _$hash = $jc(_$hash, formJsonSchema.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GaddPollOptionsData_addPollOptions')
          ..add('G__typename', G__typename)
          ..add('options', options)
          ..add('id', id)
          ..add('userId', userId)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('body', body)
          ..add('pollKind', pollKind)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GaddPollOptionsData_addPollOptionsBuilder
    implements
        Builder<GaddPollOptionsData_addPollOptions,
            GaddPollOptionsData_addPollOptionsBuilder> {
  _$GaddPollOptionsData_addPollOptions? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GaddPollOptionsData_addPollOptions_options>? _options;
  ListBuilder<GaddPollOptionsData_addPollOptions_options> get options =>
      _$this._options ??=
          new ListBuilder<GaddPollOptionsData_addPollOptions_options>();
  set options(
          ListBuilder<GaddPollOptionsData_addPollOptions_options>? options) =>
      _$this._options = options;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GaddPollOptionsData_addPollOptionsBuilder() {
    GaddPollOptionsData_addPollOptions._initializeBuilder(this);
  }

  GaddPollOptionsData_addPollOptionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _options = $v.options.toBuilder();
      _id = $v.id;
      _userId = $v.userId;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _body = $v.body;
      _pollKind = $v.pollKind;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GaddPollOptionsData_addPollOptions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GaddPollOptionsData_addPollOptions;
  }

  @override
  void update(
      void Function(GaddPollOptionsData_addPollOptionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GaddPollOptionsData_addPollOptions build() => _build();

  _$GaddPollOptionsData_addPollOptions _build() {
    _$GaddPollOptionsData_addPollOptions _$result;
    try {
      _$result = _$v ??
          new _$GaddPollOptionsData_addPollOptions._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GaddPollOptionsData_addPollOptions', 'G__typename'),
              options: options.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GaddPollOptionsData_addPollOptions', 'id'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GaddPollOptionsData_addPollOptions', 'userId'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GaddPollOptionsData_addPollOptions', 'title'),
              subtitle: subtitle,
              body: BuiltValueNullFieldError.checkNotNull(
                  body, r'GaddPollOptionsData_addPollOptions', 'body'),
              pollKind: pollKind,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        options.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GaddPollOptionsData_addPollOptions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GaddPollOptionsData_addPollOptions_options
    extends GaddPollOptionsData_addPollOptions_options {
  @override
  final String G__typename;
  @override
  final BuiltList<GaddPollOptionsData_addPollOptions_options_votes> votes;
  @override
  final int id;
  @override
  final int pollId;
  @override
  final int? priority;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? formJsonSchema;
  @override
  final _i2.GDate createdAt;

  factory _$GaddPollOptionsData_addPollOptions_options(
          [void Function(GaddPollOptionsData_addPollOptions_optionsBuilder)?
              updates]) =>
      (new GaddPollOptionsData_addPollOptions_optionsBuilder()..update(updates))
          ._build();

  _$GaddPollOptionsData_addPollOptions_options._(
      {required this.G__typename,
      required this.votes,
      required this.id,
      required this.pollId,
      this.priority,
      this.description,
      this.url,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GaddPollOptionsData_addPollOptions_options', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        votes, r'GaddPollOptionsData_addPollOptions_options', 'votes');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GaddPollOptionsData_addPollOptions_options', 'id');
    BuiltValueNullFieldError.checkNotNull(
        pollId, r'GaddPollOptionsData_addPollOptions_options', 'pollId');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GaddPollOptionsData_addPollOptions_options', 'createdAt');
  }

  @override
  GaddPollOptionsData_addPollOptions_options rebuild(
          void Function(GaddPollOptionsData_addPollOptions_optionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GaddPollOptionsData_addPollOptions_optionsBuilder toBuilder() =>
      new GaddPollOptionsData_addPollOptions_optionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GaddPollOptionsData_addPollOptions_options &&
        G__typename == other.G__typename &&
        votes == other.votes &&
        id == other.id &&
        pollId == other.pollId &&
        priority == other.priority &&
        description == other.description &&
        url == other.url &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, votes.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pollId.hashCode);
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
    return (newBuiltValueToStringHelper(
            r'GaddPollOptionsData_addPollOptions_options')
          ..add('G__typename', G__typename)
          ..add('votes', votes)
          ..add('id', id)
          ..add('pollId', pollId)
          ..add('priority', priority)
          ..add('description', description)
          ..add('url', url)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GaddPollOptionsData_addPollOptions_optionsBuilder
    implements
        Builder<GaddPollOptionsData_addPollOptions_options,
            GaddPollOptionsData_addPollOptions_optionsBuilder> {
  _$GaddPollOptionsData_addPollOptions_options? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GaddPollOptionsData_addPollOptions_options_votes>? _votes;
  ListBuilder<GaddPollOptionsData_addPollOptions_options_votes> get votes =>
      _$this._votes ??=
          new ListBuilder<GaddPollOptionsData_addPollOptions_options_votes>();
  set votes(
          ListBuilder<GaddPollOptionsData_addPollOptions_options_votes>?
              votes) =>
      _$this._votes = votes;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _pollId;
  int? get pollId => _$this._pollId;
  set pollId(int? pollId) => _$this._pollId = pollId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GaddPollOptionsData_addPollOptions_optionsBuilder() {
    GaddPollOptionsData_addPollOptions_options._initializeBuilder(this);
  }

  GaddPollOptionsData_addPollOptions_optionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _votes = $v.votes.toBuilder();
      _id = $v.id;
      _pollId = $v.pollId;
      _priority = $v.priority;
      _description = $v.description;
      _url = $v.url;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GaddPollOptionsData_addPollOptions_options other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GaddPollOptionsData_addPollOptions_options;
  }

  @override
  void update(
      void Function(GaddPollOptionsData_addPollOptions_optionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GaddPollOptionsData_addPollOptions_options build() => _build();

  _$GaddPollOptionsData_addPollOptions_options _build() {
    _$GaddPollOptionsData_addPollOptions_options _$result;
    try {
      _$result = _$v ??
          new _$GaddPollOptionsData_addPollOptions_options._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GaddPollOptionsData_addPollOptions_options', 'G__typename'),
              votes: votes.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GaddPollOptionsData_addPollOptions_options', 'id'),
              pollId: BuiltValueNullFieldError.checkNotNull(pollId,
                  r'GaddPollOptionsData_addPollOptions_options', 'pollId'),
              priority: priority,
              description: description,
              url: url,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'votes';
        votes.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GaddPollOptionsData_addPollOptions_options',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GaddPollOptionsData_addPollOptions_options_votes
    extends GaddPollOptionsData_addPollOptions_options_votes {
  @override
  final String G__typename;
  @override
  final int pollOptionId;
  @override
  final int userId;
  @override
  final int value;
  @override
  final String? formResponse;
  @override
  final _i2.GDate createdAt;

  factory _$GaddPollOptionsData_addPollOptions_options_votes(
          [void Function(
                  GaddPollOptionsData_addPollOptions_options_votesBuilder)?
              updates]) =>
      (new GaddPollOptionsData_addPollOptions_options_votesBuilder()
            ..update(updates))
          ._build();

  _$GaddPollOptionsData_addPollOptions_options_votes._(
      {required this.G__typename,
      required this.pollOptionId,
      required this.userId,
      required this.value,
      this.formResponse,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GaddPollOptionsData_addPollOptions_options_votes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(pollOptionId,
        r'GaddPollOptionsData_addPollOptions_options_votes', 'pollOptionId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GaddPollOptionsData_addPollOptions_options_votes', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        value, r'GaddPollOptionsData_addPollOptions_options_votes', 'value');
    BuiltValueNullFieldError.checkNotNull(createdAt,
        r'GaddPollOptionsData_addPollOptions_options_votes', 'createdAt');
  }

  @override
  GaddPollOptionsData_addPollOptions_options_votes rebuild(
          void Function(GaddPollOptionsData_addPollOptions_options_votesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GaddPollOptionsData_addPollOptions_options_votesBuilder toBuilder() =>
      new GaddPollOptionsData_addPollOptions_options_votesBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GaddPollOptionsData_addPollOptions_options_votes &&
        G__typename == other.G__typename &&
        pollOptionId == other.pollOptionId &&
        userId == other.userId &&
        value == other.value &&
        formResponse == other.formResponse &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
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
    return (newBuiltValueToStringHelper(
            r'GaddPollOptionsData_addPollOptions_options_votes')
          ..add('G__typename', G__typename)
          ..add('pollOptionId', pollOptionId)
          ..add('userId', userId)
          ..add('value', value)
          ..add('formResponse', formResponse)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GaddPollOptionsData_addPollOptions_options_votesBuilder
    implements
        Builder<GaddPollOptionsData_addPollOptions_options_votes,
            GaddPollOptionsData_addPollOptions_options_votesBuilder> {
  _$GaddPollOptionsData_addPollOptions_options_votes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GaddPollOptionsData_addPollOptions_options_votesBuilder() {
    GaddPollOptionsData_addPollOptions_options_votes._initializeBuilder(this);
  }

  GaddPollOptionsData_addPollOptions_options_votesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pollOptionId = $v.pollOptionId;
      _userId = $v.userId;
      _value = $v.value;
      _formResponse = $v.formResponse;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GaddPollOptionsData_addPollOptions_options_votes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GaddPollOptionsData_addPollOptions_options_votes;
  }

  @override
  void update(
      void Function(GaddPollOptionsData_addPollOptions_options_votesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GaddPollOptionsData_addPollOptions_options_votes build() => _build();

  _$GaddPollOptionsData_addPollOptions_options_votes _build() {
    _$GaddPollOptionsData_addPollOptions_options_votes _$result;
    try {
      _$result = _$v ??
          new _$GaddPollOptionsData_addPollOptions_options_votes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GaddPollOptionsData_addPollOptions_options_votes',
                  'G__typename'),
              pollOptionId: BuiltValueNullFieldError.checkNotNull(
                  pollOptionId,
                  r'GaddPollOptionsData_addPollOptions_options_votes',
                  'pollOptionId'),
              userId:
                  BuiltValueNullFieldError.checkNotNull(
                      userId,
                      r'GaddPollOptionsData_addPollOptions_options_votes',
                      'userId'),
              value: BuiltValueNullFieldError.checkNotNull(value,
                  r'GaddPollOptionsData_addPollOptions_options_votes', 'value'),
              formResponse: formResponse,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GaddPollOptionsData_addPollOptions_options_votes',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GvotePollData extends GvotePollData {
  @override
  final String G__typename;
  @override
  final GvotePollData_votePoll votePoll;

  factory _$GvotePollData([void Function(GvotePollDataBuilder)? updates]) =>
      (new GvotePollDataBuilder()..update(updates))._build();

  _$GvotePollData._({required this.G__typename, required this.votePoll})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GvotePollData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        votePoll, r'GvotePollData', 'votePoll');
  }

  @override
  GvotePollData rebuild(void Function(GvotePollDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GvotePollDataBuilder toBuilder() => new GvotePollDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GvotePollData &&
        G__typename == other.G__typename &&
        votePoll == other.votePoll;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, votePoll.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GvotePollData')
          ..add('G__typename', G__typename)
          ..add('votePoll', votePoll))
        .toString();
  }
}

class GvotePollDataBuilder
    implements Builder<GvotePollData, GvotePollDataBuilder> {
  _$GvotePollData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GvotePollData_votePollBuilder? _votePoll;
  GvotePollData_votePollBuilder get votePoll =>
      _$this._votePoll ??= new GvotePollData_votePollBuilder();
  set votePoll(GvotePollData_votePollBuilder? votePoll) =>
      _$this._votePoll = votePoll;

  GvotePollDataBuilder() {
    GvotePollData._initializeBuilder(this);
  }

  GvotePollDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _votePoll = $v.votePoll.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GvotePollData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GvotePollData;
  }

  @override
  void update(void Function(GvotePollDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GvotePollData build() => _build();

  _$GvotePollData _build() {
    _$GvotePollData _$result;
    try {
      _$result = _$v ??
          new _$GvotePollData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GvotePollData', 'G__typename'),
              votePoll: votePoll.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'votePoll';
        votePoll.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GvotePollData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GvotePollData_votePoll extends GvotePollData_votePoll {
  @override
  final String G__typename;
  @override
  final int? ok;
  @override
  final String? err;
  @override
  final bool isOk;

  factory _$GvotePollData_votePoll(
          [void Function(GvotePollData_votePollBuilder)? updates]) =>
      (new GvotePollData_votePollBuilder()..update(updates))._build();

  _$GvotePollData_votePoll._(
      {required this.G__typename, this.ok, this.err, required this.isOk})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GvotePollData_votePoll', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        isOk, r'GvotePollData_votePoll', 'isOk');
  }

  @override
  GvotePollData_votePoll rebuild(
          void Function(GvotePollData_votePollBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GvotePollData_votePollBuilder toBuilder() =>
      new GvotePollData_votePollBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GvotePollData_votePoll &&
        G__typename == other.G__typename &&
        ok == other.ok &&
        err == other.err &&
        isOk == other.isOk;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, ok.hashCode);
    _$hash = $jc(_$hash, err.hashCode);
    _$hash = $jc(_$hash, isOk.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GvotePollData_votePoll')
          ..add('G__typename', G__typename)
          ..add('ok', ok)
          ..add('err', err)
          ..add('isOk', isOk))
        .toString();
  }
}

class GvotePollData_votePollBuilder
    implements Builder<GvotePollData_votePoll, GvotePollData_votePollBuilder> {
  _$GvotePollData_votePoll? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _ok;
  int? get ok => _$this._ok;
  set ok(int? ok) => _$this._ok = ok;

  String? _err;
  String? get err => _$this._err;
  set err(String? err) => _$this._err = err;

  bool? _isOk;
  bool? get isOk => _$this._isOk;
  set isOk(bool? isOk) => _$this._isOk = isOk;

  GvotePollData_votePollBuilder() {
    GvotePollData_votePoll._initializeBuilder(this);
  }

  GvotePollData_votePollBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _ok = $v.ok;
      _err = $v.err;
      _isOk = $v.isOk;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GvotePollData_votePoll other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GvotePollData_votePoll;
  }

  @override
  void update(void Function(GvotePollData_votePollBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GvotePollData_votePoll build() => _build();

  _$GvotePollData_votePoll _build() {
    final _$result = _$v ??
        new _$GvotePollData_votePoll._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GvotePollData_votePoll', 'G__typename'),
            ok: ok,
            err: err,
            isOk: BuiltValueNullFieldError.checkNotNull(
                isOk, r'GvotePollData_votePoll', 'isOk'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullUserData extends GFullUserData {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GFullUserData([void Function(GFullUserDataBuilder)? updates]) =>
      (new GFullUserDataBuilder()..update(updates))._build();

  _$GFullUserData._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullUserData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GFullUserData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GFullUserData', 'name');
  }

  @override
  GFullUserData rebuild(void Function(GFullUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullUserDataBuilder toBuilder() => new GFullUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullUserData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFullUserData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GFullUserDataBuilder
    implements Builder<GFullUserData, GFullUserDataBuilder> {
  _$GFullUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFullUserDataBuilder() {
    GFullUserData._initializeBuilder(this);
  }

  GFullUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullUserData;
  }

  @override
  void update(void Function(GFullUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullUserData build() => _build();

  _$GFullUserData _build() {
    final _$result = _$v ??
        new _$GFullUserData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GFullUserData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFullUserData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GFullUserData', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollData extends GFullPollData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFullPollData_options> options;
  @override
  final int id;
  @override
  final int userId;
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
  final _i2.GDate createdAt;

  factory _$GFullPollData([void Function(GFullPollDataBuilder)? updates]) =>
      (new GFullPollDataBuilder()..update(updates))._build();

  _$GFullPollData._(
      {required this.G__typename,
      required this.options,
      required this.id,
      required this.userId,
      required this.title,
      this.subtitle,
      required this.body,
      this.pollKind,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullPollData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(options, r'GFullPollData', 'options');
    BuiltValueNullFieldError.checkNotNull(id, r'GFullPollData', 'id');
    BuiltValueNullFieldError.checkNotNull(userId, r'GFullPollData', 'userId');
    BuiltValueNullFieldError.checkNotNull(title, r'GFullPollData', 'title');
    BuiltValueNullFieldError.checkNotNull(body, r'GFullPollData', 'body');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFullPollData', 'createdAt');
  }

  @override
  GFullPollData rebuild(void Function(GFullPollDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollDataBuilder toBuilder() => new GFullPollDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollData &&
        G__typename == other.G__typename &&
        options == other.options &&
        id == other.id &&
        userId == other.userId &&
        title == other.title &&
        subtitle == other.subtitle &&
        body == other.body &&
        pollKind == other.pollKind &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, pollKind.hashCode);
    _$hash = $jc(_$hash, formJsonSchema.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFullPollData')
          ..add('G__typename', G__typename)
          ..add('options', options)
          ..add('id', id)
          ..add('userId', userId)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('body', body)
          ..add('pollKind', pollKind)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GFullPollDataBuilder
    implements Builder<GFullPollData, GFullPollDataBuilder> {
  _$GFullPollData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFullPollData_options>? _options;
  ListBuilder<GFullPollData_options> get options =>
      _$this._options ??= new ListBuilder<GFullPollData_options>();
  set options(ListBuilder<GFullPollData_options>? options) =>
      _$this._options = options;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GFullPollDataBuilder() {
    GFullPollData._initializeBuilder(this);
  }

  GFullPollDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _options = $v.options.toBuilder();
      _id = $v.id;
      _userId = $v.userId;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _body = $v.body;
      _pollKind = $v.pollKind;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullPollData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollData;
  }

  @override
  void update(void Function(GFullPollDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollData build() => _build();

  _$GFullPollData _build() {
    _$GFullPollData _$result;
    try {
      _$result = _$v ??
          new _$GFullPollData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFullPollData', 'G__typename'),
              options: options.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFullPollData', 'id'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GFullPollData', 'userId'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFullPollData', 'title'),
              subtitle: subtitle,
              body: BuiltValueNullFieldError.checkNotNull(
                  body, r'GFullPollData', 'body'),
              pollKind: pollKind,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        options.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullPollData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollData_options extends GFullPollData_options {
  @override
  final String G__typename;
  @override
  final BuiltList<GFullPollData_options_votes> votes;
  @override
  final int id;
  @override
  final int pollId;
  @override
  final int? priority;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? formJsonSchema;
  @override
  final _i2.GDate createdAt;

  factory _$GFullPollData_options(
          [void Function(GFullPollData_optionsBuilder)? updates]) =>
      (new GFullPollData_optionsBuilder()..update(updates))._build();

  _$GFullPollData_options._(
      {required this.G__typename,
      required this.votes,
      required this.id,
      required this.pollId,
      this.priority,
      this.description,
      this.url,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullPollData_options', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        votes, r'GFullPollData_options', 'votes');
    BuiltValueNullFieldError.checkNotNull(id, r'GFullPollData_options', 'id');
    BuiltValueNullFieldError.checkNotNull(
        pollId, r'GFullPollData_options', 'pollId');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFullPollData_options', 'createdAt');
  }

  @override
  GFullPollData_options rebuild(
          void Function(GFullPollData_optionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollData_optionsBuilder toBuilder() =>
      new GFullPollData_optionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollData_options &&
        G__typename == other.G__typename &&
        votes == other.votes &&
        id == other.id &&
        pollId == other.pollId &&
        priority == other.priority &&
        description == other.description &&
        url == other.url &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, votes.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pollId.hashCode);
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
    return (newBuiltValueToStringHelper(r'GFullPollData_options')
          ..add('G__typename', G__typename)
          ..add('votes', votes)
          ..add('id', id)
          ..add('pollId', pollId)
          ..add('priority', priority)
          ..add('description', description)
          ..add('url', url)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GFullPollData_optionsBuilder
    implements Builder<GFullPollData_options, GFullPollData_optionsBuilder> {
  _$GFullPollData_options? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFullPollData_options_votes>? _votes;
  ListBuilder<GFullPollData_options_votes> get votes =>
      _$this._votes ??= new ListBuilder<GFullPollData_options_votes>();
  set votes(ListBuilder<GFullPollData_options_votes>? votes) =>
      _$this._votes = votes;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _pollId;
  int? get pollId => _$this._pollId;
  set pollId(int? pollId) => _$this._pollId = pollId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GFullPollData_optionsBuilder() {
    GFullPollData_options._initializeBuilder(this);
  }

  GFullPollData_optionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _votes = $v.votes.toBuilder();
      _id = $v.id;
      _pollId = $v.pollId;
      _priority = $v.priority;
      _description = $v.description;
      _url = $v.url;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullPollData_options other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollData_options;
  }

  @override
  void update(void Function(GFullPollData_optionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollData_options build() => _build();

  _$GFullPollData_options _build() {
    _$GFullPollData_options _$result;
    try {
      _$result = _$v ??
          new _$GFullPollData_options._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFullPollData_options', 'G__typename'),
              votes: votes.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFullPollData_options', 'id'),
              pollId: BuiltValueNullFieldError.checkNotNull(
                  pollId, r'GFullPollData_options', 'pollId'),
              priority: priority,
              description: description,
              url: url,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'votes';
        votes.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullPollData_options', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollData_options_votes extends GFullPollData_options_votes {
  @override
  final String G__typename;
  @override
  final int pollOptionId;
  @override
  final int userId;
  @override
  final int value;
  @override
  final String? formResponse;
  @override
  final _i2.GDate createdAt;

  factory _$GFullPollData_options_votes(
          [void Function(GFullPollData_options_votesBuilder)? updates]) =>
      (new GFullPollData_options_votesBuilder()..update(updates))._build();

  _$GFullPollData_options_votes._(
      {required this.G__typename,
      required this.pollOptionId,
      required this.userId,
      required this.value,
      this.formResponse,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullPollData_options_votes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        pollOptionId, r'GFullPollData_options_votes', 'pollOptionId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GFullPollData_options_votes', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        value, r'GFullPollData_options_votes', 'value');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFullPollData_options_votes', 'createdAt');
  }

  @override
  GFullPollData_options_votes rebuild(
          void Function(GFullPollData_options_votesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollData_options_votesBuilder toBuilder() =>
      new GFullPollData_options_votesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollData_options_votes &&
        G__typename == other.G__typename &&
        pollOptionId == other.pollOptionId &&
        userId == other.userId &&
        value == other.value &&
        formResponse == other.formResponse &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
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
    return (newBuiltValueToStringHelper(r'GFullPollData_options_votes')
          ..add('G__typename', G__typename)
          ..add('pollOptionId', pollOptionId)
          ..add('userId', userId)
          ..add('value', value)
          ..add('formResponse', formResponse)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GFullPollData_options_votesBuilder
    implements
        Builder<GFullPollData_options_votes,
            GFullPollData_options_votesBuilder> {
  _$GFullPollData_options_votes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GFullPollData_options_votesBuilder() {
    GFullPollData_options_votes._initializeBuilder(this);
  }

  GFullPollData_options_votesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pollOptionId = $v.pollOptionId;
      _userId = $v.userId;
      _value = $v.value;
      _formResponse = $v.formResponse;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullPollData_options_votes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollData_options_votes;
  }

  @override
  void update(void Function(GFullPollData_options_votesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollData_options_votes build() => _build();

  _$GFullPollData_options_votes _build() {
    _$GFullPollData_options_votes _$result;
    try {
      _$result = _$v ??
          new _$GFullPollData_options_votes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFullPollData_options_votes', 'G__typename'),
              pollOptionId: BuiltValueNullFieldError.checkNotNull(
                  pollOptionId, r'GFullPollData_options_votes', 'pollOptionId'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GFullPollData_options_votes', 'userId'),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'GFullPollData_options_votes', 'value'),
              formResponse: formResponse,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullPollData_options_votes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollOptionData extends GFullPollOptionData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFullPollOptionData_votes> votes;
  @override
  final int id;
  @override
  final int pollId;
  @override
  final int? priority;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? formJsonSchema;
  @override
  final _i2.GDate createdAt;

  factory _$GFullPollOptionData(
          [void Function(GFullPollOptionDataBuilder)? updates]) =>
      (new GFullPollOptionDataBuilder()..update(updates))._build();

  _$GFullPollOptionData._(
      {required this.G__typename,
      required this.votes,
      required this.id,
      required this.pollId,
      this.priority,
      this.description,
      this.url,
      this.formJsonSchema,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullPollOptionData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        votes, r'GFullPollOptionData', 'votes');
    BuiltValueNullFieldError.checkNotNull(id, r'GFullPollOptionData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        pollId, r'GFullPollOptionData', 'pollId');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFullPollOptionData', 'createdAt');
  }

  @override
  GFullPollOptionData rebuild(
          void Function(GFullPollOptionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollOptionDataBuilder toBuilder() =>
      new GFullPollOptionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollOptionData &&
        G__typename == other.G__typename &&
        votes == other.votes &&
        id == other.id &&
        pollId == other.pollId &&
        priority == other.priority &&
        description == other.description &&
        url == other.url &&
        formJsonSchema == other.formJsonSchema &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, votes.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pollId.hashCode);
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
    return (newBuiltValueToStringHelper(r'GFullPollOptionData')
          ..add('G__typename', G__typename)
          ..add('votes', votes)
          ..add('id', id)
          ..add('pollId', pollId)
          ..add('priority', priority)
          ..add('description', description)
          ..add('url', url)
          ..add('formJsonSchema', formJsonSchema)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GFullPollOptionDataBuilder
    implements Builder<GFullPollOptionData, GFullPollOptionDataBuilder> {
  _$GFullPollOptionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFullPollOptionData_votes>? _votes;
  ListBuilder<GFullPollOptionData_votes> get votes =>
      _$this._votes ??= new ListBuilder<GFullPollOptionData_votes>();
  set votes(ListBuilder<GFullPollOptionData_votes>? votes) =>
      _$this._votes = votes;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _pollId;
  int? get pollId => _$this._pollId;
  set pollId(int? pollId) => _$this._pollId = pollId;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GFullPollOptionDataBuilder() {
    GFullPollOptionData._initializeBuilder(this);
  }

  GFullPollOptionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _votes = $v.votes.toBuilder();
      _id = $v.id;
      _pollId = $v.pollId;
      _priority = $v.priority;
      _description = $v.description;
      _url = $v.url;
      _formJsonSchema = $v.formJsonSchema;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullPollOptionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollOptionData;
  }

  @override
  void update(void Function(GFullPollOptionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollOptionData build() => _build();

  _$GFullPollOptionData _build() {
    _$GFullPollOptionData _$result;
    try {
      _$result = _$v ??
          new _$GFullPollOptionData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFullPollOptionData', 'G__typename'),
              votes: votes.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFullPollOptionData', 'id'),
              pollId: BuiltValueNullFieldError.checkNotNull(
                  pollId, r'GFullPollOptionData', 'pollId'),
              priority: priority,
              description: description,
              url: url,
              formJsonSchema: formJsonSchema,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'votes';
        votes.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullPollOptionData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollOptionData_votes extends GFullPollOptionData_votes {
  @override
  final String G__typename;
  @override
  final int pollOptionId;
  @override
  final int userId;
  @override
  final int value;
  @override
  final String? formResponse;
  @override
  final _i2.GDate createdAt;

  factory _$GFullPollOptionData_votes(
          [void Function(GFullPollOptionData_votesBuilder)? updates]) =>
      (new GFullPollOptionData_votesBuilder()..update(updates))._build();

  _$GFullPollOptionData_votes._(
      {required this.G__typename,
      required this.pollOptionId,
      required this.userId,
      required this.value,
      this.formResponse,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullPollOptionData_votes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        pollOptionId, r'GFullPollOptionData_votes', 'pollOptionId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GFullPollOptionData_votes', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        value, r'GFullPollOptionData_votes', 'value');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFullPollOptionData_votes', 'createdAt');
  }

  @override
  GFullPollOptionData_votes rebuild(
          void Function(GFullPollOptionData_votesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollOptionData_votesBuilder toBuilder() =>
      new GFullPollOptionData_votesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollOptionData_votes &&
        G__typename == other.G__typename &&
        pollOptionId == other.pollOptionId &&
        userId == other.userId &&
        value == other.value &&
        formResponse == other.formResponse &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
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
    return (newBuiltValueToStringHelper(r'GFullPollOptionData_votes')
          ..add('G__typename', G__typename)
          ..add('pollOptionId', pollOptionId)
          ..add('userId', userId)
          ..add('value', value)
          ..add('formResponse', formResponse)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GFullPollOptionData_votesBuilder
    implements
        Builder<GFullPollOptionData_votes, GFullPollOptionData_votesBuilder> {
  _$GFullPollOptionData_votes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GFullPollOptionData_votesBuilder() {
    GFullPollOptionData_votes._initializeBuilder(this);
  }

  GFullPollOptionData_votesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pollOptionId = $v.pollOptionId;
      _userId = $v.userId;
      _value = $v.value;
      _formResponse = $v.formResponse;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullPollOptionData_votes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollOptionData_votes;
  }

  @override
  void update(void Function(GFullPollOptionData_votesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollOptionData_votes build() => _build();

  _$GFullPollOptionData_votes _build() {
    _$GFullPollOptionData_votes _$result;
    try {
      _$result = _$v ??
          new _$GFullPollOptionData_votes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFullPollOptionData_votes', 'G__typename'),
              pollOptionId: BuiltValueNullFieldError.checkNotNull(
                  pollOptionId, r'GFullPollOptionData_votes', 'pollOptionId'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GFullPollOptionData_votes', 'userId'),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'GFullPollOptionData_votes', 'value'),
              formResponse: formResponse,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullPollOptionData_votes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFullPollOptionVoteData extends GFullPollOptionVoteData {
  @override
  final String G__typename;
  @override
  final int pollOptionId;
  @override
  final int userId;
  @override
  final int value;
  @override
  final String? formResponse;
  @override
  final _i2.GDate createdAt;

  factory _$GFullPollOptionVoteData(
          [void Function(GFullPollOptionVoteDataBuilder)? updates]) =>
      (new GFullPollOptionVoteDataBuilder()..update(updates))._build();

  _$GFullPollOptionVoteData._(
      {required this.G__typename,
      required this.pollOptionId,
      required this.userId,
      required this.value,
      this.formResponse,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFullPollOptionVoteData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        pollOptionId, r'GFullPollOptionVoteData', 'pollOptionId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GFullPollOptionVoteData', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        value, r'GFullPollOptionVoteData', 'value');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFullPollOptionVoteData', 'createdAt');
  }

  @override
  GFullPollOptionVoteData rebuild(
          void Function(GFullPollOptionVoteDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFullPollOptionVoteDataBuilder toBuilder() =>
      new GFullPollOptionVoteDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFullPollOptionVoteData &&
        G__typename == other.G__typename &&
        pollOptionId == other.pollOptionId &&
        userId == other.userId &&
        value == other.value &&
        formResponse == other.formResponse &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
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
    return (newBuiltValueToStringHelper(r'GFullPollOptionVoteData')
          ..add('G__typename', G__typename)
          ..add('pollOptionId', pollOptionId)
          ..add('userId', userId)
          ..add('value', value)
          ..add('formResponse', formResponse)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GFullPollOptionVoteDataBuilder
    implements
        Builder<GFullPollOptionVoteData, GFullPollOptionVoteDataBuilder> {
  _$GFullPollOptionVoteData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  _i2.GDateBuilder? _createdAt;
  _i2.GDateBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateBuilder();
  set createdAt(_i2.GDateBuilder? createdAt) => _$this._createdAt = createdAt;

  GFullPollOptionVoteDataBuilder() {
    GFullPollOptionVoteData._initializeBuilder(this);
  }

  GFullPollOptionVoteDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pollOptionId = $v.pollOptionId;
      _userId = $v.userId;
      _value = $v.value;
      _formResponse = $v.formResponse;
      _createdAt = $v.createdAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFullPollOptionVoteData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFullPollOptionVoteData;
  }

  @override
  void update(void Function(GFullPollOptionVoteDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFullPollOptionVoteData build() => _build();

  _$GFullPollOptionVoteData _build() {
    _$GFullPollOptionVoteData _$result;
    try {
      _$result = _$v ??
          new _$GFullPollOptionVoteData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFullPollOptionVoteData', 'G__typename'),
              pollOptionId: BuiltValueNullFieldError.checkNotNull(
                  pollOptionId, r'GFullPollOptionVoteData', 'pollOptionId'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GFullPollOptionVoteData', 'userId'),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'GFullPollOptionVoteData', 'value'),
              formResponse: formResponse,
              createdAt: createdAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFullPollOptionVoteData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
