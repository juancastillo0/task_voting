import 'dart:convert';

import 'package:typesql/sqlite.dart';
import 'package:typesql/typesql.dart';

import 'table_queries.sql.dart';

Future<void> main() async {
  return testDatabase();
}

void _defaultExpect(Object? a, Object? b) {
  if (a != b) throw Exception('$a != $b');
}

Future<SqliteExecutor> inMemoryExecutor() async {
  final sqlite = await loadSqlite();
  final db = sqlite.openInMemory();
  final executor = SqliteExecutor(db);
  return executor;
}

Future<void> testDatabase({
  void Function(Object? a, Object? b) expect = _defaultExpect,
}) async {
  final sqlite = await loadSqlite();
  final db = sqlite.openInMemory();
  final executor = SqliteExecutor(db);
  final queries = TableQueriesQueries(executor);

  await queries.defineDatabaseObjects();
  // await example.createTableUsers();
  final execution = await queries.insertUsers1(InsertUsers1Args(c: 'name'));
  expect(execution.updaterRows, 2);
  expect(execution.lastInsertId, '2');

  final users = await queries.querySelectUsers1();
  expect(users.length, 2);
  expect(
    users[0],
    QuerySelectUsers1(
      usersId: 1,
      usersName: 'name1',
      usersRefreshToken: '',
    ),
  );
  expect(
    users[1],
    QuerySelectUsers1(
      usersId: 2,
      usersName: 'name',
      usersRefreshToken: '',
    ),
  );

  {
    final toInsert = [
      UsersInsert(id: 3, name: 'name3', refreshToken: ''),
      UsersInsert(id: 4, name: 'name4', refreshToken: ''),
    ];
    final usersQueries = queries.usersController;
    final inserted = await usersQueries.insertManyReturning(toInsert);
    expect(jsonEncode(toInsert), jsonEncode(inserted));

    final deleted = await usersQueries.deleteManyReturning([UsersKeyId(id: 3)]);
    expect(jsonEncode([toInsert.first]), jsonEncode(deleted));

    final updated3 = await usersQueries.updateReturning(
      UsersKeyId(id: 3),
      UsersUpdate(name: Some('nameUpdated3')),
    );
    expect(updated3, null);

    final updated4 = await usersQueries.updateReturning(
      UsersKeyId(id: 4),
      UsersUpdate(name: Some('nameUpdated4')),
    );
    expect(updated4, Users(id: 4, name: 'nameUpdated4', refreshToken: ''));

    final selected4 = await usersQueries.selectUnique(UsersKeyId(id: 4));
    expect(selected4, updated4);
  }

  {
    final toInsert = [
      PollInsert(id: 3, userId: 4, title: 'title', body: 'body'),
      PollInsert(
        id: 4,
        userId: 4,
        title: 'title4',
        body: 'body4',
        subtitle: 'subtitle4',
        createdAt: DateTime(2024),
      ),
    ];
    final pollQueries = queries.pollController;
    final inserted = await pollQueries.insertManyReturning(toInsert);
    expect(
      jsonEncode([
        PollInsert(
          id: 3,
          userId: 4,
          title: 'title',
          body: 'body',
          createdAt: inserted.first.createdAt,
        ),
        toInsert.last,
      ]),
      jsonEncode(inserted),
    );

    final deleted = await pollQueries.deleteManyReturning([PollKeyId(id: 3)]);
    expect(jsonEncode([inserted.first]), jsonEncode(deleted));

    final updated3 = await pollQueries.updateReturning(
      PollKeyId(id: 3),
      PollUpdate(subtitle: Some('subtitleUpdated')),
    );
    expect(updated3, null);

    final updated4 = await pollQueries.updateReturning(
      PollKeyId(id: 4),
      PollUpdate(subtitle: Some('subtitleUpdated')),
    );
    expect(
      updated4,
      Poll(
        id: 4,
        userId: 4,
        title: 'title4',
        body: 'body4',
        subtitle: 'subtitleUpdated',
        createdAt: DateTime(2024),
      ),
    );

    final selected4 = await pollQueries.selectUnique(PollKeyId(id: 4));
    expect(selected4, updated4);
  }

  // final values =
  //     await example.typedExecutor.selectMany(FilterEq(UsersUpdate()));

  // final d = await example.typedExecutor.selectUnique(UsersKeyId(id: 3));
}

class SqliteExecutor extends SqlExecutor {
  final CommonDatabase db;

  SqliteExecutor(this.db);

  @override
  SqlDialect get dialect => SqlDialect.sqlite;

  @override
  Future<T?> transaction<T>(Future<T> Function() transact) async {
    bool started = false;
    try {
      db.execute('BEGIN TRANSACTION');
      started = true;
      final result = await transact();
      db.execute('COMMIT');
      return result;
    } catch (e) {
      if (started) {
        try {
          db.execute('ROLLBACK');
        } catch (_) {}
      }
      return null;
    }
  }

  @override
  Future<SqlExecution> execute(String sql, [List<Object?>? params]) async {
    db.execute(sql, params ?? const []);
    return SqlExecution(
      lastInsertId: db.lastInsertRowId.toString(),
      updaterRows: db.updatedRows,
    );
  }

  @override
  Future<List<List<Object?>>> query(String sql, [List<Object?>? params]) {
    final rows = db.select(sql, params ?? const []);
    return Future.value(rows.rows);
  }

  @override
  Future<SqlPreparedStatement> prepare(String sql) async {
    final statement = db.prepare(sql, persistent: true);
    return SqlPreparedStatement.value(
      sql,
      statement.parameterCount,
      dispose: statement.dispose,
      execute: ([p]) async {
        statement.execute(p ?? const []);
        return SqlExecution(
          lastInsertId: db.lastInsertRowId.toString(),
          updaterRows: db.updatedRows,
        );
      },
      select: ([p]) async {
        return statement.select(p ?? const []).rows;
      },
    );
  }
}
