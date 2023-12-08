import 'package:typesql/typesql.dart';
import 'dart:convert' show jsonDecode;

class UsersUpdate with BaseDataClass implements SqlUpdateModel<Users> {
  final int? id;
  final String? name;
  const UsersUpdate({
    this.id,
    this.name,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('UsersUpdate', {
        'id': id,
        'name': name,
      });
  factory UsersUpdate.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['id', 'name'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final name,
      ] =>
        UsersUpdate(
          id: id == null ? null : id as int,
          name: name == null ? null : name as String,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for UsersUpdate.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'users';
}

class UsersInsert with BaseDataClass implements SqlInsertModel<Users> {
  final int? id;
  final String name;
  const UsersInsert({
    this.id,
    required this.name,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('UsersInsert', {
        'id': id,
        'name': name,
      });
  factory UsersInsert.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['id', 'name'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final name,
      ] =>
        UsersInsert(
          id: id == null ? null : id as int,
          name: name as String,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for UsersInsert.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'users';
}

class Users with BaseDataClass implements SqlReturnModel {
  final int id;
  final String name;
  const Users({
    required this.id,
    required this.name,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('users', {
        'id': id,
        'name': name,
      });
  factory Users.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['id', 'name'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final name,
      ] =>
        Users(
          id: id as int,
          name: name as String,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for Users.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'users';
}

class UsersKeyId
    with BaseDataClass
    implements SqlUniqueKeyModel<Users, UsersUpdate> {
  final int id;
  const UsersKeyId({
    required this.id,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('UsersKeyId', {
        'id': id,
      });
  factory UsersKeyId.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['id'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
      ] =>
        UsersKeyId(
          id: id as int,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for UsersKeyId.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'users';
}

class PollUpdate with BaseDataClass implements SqlUpdateModel<Poll> {
  final int? id;
  final int? userId;
  final String? title;
  final Option<String>? subtitle;
  final String? body;
  final Option<String>? pollKind;
  final Option<String>? formJsonSchema;
  final DateTime? createdAt;
  const PollUpdate({
    this.id,
    this.userId,
    this.title,
    this.subtitle,
    this.body,
    this.pollKind,
    this.formJsonSchema,
    this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollUpdate', {
        'id': id,
        'userId': userId,
        'title': title,
        'subtitle': subtitle,
        'body': body,
        'pollKind': pollKind,
        'formJsonSchema': formJsonSchema,
        'createdAt': createdAt,
      });
  factory PollUpdate.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'userId',
            'title',
            'subtitle',
            'body',
            'pollKind',
            'formJsonSchema',
            'createdAt'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final userId,
        final title,
        final subtitle,
        final body,
        final pollKind,
        final formJsonSchema,
        final createdAt,
      ] =>
        PollUpdate(
          id: id == null ? null : id as int,
          userId: userId == null ? null : userId as int,
          title: title == null ? null : title as String,
          subtitle: subtitle == null
              ? null
              : Option.fromJson(subtitle, (subtitle) => subtitle as String),
          body: body == null ? null : body as String,
          pollKind: pollKind == null
              ? null
              : Option.fromJson(pollKind, (pollKind) => pollKind as String),
          formJsonSchema: formJsonSchema == null
              ? null
              : Option.fromJson(
                  formJsonSchema, (formJsonSchema) => formJsonSchema as String),
          createdAt: createdAt == null
              ? null
              : createdAt is int
                  ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
                  : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollUpdate.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll';
}

class PollInsert with BaseDataClass implements SqlInsertModel<Poll> {
  final int? id;
  final int userId;
  final String title;
  final String? subtitle;
  final String body;
  final String? pollKind;
  final String? formJsonSchema;
  final DateTime? createdAt;
  const PollInsert({
    this.id,
    required this.userId,
    required this.title,
    this.subtitle,
    required this.body,
    this.pollKind,
    this.formJsonSchema,
    this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollInsert', {
        'id': id,
        'userId': userId,
        'title': title,
        'subtitle': subtitle,
        'body': body,
        'pollKind': pollKind,
        'formJsonSchema': formJsonSchema,
        'createdAt': createdAt,
      });
  factory PollInsert.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'userId',
            'title',
            'subtitle',
            'body',
            'pollKind',
            'formJsonSchema',
            'createdAt'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final userId,
        final title,
        final subtitle,
        final body,
        final pollKind,
        final formJsonSchema,
        final createdAt,
      ] =>
        PollInsert(
          id: id == null ? null : id as int,
          userId: userId as int,
          title: title as String,
          subtitle: subtitle == null ? null : subtitle as String,
          body: body as String,
          pollKind: pollKind == null ? null : pollKind as String,
          formJsonSchema:
              formJsonSchema == null ? null : formJsonSchema as String,
          createdAt: createdAt == null
              ? null
              : createdAt is int
                  ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
                  : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollInsert.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll';
}

class Poll with BaseDataClass implements SqlReturnModel {
  final int id;
  final int userId;
  final String title;
  final String? subtitle;
  final String body;
  final String? pollKind;
  final String? formJsonSchema;
  final DateTime createdAt;
  const Poll({
    required this.id,
    required this.userId,
    required this.title,
    this.subtitle,
    required this.body,
    this.pollKind,
    this.formJsonSchema,
    required this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('poll', {
        'id': id,
        'userId': userId,
        'title': title,
        'subtitle': subtitle,
        'body': body,
        'pollKind': pollKind,
        'formJsonSchema': formJsonSchema,
        'createdAt': createdAt,
      });
  factory Poll.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'userId',
            'title',
            'subtitle',
            'body',
            'pollKind',
            'formJsonSchema',
            'createdAt'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final userId,
        final title,
        final subtitle,
        final body,
        final pollKind,
        final formJsonSchema,
        final createdAt,
      ] =>
        Poll(
          id: id as int,
          userId: userId as int,
          title: title as String,
          subtitle: subtitle == null ? null : subtitle as String,
          body: body as String,
          pollKind: pollKind == null ? null : pollKind as String,
          formJsonSchema:
              formJsonSchema == null ? null : formJsonSchema as String,
          createdAt: createdAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
              : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for Poll.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll';
}

class PollKeyId
    with BaseDataClass
    implements SqlUniqueKeyModel<Poll, PollUpdate> {
  final int id;
  const PollKeyId({
    required this.id,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollKeyId', {
        'id': id,
      });
  factory PollKeyId.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['id'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
      ] =>
        PollKeyId(
          id: id as int,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollKeyId.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll';
}

class PollOptionUpdate
    with BaseDataClass
    implements SqlUpdateModel<PollOption> {
  final int? id;
  final int? pollId;
  final Option<int>? priority;
  final Option<String>? description;
  final Option<String>? url;
  final Option<String>? formJsonSchema;
  final DateTime? createdAt;
  const PollOptionUpdate({
    this.id,
    this.pollId,
    this.priority,
    this.description,
    this.url,
    this.formJsonSchema,
    this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollOptionUpdate', {
        'id': id,
        'pollId': pollId,
        'priority': priority,
        'description': description,
        'url': url,
        'formJsonSchema': formJsonSchema,
        'createdAt': createdAt,
      });
  factory PollOptionUpdate.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'pollId',
            'priority',
            'description',
            'url',
            'formJsonSchema',
            'createdAt'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final pollId,
        final priority,
        final description,
        final url,
        final formJsonSchema,
        final createdAt,
      ] =>
        PollOptionUpdate(
          id: id == null ? null : id as int,
          pollId: pollId == null ? null : pollId as int,
          priority: priority == null
              ? null
              : Option.fromJson(priority, (priority) => priority as int),
          description: description == null
              ? null
              : Option.fromJson(
                  description, (description) => description as String),
          url:
              url == null ? null : Option.fromJson(url, (url) => url as String),
          formJsonSchema: formJsonSchema == null
              ? null
              : Option.fromJson(
                  formJsonSchema, (formJsonSchema) => formJsonSchema as String),
          createdAt: createdAt == null
              ? null
              : createdAt is int
                  ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
                  : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollOptionUpdate.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_option';
}

class PollOptionInsert
    with BaseDataClass
    implements SqlInsertModel<PollOption> {
  final int? id;
  final int pollId;
  final int? priority;
  final String? description;
  final String? url;
  final String? formJsonSchema;
  final DateTime? createdAt;
  const PollOptionInsert({
    this.id,
    required this.pollId,
    this.priority,
    this.description,
    this.url,
    this.formJsonSchema,
    this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollOptionInsert', {
        'id': id,
        'pollId': pollId,
        'priority': priority,
        'description': description,
        'url': url,
        'formJsonSchema': formJsonSchema,
        'createdAt': createdAt,
      });
  factory PollOptionInsert.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'pollId',
            'priority',
            'description',
            'url',
            'formJsonSchema',
            'createdAt'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final pollId,
        final priority,
        final description,
        final url,
        final formJsonSchema,
        final createdAt,
      ] =>
        PollOptionInsert(
          id: id == null ? null : id as int,
          pollId: pollId as int,
          priority: priority == null ? null : priority as int,
          description: description == null ? null : description as String,
          url: url == null ? null : url as String,
          formJsonSchema:
              formJsonSchema == null ? null : formJsonSchema as String,
          createdAt: createdAt == null
              ? null
              : createdAt is int
                  ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
                  : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollOptionInsert.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_option';
}

class PollOption with BaseDataClass implements SqlReturnModel {
  final int id;
  final int pollId;
  final int? priority;
  final String? description;
  final String? url;
  final String? formJsonSchema;
  final DateTime createdAt;
  const PollOption({
    required this.id,
    required this.pollId,
    this.priority,
    this.description,
    this.url,
    this.formJsonSchema,
    required this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('poll_option', {
        'id': id,
        'pollId': pollId,
        'priority': priority,
        'description': description,
        'url': url,
        'formJsonSchema': formJsonSchema,
        'createdAt': createdAt,
      });
  factory PollOption.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'pollId',
            'priority',
            'description',
            'url',
            'formJsonSchema',
            'createdAt'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final pollId,
        final priority,
        final description,
        final url,
        final formJsonSchema,
        final createdAt,
      ] =>
        PollOption(
          id: id as int,
          pollId: pollId as int,
          priority: priority == null ? null : priority as int,
          description: description == null ? null : description as String,
          url: url == null ? null : url as String,
          formJsonSchema:
              formJsonSchema == null ? null : formJsonSchema as String,
          createdAt: createdAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
              : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollOption.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_option';
}

class PollOptionKeyId
    with BaseDataClass
    implements SqlUniqueKeyModel<PollOption, PollOptionUpdate> {
  final int id;
  const PollOptionKeyId({
    required this.id,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollOptionKeyId', {
        'id': id,
      });
  factory PollOptionKeyId.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['id'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
      ] =>
        PollOptionKeyId(
          id: id as int,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollOptionKeyId.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_option';
}

class PollVoteUpdate with BaseDataClass implements SqlUpdateModel<PollVote> {
  final int? pollId;
  final int? userId;
  final Option<String>? formResponse;
  final DateTime? createdAt;
  const PollVoteUpdate({
    this.pollId,
    this.userId,
    this.formResponse,
    this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollVoteUpdate', {
        'pollId': pollId,
        'userId': userId,
        'formResponse': formResponse,
        'createdAt': createdAt,
      });
  factory PollVoteUpdate.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['pollId', 'userId', 'formResponse', 'createdAt']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollId,
        final userId,
        final formResponse,
        final createdAt,
      ] =>
        PollVoteUpdate(
          pollId: pollId == null ? null : pollId as int,
          userId: userId == null ? null : userId as int,
          formResponse: formResponse == null
              ? null
              : Option.fromJson(
                  formResponse, (formResponse) => formResponse as String),
          createdAt: createdAt == null
              ? null
              : createdAt is int
                  ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
                  : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollVoteUpdate.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_vote';
}

class PollVoteInsert with BaseDataClass implements SqlInsertModel<PollVote> {
  final int pollId;
  final int userId;
  final String? formResponse;
  final DateTime? createdAt;
  const PollVoteInsert({
    required this.pollId,
    required this.userId,
    this.formResponse,
    this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollVoteInsert', {
        'pollId': pollId,
        'userId': userId,
        'formResponse': formResponse,
        'createdAt': createdAt,
      });
  factory PollVoteInsert.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['pollId', 'userId', 'formResponse', 'createdAt']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollId,
        final userId,
        final formResponse,
        final createdAt,
      ] =>
        PollVoteInsert(
          pollId: pollId as int,
          userId: userId as int,
          formResponse: formResponse == null ? null : formResponse as String,
          createdAt: createdAt == null
              ? null
              : createdAt is int
                  ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
                  : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollVoteInsert.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_vote';
}

class PollVote with BaseDataClass implements SqlReturnModel {
  final int pollId;
  final int userId;
  final String? formResponse;
  final DateTime createdAt;
  const PollVote({
    required this.pollId,
    required this.userId,
    this.formResponse,
    required this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('poll_vote', {
        'pollId': pollId,
        'userId': userId,
        'formResponse': formResponse,
        'createdAt': createdAt,
      });
  factory PollVote.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['pollId', 'userId', 'formResponse', 'createdAt']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollId,
        final userId,
        final formResponse,
        final createdAt,
      ] =>
        PollVote(
          pollId: pollId as int,
          userId: userId as int,
          formResponse: formResponse == null ? null : formResponse as String,
          createdAt: createdAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
              : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollVote.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_vote';
}

class PollVoteKeyPollIdUserId
    with BaseDataClass
    implements SqlUniqueKeyModel<PollVote, PollVoteUpdate> {
  final int pollId;
  final int userId;
  const PollVoteKeyPollIdUserId({
    required this.pollId,
    required this.userId,
  });
  @override
  DataClassProps get dataClassProps =>
      DataClassProps('PollVoteKeyPollIdUserId', {
        'pollId': pollId,
        'userId': userId,
      });
  factory PollVoteKeyPollIdUserId.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['pollId', 'userId'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollId,
        final userId,
      ] =>
        PollVoteKeyPollIdUserId(
          pollId: pollId as int,
          userId: userId as int,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollVoteKeyPollIdUserId.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_vote';
}

class PollOptionVoteUpdate
    with BaseDataClass
    implements SqlUpdateModel<PollOptionVote> {
  final int? pollOptionId;
  final int? userId;
  final int? value;
  final Option<String>? formResponse;
  final DateTime? createdAt;
  const PollOptionVoteUpdate({
    this.pollOptionId,
    this.userId,
    this.value,
    this.formResponse,
    this.createdAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('PollOptionVoteUpdate', {
        'pollOptionId': pollOptionId,
        'userId': userId,
        'value': value,
        'formResponse': formResponse,
        'createdAt': createdAt,
      });
  factory PollOptionVoteUpdate.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['pollOptionId', 'userId', 'value', 'formResponse', 'createdAt']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollOptionId,
        final userId,
        final value,
        final formResponse,
        final createdAt,
      ] =>
        PollOptionVoteUpdate(
          pollOptionId: pollOptionId == null ? null : pollOptionId as int,
          userId: userId == null ? null : userId as int,
          value: value == null ? null : value as int,
          formResponse: formResponse == null
              ? null
              : Option.fromJson(
                  formResponse, (formResponse) => formResponse as String),
          createdAt: createdAt == null
              ? null
              : createdAt is int
                  ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
                  : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollOptionVoteUpdate.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_option_vote';
}

class PollOptionVoteInsert
    with BaseDataClass
    implements SqlInsertModel<PollOptionVote> {
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
  @override
  DataClassProps get dataClassProps => DataClassProps('PollOptionVoteInsert', {
        'pollOptionId': pollOptionId,
        'userId': userId,
        'value': value,
        'formResponse': formResponse,
        'createdAt': createdAt,
      });
  factory PollOptionVoteInsert.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['pollOptionId', 'userId', 'value', 'formResponse', 'createdAt']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollOptionId,
        final userId,
        final value,
        final formResponse,
        final createdAt,
      ] =>
        PollOptionVoteInsert(
          pollOptionId: pollOptionId as int,
          userId: userId as int,
          value: value as int,
          formResponse: formResponse == null ? null : formResponse as String,
          createdAt: createdAt == null
              ? null
              : createdAt is int
                  ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
                  : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollOptionVoteInsert.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_option_vote';
}

class PollOptionVote with BaseDataClass implements SqlReturnModel {
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
  @override
  DataClassProps get dataClassProps => DataClassProps('poll_option_vote', {
        'pollOptionId': pollOptionId,
        'userId': userId,
        'value': value,
        'formResponse': formResponse,
        'createdAt': createdAt,
      });
  factory PollOptionVote.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['pollOptionId', 'userId', 'value', 'formResponse', 'createdAt']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollOptionId,
        final userId,
        final value,
        final formResponse,
        final createdAt,
      ] =>
        PollOptionVote(
          pollOptionId: pollOptionId as int,
          userId: userId as int,
          value: value as int,
          formResponse: formResponse == null ? null : formResponse as String,
          createdAt: createdAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
              : DateTime.parse(createdAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollOptionVote.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_option_vote';
}

class PollOptionVoteKeyPollOptionIdUserId
    with BaseDataClass
    implements SqlUniqueKeyModel<PollOptionVote, PollOptionVoteUpdate> {
  final int pollOptionId;
  final int userId;
  const PollOptionVoteKeyPollOptionIdUserId({
    required this.pollOptionId,
    required this.userId,
  });
  @override
  DataClassProps get dataClassProps =>
      DataClassProps('PollOptionVoteKeyPollOptionIdUserId', {
        'pollOptionId': pollOptionId,
        'userId': userId,
      });
  factory PollOptionVoteKeyPollOptionIdUserId.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['pollOptionId', 'userId']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollOptionId,
        final userId,
      ] =>
        PollOptionVoteKeyPollOptionIdUserId(
          pollOptionId: pollOptionId as int,
          userId: userId as int,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollOptionVoteKeyPollOptionIdUserId.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_option_vote';
}

class PollWithOptionsJsonUpdate
    with BaseDataClass
    implements SqlUpdateModel<PollWithOptionsJson> {
  final int? pollId;
  final int? pollUserId;
  final PollWithOptionsJsonUpdateJsonValue? jsonValue;
  const PollWithOptionsJsonUpdate({
    this.pollId,
    this.pollUserId,
    this.jsonValue,
  });
  @override
  DataClassProps get dataClassProps =>
      DataClassProps('PollWithOptionsJsonUpdate', {
        'poll.id': pollId,
        'poll.userId': pollUserId,
        'jsonValue': jsonValue,
      });
  factory PollWithOptionsJsonUpdate.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['poll.id', 'poll.userId', 'jsonValue']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollId,
        final pollUserId,
        final jsonValue,
      ] =>
        PollWithOptionsJsonUpdate(
          pollId: pollId == null ? null : pollId as int,
          pollUserId: pollUserId == null ? null : pollUserId as int,
          jsonValue: jsonValue == null
              ? null
              : PollWithOptionsJsonUpdateJsonValue.fromJson(jsonValue),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollWithOptionsJsonUpdate.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_with_options_json';
}

class PollWithOptionsJsonUpdateJsonValue with BaseDataClass {
  final int id;
  final int userId;
  final String title;
  final String? subtitle;
  final String body;
  final DateTime createdAt;
  final List<int?> options;
  const PollWithOptionsJsonUpdateJsonValue({
    required this.id,
    required this.userId,
    required this.title,
    this.subtitle,
    required this.body,
    required this.createdAt,
    required this.options,
  });
  @override
  DataClassProps get dataClassProps =>
      DataClassProps('PollWithOptionsJsonUpdateJsonValue', {
        'id': id,
        'userId': userId,
        'title': title,
        'subtitle': subtitle,
        'body': body,
        'createdAt': createdAt,
        'options': options,
      });
  factory PollWithOptionsJsonUpdateJsonValue.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'userId',
            'title',
            'subtitle',
            'body',
            'createdAt',
            'options'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final userId,
        final title,
        final subtitle,
        final body,
        final createdAt,
        final options,
      ] =>
        PollWithOptionsJsonUpdateJsonValue(
          id: id as int,
          userId: userId as int,
          title: title as String,
          subtitle: subtitle == null ? null : subtitle as String,
          body: body as String,
          createdAt: createdAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
              : DateTime.parse(createdAt as String),
          options: (options as Iterable)
              .map((item) => item == null ? null : item as int)
              .toList(),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollWithOptionsJsonUpdateJsonValue.fromJson ${obj.runtimeType}'),
    };
  }
}

typedef PollWithOptionsJsonInsert = PollWithOptionsJson;

class PollWithOptionsJson
    with BaseDataClass
    implements SqlInsertModel<PollWithOptionsJson>, SqlReturnModel {
  final int pollId;
  final int pollUserId;
  final PollWithOptionsJsonJsonValue jsonValue;
  const PollWithOptionsJson({
    required this.pollId,
    required this.pollUserId,
    required this.jsonValue,
  });
  @override
  DataClassProps get dataClassProps =>
      DataClassProps('poll_with_options_json', {
        'poll.id': pollId,
        'poll.userId': pollUserId,
        'jsonValue': jsonValue,
      });
  factory PollWithOptionsJson.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['poll.id', 'poll.userId', 'jsonValue']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final pollId,
        final pollUserId,
        final jsonValue,
      ] =>
        PollWithOptionsJson(
          pollId: pollId as int,
          pollUserId: pollUserId as int,
          jsonValue: PollWithOptionsJsonJsonValue.fromJson(jsonValue),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollWithOptionsJson.fromJson ${obj.runtimeType}'),
    };
  }
  @override
  String get table => 'poll_with_options_json';
}

class PollWithOptionsJsonJsonValue with BaseDataClass {
  final int id;
  final int userId;
  final String title;
  final String? subtitle;
  final String body;
  final DateTime createdAt;
  final List<int?> options;
  const PollWithOptionsJsonJsonValue({
    required this.id,
    required this.userId,
    required this.title,
    this.subtitle,
    required this.body,
    required this.createdAt,
    required this.options,
  });
  @override
  DataClassProps get dataClassProps =>
      DataClassProps('PollWithOptionsJsonJsonValue', {
        'id': id,
        'userId': userId,
        'title': title,
        'subtitle': subtitle,
        'body': body,
        'createdAt': createdAt,
        'options': options,
      });
  factory PollWithOptionsJsonJsonValue.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'userId',
            'title',
            'subtitle',
            'body',
            'createdAt',
            'options'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final userId,
        final title,
        final subtitle,
        final body,
        final createdAt,
        final options,
      ] =>
        PollWithOptionsJsonJsonValue(
          id: id as int,
          userId: userId as int,
          title: title as String,
          subtitle: subtitle == null ? null : subtitle as String,
          body: body as String,
          createdAt: createdAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
              : DateTime.parse(createdAt as String),
          options: (options as Iterable)
              .map((item) => item == null ? null : item as int)
              .toList(),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for PollWithOptionsJsonJsonValue.fromJson ${obj.runtimeType}'),
    };
  }
}

class QuerySelectUsers1 with BaseDataClass {
  final int usersId;
  final String usersName;
  const QuerySelectUsers1({
    required this.usersId,
    required this.usersName,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('QuerySelectUsers1', {
        'users.id': usersId,
        'users.name': usersName,
      });
  factory QuerySelectUsers1.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['users.id', 'users.name']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final usersId,
        final usersName,
      ] =>
        QuerySelectUsers1(
          usersId: usersId as int,
          usersName: usersName as String,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for QuerySelectUsers1.fromJson ${obj.runtimeType}'),
    };
  }
}

class QuerySelectUsers2 with BaseDataClass {
  final int usersId;
  final String usersName;
  const QuerySelectUsers2({
    required this.usersId,
    required this.usersName,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('QuerySelectUsers2', {
        'users.id': usersId,
        'users.name': usersName,
      });
  factory QuerySelectUsers2.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['users.id', 'users.name']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final usersId,
        final usersName,
      ] =>
        QuerySelectUsers2(
          usersId: usersId as int,
          usersName: usersName as String,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for QuerySelectUsers2.fromJson ${obj.runtimeType}'),
    };
  }
}

class QuerySelectUsers2Args with BaseDataClass {
  final int minId;
  const QuerySelectUsers2Args({
    required this.minId,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('QuerySelectUsers2Args', {
        'minId': minId,
      });
  factory QuerySelectUsers2Args.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['minId'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final minId,
      ] =>
        QuerySelectUsers2Args(
          minId: minId as int,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for QuerySelectUsers2Args.fromJson ${obj.runtimeType}'),
    };
  }
}

class InsertUsers1Args with BaseDataClass {
  final String c;
  const InsertUsers1Args({
    required this.c,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('InsertUsers1Args', {
        'c': c,
      });
  factory InsertUsers1Args.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['c'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final c,
      ] =>
        InsertUsers1Args(
          c: c as String,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for InsertUsers1Args.fromJson ${obj.runtimeType}'),
    };
  }
}

class UpdateUserNameArgs with BaseDataClass {
  final dynamic name;
  final dynamic id;
  const UpdateUserNameArgs({
    this.name,
    this.id,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('UpdateUserNameArgs', {
        'name': name,
        'id': id,
      });
  factory UpdateUserNameArgs.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['name', 'id'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final name,
        final id,
      ] =>
        UpdateUserNameArgs(
          name: name,
          id: id,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for UpdateUserNameArgs.fromJson ${obj.runtimeType}'),
    };
  }
}

class DeleteUsersByIdArgs with BaseDataClass {
  final List<dynamic> ids;
  const DeleteUsersByIdArgs({
    required this.ids,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('DeleteUsersByIdArgs', {
        'ids': ids,
      });
  factory DeleteUsersByIdArgs.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['ids'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final ids,
      ] =>
        DeleteUsersByIdArgs(
          ids: (ids as Iterable).map((item) => item).toList(),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for DeleteUsersByIdArgs.fromJson ${obj.runtimeType}'),
    };
  }
}

class QuerySelectUser1 with BaseDataClass {
  final dynamic usersId;
  final dynamic userName;
  final int? poId;
  final int pollId;
  final int pollUserId;
  final String pollTitle;
  final String? pollSubtitle;
  final String pollBody;
  final String? pollPollKind;
  final String? pollFormJsonSchema;
  final DateTime pollCreatedAt;
  const QuerySelectUser1({
    this.usersId,
    this.userName,
    this.poId,
    required this.pollId,
    required this.pollUserId,
    required this.pollTitle,
    this.pollSubtitle,
    required this.pollBody,
    this.pollPollKind,
    this.pollFormJsonSchema,
    required this.pollCreatedAt,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('QuerySelectUser1', {
        'users.id': usersId,
        'user_name': userName,
        'po.id': poId,
        'poll.id': pollId,
        'poll.userId': pollUserId,
        'poll.title': pollTitle,
        'poll.subtitle': pollSubtitle,
        'poll.body': pollBody,
        'poll.pollKind': pollPollKind,
        'poll.formJsonSchema': pollFormJsonSchema,
        'poll.createdAt': pollCreatedAt,
      });
  factory QuerySelectUser1.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'users.id',
            'user_name',
            'po.id',
            'poll.id',
            'poll.userId',
            'poll.title',
            'poll.subtitle',
            'poll.body',
            'poll.pollKind',
            'poll.formJsonSchema',
            'poll.createdAt'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final usersId,
        final userName,
        final poId,
        final pollId,
        final pollUserId,
        final pollTitle,
        final pollSubtitle,
        final pollBody,
        final pollPollKind,
        final pollFormJsonSchema,
        final pollCreatedAt,
      ] =>
        QuerySelectUser1(
          usersId: usersId,
          userName: userName,
          poId: poId == null ? null : poId as int,
          pollId: pollId as int,
          pollUserId: pollUserId as int,
          pollTitle: pollTitle as String,
          pollSubtitle: pollSubtitle == null ? null : pollSubtitle as String,
          pollBody: pollBody as String,
          pollPollKind: pollPollKind == null ? null : pollPollKind as String,
          pollFormJsonSchema:
              pollFormJsonSchema == null ? null : pollFormJsonSchema as String,
          pollCreatedAt: pollCreatedAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(pollCreatedAt)
              : DateTime.parse(pollCreatedAt as String),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for QuerySelectUser1.fromJson ${obj.runtimeType}'),
    };
  }
}

class UserWithPosts with BaseDataClass {
  final dynamic usersId;
  final dynamic userName;
  final List<UserWithPostsPollItem> poll;
  const UserWithPosts({
    this.usersId,
    this.userName,
    required this.poll,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('UserWithPosts', {
        'users.id': usersId,
        'user_name': userName,
        'poll': poll,
      });
  factory UserWithPosts.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['users.id', 'user_name', 'poll']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final usersId,
        final userName,
        final poll,
      ] =>
        UserWithPosts(
          usersId: usersId,
          userName: userName,
          poll: (poll as Iterable)
              .map((item) => UserWithPostsPollItem.fromJson(item))
              .toList(),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for UserWithPosts.fromJson ${obj.runtimeType}'),
    };
  }
}

class UserWithPostsPollItem with BaseDataClass {
  final int id;
  final int userId;
  final String title;
  final String? subtitle;
  final String body;
  final DateTime createdAt;
  final List<int?> options;
  const UserWithPostsPollItem({
    required this.id,
    required this.userId,
    required this.title,
    this.subtitle,
    required this.body,
    required this.createdAt,
    required this.options,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('UserWithPostsPollItem', {
        'id': id,
        'userId': userId,
        'title': title,
        'subtitle': subtitle,
        'body': body,
        'createdAt': createdAt,
        'options': options,
      });
  factory UserWithPostsPollItem.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'userId',
            'title',
            'subtitle',
            'body',
            'createdAt',
            'options'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final userId,
        final title,
        final subtitle,
        final body,
        final createdAt,
        final options,
      ] =>
        UserWithPostsPollItem(
          id: id as int,
          userId: userId as int,
          title: title as String,
          subtitle: subtitle == null ? null : subtitle as String,
          body: body as String,
          createdAt: createdAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
              : DateTime.parse(createdAt as String),
          options: (options as Iterable)
              .map((item) => item == null ? null : item as int)
              .toList(),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for UserWithPostsPollItem.fromJson ${obj.runtimeType}'),
    };
  }
}

class UserWithPostsJSON with BaseDataClass {
  final dynamic usersId;
  final dynamic userName;
  final List<UserWithPostsJSONPollItem> poll;
  const UserWithPostsJSON({
    this.usersId,
    this.userName,
    required this.poll,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('UserWithPostsJSON', {
        'users.id': usersId,
        'userName': userName,
        'poll': poll,
      });
  factory UserWithPostsJSON.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['users.id', 'userName', 'poll']
            .map((f) => obj[f])
            .toList(growable: false)
        : obj;
    return switch (list) {
      [
        final usersId,
        final userName,
        final poll,
      ] =>
        UserWithPostsJSON(
          usersId: usersId,
          userName: userName,
          poll: (poll as Iterable)
              .map((item) => UserWithPostsJSONPollItem.fromJson(item))
              .toList(),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for UserWithPostsJSON.fromJson ${obj.runtimeType}'),
    };
  }
}

class UserWithPostsJSONPollItem with BaseDataClass {
  final int id;
  final int userId;
  final String title;
  final String? subtitle;
  final String body;
  final DateTime createdAt;
  final List<int?> options;
  const UserWithPostsJSONPollItem({
    required this.id,
    required this.userId,
    required this.title,
    this.subtitle,
    required this.body,
    required this.createdAt,
    required this.options,
  });
  @override
  DataClassProps get dataClassProps =>
      DataClassProps('UserWithPostsJSONPollItem', {
        'id': id,
        'userId': userId,
        'title': title,
        'subtitle': subtitle,
        'body': body,
        'createdAt': createdAt,
        'options': options,
      });
  factory UserWithPostsJSONPollItem.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const [
            'id',
            'userId',
            'title',
            'subtitle',
            'body',
            'createdAt',
            'options'
          ].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final userId,
        final title,
        final subtitle,
        final body,
        final createdAt,
        final options,
      ] =>
        UserWithPostsJSONPollItem(
          id: id as int,
          userId: userId as int,
          title: title as String,
          subtitle: subtitle == null ? null : subtitle as String,
          body: body as String,
          createdAt: createdAt is int
              ? DateTime.fromMicrosecondsSinceEpoch(createdAt)
              : DateTime.parse(createdAt as String),
          options: (options as Iterable)
              .map((item) => item == null ? null : item as int)
              .toList(),
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for UserWithPostsJSONPollItem.fromJson ${obj.runtimeType}'),
    };
  }
}

class DeleteUsers1 with BaseDataClass {
  final int id;
  final String name;
  const DeleteUsers1({
    required this.id,
    required this.name,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('DeleteUsers1', {
        'id': id,
        'name': name,
      });
  factory DeleteUsers1.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['id', 'name'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final id,
        final name,
      ] =>
        DeleteUsers1(
          id: id as int,
          name: name as String,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for DeleteUsers1.fromJson ${obj.runtimeType}'),
    };
  }
}

class DeleteUsers1Args with BaseDataClass {
  final int arg0;
  const DeleteUsers1Args({
    required this.arg0,
  });
  @override
  DataClassProps get dataClassProps => DataClassProps('DeleteUsers1Args', {
        'arg0': arg0,
      });
  factory DeleteUsers1Args.fromJson(Object? obj_) {
    final obj = obj_ is String ? jsonDecode(obj_) : obj_;
    final list = obj is Map
        ? const ['arg0'].map((f) => obj[f]).toList(growable: false)
        : obj;
    return switch (list) {
      [
        final arg0,
      ] =>
        DeleteUsers1Args(
          arg0: arg0 as int,
        ),
      _ => throw Exception(
          'Invalid JSON or SQL Row for DeleteUsers1Args.fromJson ${obj.runtimeType}'),
    };
  }
}

class TableQueriesQueries {
  final SqlExecutor executor;
  final SqlTypedExecutor typedExecutor;

  TableQueriesQueries(this.executor)
      : typedExecutor = SqlTypedExecutor(executor, types: tableSpecs);

  static const Map<Type, SqlTypeData> tableSpecs = {
    Users: SqlTypeData<Users, UsersUpdate>.value(
        'users',
        [
          (name: 'id', type: BTypeInteger(), hasDefault: true),
          (name: 'name', type: BTypeString(), hasDefault: false)
        ],
        Users.fromJson),
    Poll: SqlTypeData<Poll, PollUpdate>.value(
        'poll',
        [
          (name: 'id', type: BTypeInteger(), hasDefault: true),
          (name: 'userId', type: BTypeInteger(), hasDefault: false),
          (name: 'title', type: BTypeString(), hasDefault: false),
          (name: 'subtitle', type: BTypeString(), hasDefault: true),
          (name: 'body', type: BTypeString(), hasDefault: false),
          (name: 'pollKind', type: BTypeString(), hasDefault: true),
          (name: 'formJsonSchema', type: BTypeString(), hasDefault: true),
          (name: 'createdAt', type: BTypeDateTime(), hasDefault: true)
        ],
        Poll.fromJson),
    PollOption: SqlTypeData<PollOption, PollOptionUpdate>.value(
        'poll_option',
        [
          (name: 'id', type: BTypeInteger(), hasDefault: true),
          (name: 'pollId', type: BTypeInteger(), hasDefault: false),
          (name: 'priority', type: BTypeInteger(), hasDefault: true),
          (name: 'description', type: BTypeString(), hasDefault: true),
          (name: 'url', type: BTypeString(), hasDefault: true),
          (name: 'formJsonSchema', type: BTypeString(), hasDefault: true),
          (name: 'createdAt', type: BTypeDateTime(), hasDefault: true)
        ],
        PollOption.fromJson),
    PollVote: SqlTypeData<PollVote, PollVoteUpdate>.value(
        'poll_vote',
        [
          (name: 'pollId', type: BTypeInteger(), hasDefault: false),
          (name: 'userId', type: BTypeInteger(), hasDefault: false),
          (name: 'formResponse', type: BTypeString(), hasDefault: true),
          (name: 'createdAt', type: BTypeDateTime(), hasDefault: true)
        ],
        PollVote.fromJson),
    PollOptionVote: SqlTypeData<PollOptionVote, PollOptionVoteUpdate>.value(
        'poll_option_vote',
        [
          (name: 'pollOptionId', type: BTypeInteger(), hasDefault: false),
          (name: 'userId', type: BTypeInteger(), hasDefault: false),
          (name: 'value', type: BTypeInteger(), hasDefault: false),
          (name: 'formResponse', type: BTypeString(), hasDefault: true),
          (name: 'createdAt', type: BTypeDateTime(), hasDefault: true)
        ],
        PollOptionVote.fromJson),
    PollWithOptionsJson:
        SqlTypeData<PollWithOptionsJson, PollWithOptionsJsonUpdate>.value(
            'poll_with_options_json',
            [
              (name: 'poll.id', type: BTypeInteger(), hasDefault: false),
              (name: 'poll.userId', type: BTypeInteger(), hasDefault: false),
              (
                name: 'jsonValue',
                type: BTypeJsonObject({
                  'id': BTypeInteger(),
                  'userId': BTypeInteger(),
                  'title': BTypeString(),
                  'subtitle': BTypeNullable(BTypeString()),
                  'body': BTypeString(),
                  'createdAt': BTypeDateTime(),
                  'options': BTypeJsonArray(BTypeNullable(BTypeInteger()))
                }),
                hasDefault: false
              )
            ],
            PollWithOptionsJson.fromJson),
  };
  late final SqlTypedController<Users, UsersUpdate> usersController =
      SqlTypedController(typedExecutor);
  late final SqlTypedController<Poll, PollUpdate> pollController =
      SqlTypedController(typedExecutor);
  late final SqlTypedController<PollOption, PollOptionUpdate>
      pollOptionController = SqlTypedController(typedExecutor);
  late final SqlTypedController<PollVote, PollVoteUpdate> pollVoteController =
      SqlTypedController(typedExecutor);
  late final SqlTypedController<PollOptionVote, PollOptionVoteUpdate>
      pollOptionVoteController = SqlTypedController(typedExecutor);
  late final SqlTypedController<PollWithOptionsJson, PollWithOptionsJsonUpdate>
      pollWithOptionsJsonController = SqlTypedController(typedExecutor);
  Future<SqlExecution> createTableUsers() async {
    final result = await executor.execute('''-- 
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT NOT NULL
)''');
    return result;
  }

  Future<List<QuerySelectUsers1>> querySelectUsers1() async {
    final result = await executor.query('''
-- 
SELECT *
FROM users''');
    return result.map(QuerySelectUsers1.fromJson).toList();
  }

  Future<List<QuerySelectUsers2>> querySelectUsers2(
      QuerySelectUsers2Args args) async {
    final result = await executor.query('''
-- 
SELECT *
FROM users
WHERE users.id >= :minId''', [args.minId]);
    return result.map(QuerySelectUsers2.fromJson).toList();
  }

  Future<SqlExecution> insertUsers1(InsertUsers1Args args) async {
    final result = await executor.execute('''
-- 
INSERT INTO users(id, name)
VALUES (1, 'name1'),
    (2, :c)''', [args.c]);
    return result;
  }

  Future<SqlExecution> updateUserName(UpdateUserNameArgs args) async {
    final result = await executor.execute('''
-- {"name":"updateUserName"}
UPDATE user
SET name = :name
WHERE :id = id
RETURNING *''', [args.name, args.id]);
    return result;
  }

  Future<SqlExecution> deleteUsersById(DeleteUsersByIdArgs args) async {
    final result = await executor.execute('''
-- {"name":"deleteUsersById"}
DELETE FROM user
WHERE id IN (:ids)''', [args.ids]);
    return result;
  }

  Future<SqlExecution> createTablePoll() async {
    final result = await executor.execute('''
-- 
CREATE TABLE poll (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    userId INTEGER NOT NULL REFERENCES users(id),
    title TEXT NOT NULL,
    subtitle TEXT NULL,
    body TEXT NOT NULL,
    pollKind VARCHAR(512) NULL,
    formJsonSchema JSON NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)''');
    return result;
  }

  Future<SqlExecution> createTablePollOption() async {
    final result = await executor.execute('''
-- 
CREATE TABLE poll_option (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    pollId INTEGER NOT NULL REFERENCES poll(id),
    priority INT default 0,
    description TEXT NULL,
    url TEXT NULL,
    formJsonSchema JSON NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)''');
    return result;
  }

  Future<SqlExecution> createTablePollVote() async {
    final result = await executor.execute('''
-- -- 
-- CREATE TABLE form (
--     id INTEGER PRIMARY KEY,
--     json_schema JSON NOT NULL,
-- );
-- 
CREATE TABLE poll_vote (
    pollId INTEGER NOT NULL REFERENCES poll(id),
    userId INTEGER NOT NULL REFERENCES users(id),
    formResponse JSON NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(pollId, userId)
)''');
    return result;
  }

  Future<SqlExecution> createTablePollOptionVote() async {
    final result = await executor.execute('''
-- 
CREATE TABLE poll_option_vote (
    pollOptionId INTEGER NOT NULL REFERENCES poll_option(id),
    userId INTEGER NOT NULL REFERENCES users(id),
    value INTEGER NOT NULL,
    formResponse JSON NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(pollOptionId, userId)
)''');
    return result;
  }

  Future<List<QuerySelectUser1>> querySelectUser1() async {
    final result = await executor.query('''
-- 
SELECT users.id,
    users.name user_name,
    po.id,
    poll.*
FROM user
    INNER JOIN poll ON poll.userId = users.id
    LEFT JOIN poll_option po ON po.pollId = poll.id
WHERE users.id = 1
    and poll.subtitle is not null''');
    return result.map(QuerySelectUser1.fromJson).toList();
  }

  Future<List<UserWithPosts>> userWithPosts() async {
    final result = await executor.query('''
-- {"name":"userWithPosts"}
SELECT users.id,
    users.name user_name,
    json_group_array(
        json_object(
            'id',
            poll.id,
            'userId',
            poll.userId,
            'title',
            poll.title,
            'subtitle',
            poll.subtitle,
            'body',
            poll.body,
            'createdAt',
            poll.createdAt,
            'options',
            json_array(po.id)
        )
    ) poll
FROM user
    INNER JOIN poll ON poll.userId = users.id
    LEFT JOIN poll_option po ON po.pollId = poll.id
WHERE poll.subtitle is not null
GROUP BY users.id''');
    return result.map(UserWithPosts.fromJson).toList();
  }

  Future<List<UserWithPostsJSON>> userWithPostsJSON() async {
    final result = await executor.query('''
-- {"name":"userWithPostsJSON"}
SELECT users.id,
    users.name userName,
    json_group_array(p.jsonValue) poll
FROM user
    INNER JOIN poll_with_options_json p ON p.userId = users.id
GROUP BY users.id''');
    return result.map(UserWithPostsJSON.fromJson).toList();
  }

  Future<SqlExecution> createViewPollWithOptionsJson() async {
    final result = await executor.execute('''
-- 
CREATE VIEW poll_with_options_json AS
SELECT poll.id,
    poll.userId,
    json_object(
        'id',
        poll.id,
        'userId',
        poll.userId,
        'title',
        poll.title,
        'subtitle',
        poll.subtitle,
        'body',
        poll.body,
        'createdAt',
        poll.createdAt,
        'options',
        json_group_array(po.id)
    ) jsonValue
FROM poll
    LEFT JOIN poll_option po ON po.pollId = poll.id
GROUP BY poll.id''');
    return result;
  }

  Future<List<DeleteUsers1>> deleteUsers1(DeleteUsers1Args args) async {
    final result = await executor.query('''
--
-- -- 
-- CREATE VIEW poll_with_options_json AS
-- SELECT id,
--     userId,
--     title,
--     subtitle,
--     body,
--     createdAt,
--     po.options
-- FROM poll
--     LEFT JOIN (SELECT json_group_array(
--             json_object(
--         'id', id,
--         'pollId', pollId,
--         'priority', priority,
--         'description', description,
--         'url', url,
--         'formJsonSchema', formJsonSchema,
--         'createdAt', createdAt,
--         'votes', pov.votes)
--     ) options,
--     pollId
--         from poll_option
--         LEFT JOIN (SELECT json_group_array(
--                 json_object('pollOptionId', pollOptionId,
--                             'userId', userId,
--                             'value', value,
--                             'formResponse', formResponse,
--                             'createdAt', createdAt)
--                         ) votes,
--                         pollOptionId
--             FROM poll_option_vote
--             GROUP BY pollOptionId
--         ) pov ON pov.pollOptionId = id
--         group by pollId
--     ) po ON po.pollId = poll.id;
--
DELETE FROM users WHERE (id = ?) RETURNING id,name''', [args.arg0]);
    return result.map(DeleteUsers1.fromJson).toList();
  }

  Future<void> defineDatabaseObjects() async {
    await createTableUsers();
    await createTablePoll();
    await createTablePollOption();
    await createTablePollVote();
    await createTablePollOptionVote();
    await createViewPollWithOptionsJson();
  }
/** SqliteException(1): while preparing statement, no such table: user, SQL logic error (code 1)
  Causing statement: 
-- {"name":"updateUserName"}
UPDATE user
SET name = :name
WHERE :id = id
RETURNING *

SqliteException(1): while preparing statement, no such table: user, SQL logic error (code 1)
  Causing statement: 
-- {"name":"deleteUsersById"}
DELETE FROM user
WHERE id IN (:ids)

SqliteException(1): while preparing statement, no such table: user, SQL logic error (code 1)
  Causing statement: 
-- 
SELECT users.id,
    users.name user_name,
    po.id,
    poll.*
FROM user
    INNER JOIN poll ON poll.userId = users.id
    LEFT JOIN poll_option po ON po.pollId = poll.id
WHERE users.id = 1
    and poll.subtitle is not null

SqliteException(1): while preparing statement, no such table: user, SQL logic error (code 1)
  Causing statement: 
-- {"name":"userWithPosts"}
SELECT users.id,
    users.name user_name,
    json_group_array(
        json_object(
            'id',
            poll.id,
            'userId',
            poll.userId,
            'title',
            poll.title,
            'subtitle',
            poll.subtitle,
            'body',
            poll.body,
            'createdAt',
            poll.createdAt,
            'options',
            json_array(po.id)
        )
    ) poll
FROM user
    INNER JOIN poll ON poll.userId = users.id
    LEFT JOIN poll_option po ON po.pollId = poll.id
WHERE poll.subtitle is not null
GROUP BY users.id

SqliteException(1): while preparing statement, no such table: user, SQL logic error (code 1)
  Causing statement: 
-- {"name":"userWithPostsJSON"}
SELECT users.id,
    users.name userName,
    json_group_array(p.jsonValue) poll
FROM user
    INNER JOIN poll_with_options_json p ON p.userId = users.id
GROUP BY users.id */
}
