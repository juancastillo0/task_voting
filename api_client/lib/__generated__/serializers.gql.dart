// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:api_client/__generated__/schema.schema.gql.dart'
    show GDate, GPollInsert, GPollOptionInsert, GPollOptionVoteInsert;
import 'package:api_client/api/__generated__/poll.data.gql.dart'
    show
        GFullPollData,
        GFullPollData_options,
        GFullPollData_options_votes,
        GFullPollOptionData,
        GFullPollOptionData_votes,
        GFullPollOptionVoteData,
        GFullUserData,
        GaddPollOptionsData,
        GaddPollOptionsData_addPollOptions,
        GaddPollOptionsData_addPollOptions_options,
        GaddPollOptionsData_addPollOptions_options_votes,
        GgetPollsData,
        GgetPollsData_getPolls,
        GgetPollsData_getPolls_options,
        GgetPollsData_getPolls_options_votes,
        GinsertPollData,
        GinsertPollData_insertPoll,
        GinsertPollData_insertPoll_options,
        GinsertPollData_insertPoll_options_votes,
        GregisterUserData,
        GregisterUserData_registerUser,
        GvotePollData,
        GvotePollData_votePoll;
import 'package:api_client/api/__generated__/poll.req.gql.dart'
    show
        GFullPollOptionReq,
        GFullPollOptionVoteReq,
        GFullPollReq,
        GFullUserReq,
        GaddPollOptionsReq,
        GgetPollsReq,
        GinsertPollReq,
        GregisterUserReq,
        GvotePollReq;
import 'package:api_client/api/__generated__/poll.var.gql.dart'
    show
        GFullPollOptionVars,
        GFullPollOptionVoteVars,
        GFullPollVars,
        GFullUserVars,
        GaddPollOptionsVars,
        GgetPollsVars,
        GinsertPollVars,
        GregisterUserVars,
        GvotePollVars;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GDate,
  GFullPollData,
  GFullPollData_options,
  GFullPollData_options_votes,
  GFullPollOptionData,
  GFullPollOptionData_votes,
  GFullPollOptionReq,
  GFullPollOptionVars,
  GFullPollOptionVoteData,
  GFullPollOptionVoteReq,
  GFullPollOptionVoteVars,
  GFullPollReq,
  GFullPollVars,
  GFullUserData,
  GFullUserReq,
  GFullUserVars,
  GPollInsert,
  GPollOptionInsert,
  GPollOptionVoteInsert,
  GaddPollOptionsData,
  GaddPollOptionsData_addPollOptions,
  GaddPollOptionsData_addPollOptions_options,
  GaddPollOptionsData_addPollOptions_options_votes,
  GaddPollOptionsReq,
  GaddPollOptionsVars,
  GgetPollsData,
  GgetPollsData_getPolls,
  GgetPollsData_getPolls_options,
  GgetPollsData_getPolls_options_votes,
  GgetPollsReq,
  GgetPollsVars,
  GinsertPollData,
  GinsertPollData_insertPoll,
  GinsertPollData_insertPoll_options,
  GinsertPollData_insertPoll_options_votes,
  GinsertPollReq,
  GinsertPollVars,
  GregisterUserData,
  GregisterUserData_registerUser,
  GregisterUserReq,
  GregisterUserVars,
  GvotePollData,
  GvotePollData_votePoll,
  GvotePollReq,
  GvotePollVars,
])
final Serializers serializers = _serializersBuilder.build();
