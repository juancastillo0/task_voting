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
    final registerUserResponse = await c
        .requestNoCache(GregisterUserReq((u) => u.vars..name = 'username1'));
    final registerUser = registerUserResponse.data?.registerUser;

    if (registerUser == null) {
      throw (registerUserResponse.linkException ??
          registerUserResponse.graphqlErrors)!;
    }

    final insertPollsResponse = await c.requestNoCache(GinsertPollReq(
      (u) => u
        ..vars.insert = (GPollInsertBuilder()
          ..userId = 1
          ..title = 'fefs'
          ..body = 'fefs'
          ..options.addAll([
            GPollOptionInsert((u) => u..description = 'option 1'),
          ])),
    ));
    final insertPoll = insertPollsResponse.data?.insertPoll;
    if (insertPoll == null) {
      throw (insertPollsResponse.linkException ??
          insertPollsResponse.graphqlErrors)!;
    }

    final getPollsResponse =
        await c.requestNoCache(GgetPollsReq((u) => u..vars));
    final getPolls = getPollsResponse.data?.getPolls;
    if (getPolls == null) {
      throw (getPollsResponse.linkException ?? getPollsResponse.graphqlErrors)!;
    }

    final pollId = insertPoll.id;
    expect(pollId, getPolls.first.id);
    expect(getPolls, hasLength(1));
    expect(insertPoll.options, hasLength(1));
    expect(getPolls.first.options, hasLength(1));
    expect(insertPoll.options.first.description, 'option 1');

    final addPollOptionsResponse =
        await c.requestNoCache(GaddPollOptionsReq((u) => u.vars
          ..pollId = pollId
          ..options.addAll([
            GPollOptionInsert((u) => u
              ..priority = 4
              ..description = 'option 2'),
            GPollOptionInsert((u) => u
              ..priority = 2
              ..description = 'option 3'),
          ])));
    final addPollOptions = addPollOptionsResponse.data?.addPollOptions;
    if (addPollOptions == null) {
      throw (addPollOptionsResponse.linkException ??
          addPollOptionsResponse.graphqlErrors)!;
    }
    final options = addPollOptions.options;
    expect(options, hasLength(3));
    expect(
      options.map((p) => p.description),
      ['option 1', 'option 2', 'option 3'],
    );
    expect(
      options.map((p) => p.pollId).toSet(),
      {pollId},
    );
    expect(
      options.expand((p) => p.votes.map((v) => v.userId)).toSet(),
      <String>{},
    );

    final votePollResponse = await c.requestNoCache(GvotePollReq(
      (u) => u.vars
        ..pollId = pollId
        ..votes.addAll([
          GPollOptionVoteInsert(
            (u) => u
              ..userId = registerUser.id
              ..pollOptionId = options[0].id
              ..value = 7,
          ),
          GPollOptionVoteInsert(
            (u) => u
              ..userId = registerUser.id
              ..pollOptionId = options[1].id
              ..value = 3,
          ),
        ]),
    ));
    final votePoll = votePollResponse.data?.votePoll;
    if (votePoll == null) {
      throw (votePollResponse.linkException ?? votePollResponse.graphqlErrors)!;
    }
    expect(votePoll.err, isNull);
    expect(votePoll.ok, 2);

    final getPolls2Response =
        await c.requestNoCache(GgetPollsReq((u) => u..vars));
    final getPolls2 = getPolls2Response.data?.getPolls;
    if (getPolls2 == null) {
      throw (getPolls2Response.linkException ??
          getPolls2Response.graphqlErrors)!;
    }

    expect(getPolls2, hasLength(1));
    expect(
      getPolls2.first.options
          .expand((p) => p.votes.map((v) => v.userId))
          .toSet(),
      {registerUser.id},
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
