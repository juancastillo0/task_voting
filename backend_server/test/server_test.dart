import 'dart:io';

import 'package:api_client/__generated__/schema.schema.gql.dart';
import 'package:api_client/api/__generated__/poll.req.gql.dart';
import 'package:api_client/api_client.dart';
import 'package:backend_server/server.dart';
import 'package:test/test.dart';

void main() {
  late HttpServer p;
  late ApiClient c;

  setUp(() async {
    p = await runServer();
    c = makeClient('http://${p.address.host}:${p.port}/graphql');
  });

  tearDown(() => p.close());

  test('insert poll', () async {
    final insertPollsResponse = await c
        .request(GinsertPollReq(
          (u) => u
            ..vars.insert = (GPollInsertBuilder()
              ..userId = 1
              ..title = 'fefs'
              ..body = 'fefs'
              ..options.addAll([
                GPollOptionInsert((u) => u..description = 'option 1'),
              ])),
        ))
        .first;
    final insertPoll = insertPollsResponse.data?.insertPoll;
    // "SqliteException(1299): while selecting from statement, NOT NULL constraint failed: poll.createdAt, constraint failed (code 1299)…"
    if (insertPoll == null) {
      throw (insertPollsResponse.linkException ??
          insertPollsResponse.graphqlErrors)!;
    }

    final getPollsResponse =
        await c.request(GgetPollsReq((u) => u..vars)).first;
    final getPolls = getPollsResponse.data?.getPolls;
    if (getPolls == null) {
      throw (getPollsResponse.linkException ?? getPollsResponse.graphqlErrors)!;
    }

    final pollId = insertPoll.id;
    expect(pollId, getPolls.first.id);
    expect(getPolls, hasLength(1));
    expect(insertPoll.options, hasLength(1));
    expect(insertPoll.options.first.description, 'option 1');

    final addPollOptionsResponse = await c
        .request(GaddPollOptionsReq((u) => u.vars
          ..pollId = pollId
          ..options.addAll([
            GPollOptionInsert((u) => u
              ..priority = 4
              ..description = 'option 2'),
            GPollOptionInsert((u) => u
              ..priority = 2
              ..description = 'option 3'),
          ])))
        .first;
    final addPollOptions = addPollOptionsResponse.data?.addPollOptions;
    if (addPollOptions == null) {
      throw (addPollOptionsResponse.linkException ??
          addPollOptionsResponse.graphqlErrors)!;
    }

    expect(addPollOptions.options, hasLength(3));
    expect(
      addPollOptions.options.map((p) => p.description),
      ['option 1', 'option 2', 'option 3'],
    );
    expect(
      addPollOptions.options.map((p) => p.pollId).toSet(),
      {pollId},
    );
    expect(
      addPollOptions.options
          .expand((p) => p.votes.map((v) => v.userId))
          .toSet(),
      {},
    );

    final votePollResponse = await c
        .request(GvotePollReq(
          (u) => u.vars
            ..pollId = pollId
            ..votes.addAll([
              GPollOptionVoteInsert(
                (u) => u
                  ..userId = 1
                  ..pollOptionId = 1
                  ..value = 7,
              ),
              GPollOptionVoteInsert(
                (u) => u
                  ..userId = 2
                  ..pollOptionId = 2
                  ..value = 3,
              ),
            ]),
        ))
        .first;
    final votePoll = votePollResponse.data?.votePoll;
    if (votePoll == null) {
      throw (votePollResponse.linkException ?? votePollResponse.graphqlErrors)!;
    }

    final getPolls2Response =
        await c.request(GgetPollsReq((u) => u..vars)).first;
    final getPolls2 = getPollsResponse.data?.getPolls;
    if (getPolls2 == null) {
      throw (getPolls2Response.linkException ??
          getPolls2Response.graphqlErrors)!;
    }

    expect(getPolls2, hasLength(1));
    expect(
      getPolls2.first.options
          .expand((p) => p.votes.map((v) => v.userId))
          .toSet(),
      {1, 2},
    );
  });

  // test('Root', () async {
  //   final response = await get(Uri.parse('$host/'));
  //   expect(response.statusCode, 200);
  //   expect(response.body, 'Hello, World!\n');
  // });

  // test('Echo', () async {
  //   final response = await get(Uri.parse('$host/echo/hello'));
  //   expect(response.statusCode, 200);
  //   expect(response.body, 'hello\n');
  // });

  // test('404', () async {
  //   final response = await get(Uri.parse('$host/foobar'));
  //   expect(response.statusCode, 404);
  // });
}
