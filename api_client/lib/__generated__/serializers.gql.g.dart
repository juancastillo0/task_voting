// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GDate.serializer)
      ..add(GFullPollData.serializer)
      ..add(GFullPollData_options.serializer)
      ..add(GFullPollData_options_votes.serializer)
      ..add(GFullPollOptionData.serializer)
      ..add(GFullPollOptionData_votes.serializer)
      ..add(GFullPollOptionReq.serializer)
      ..add(GFullPollOptionVars.serializer)
      ..add(GFullPollOptionVoteData.serializer)
      ..add(GFullPollOptionVoteReq.serializer)
      ..add(GFullPollOptionVoteVars.serializer)
      ..add(GFullPollReq.serializer)
      ..add(GFullPollUserData.serializer)
      ..add(GFullPollUserData_poll.serializer)
      ..add(GFullPollUserData_poll_options.serializer)
      ..add(GFullPollUserData_poll_options_votes.serializer)
      ..add(GFullPollUserData_userVotes.serializer)
      ..add(GFullPollUserData_userVotes_option.serializer)
      ..add(GFullPollUserData_userVotes_option_votes.serializer)
      ..add(GFullPollUserData_userVotes_vote.serializer)
      ..add(GFullPollUserReq.serializer)
      ..add(GFullPollUserVars.serializer)
      ..add(GFullPollUserVoteData.serializer)
      ..add(GFullPollUserVoteData_option.serializer)
      ..add(GFullPollUserVoteData_option_votes.serializer)
      ..add(GFullPollUserVoteData_vote.serializer)
      ..add(GFullPollUserVoteReq.serializer)
      ..add(GFullPollUserVoteVars.serializer)
      ..add(GFullPollVars.serializer)
      ..add(GFullUserData.serializer)
      ..add(GFullUserData_polls.serializer)
      ..add(GFullUserData_pollsWithVotes.serializer)
      ..add(GFullUserData_pollsWithVotes_poll.serializer)
      ..add(GFullUserData_pollsWithVotes_poll_options.serializer)
      ..add(GFullUserData_pollsWithVotes_poll_options_votes.serializer)
      ..add(GFullUserData_pollsWithVotes_userVotes.serializer)
      ..add(GFullUserData_pollsWithVotes_userVotes_option.serializer)
      ..add(GFullUserData_pollsWithVotes_userVotes_option_votes.serializer)
      ..add(GFullUserData_pollsWithVotes_userVotes_vote.serializer)
      ..add(GFullUserData_polls_options.serializer)
      ..add(GFullUserData_polls_options_votes.serializer)
      ..add(GFullUserReq.serializer)
      ..add(GFullUserVars.serializer)
      ..add(GPollInsert.serializer)
      ..add(GPollOptionInsert.serializer)
      ..add(GPollOptionVoteInsert.serializer)
      ..add(GaddPollOptionsData.serializer)
      ..add(GaddPollOptionsData_addPollOptions.serializer)
      ..add(GaddPollOptionsData_addPollOptions_options.serializer)
      ..add(GaddPollOptionsData_addPollOptions_options_votes.serializer)
      ..add(GaddPollOptionsReq.serializer)
      ..add(GaddPollOptionsVars.serializer)
      ..add(GgetPollsData.serializer)
      ..add(GgetPollsData_getPolls.serializer)
      ..add(GgetPollsData_getPolls_options.serializer)
      ..add(GgetPollsData_getPolls_options_votes.serializer)
      ..add(GgetPollsReq.serializer)
      ..add(GgetPollsVars.serializer)
      ..add(GgetUserData.serializer)
      ..add(GgetUserData_getUser.serializer)
      ..add(GgetUserData_getUser_polls.serializer)
      ..add(GgetUserData_getUser_pollsWithVotes.serializer)
      ..add(GgetUserData_getUser_pollsWithVotes_poll.serializer)
      ..add(GgetUserData_getUser_pollsWithVotes_poll_options.serializer)
      ..add(GgetUserData_getUser_pollsWithVotes_poll_options_votes.serializer)
      ..add(GgetUserData_getUser_pollsWithVotes_userVotes.serializer)
      ..add(GgetUserData_getUser_pollsWithVotes_userVotes_option.serializer)
      ..add(
          GgetUserData_getUser_pollsWithVotes_userVotes_option_votes.serializer)
      ..add(GgetUserData_getUser_pollsWithVotes_userVotes_vote.serializer)
      ..add(GgetUserData_getUser_polls_options.serializer)
      ..add(GgetUserData_getUser_polls_options_votes.serializer)
      ..add(GgetUserReq.serializer)
      ..add(GgetUserVars.serializer)
      ..add(GinsertPollData.serializer)
      ..add(GinsertPollData_insertPoll.serializer)
      ..add(GinsertPollData_insertPoll_options.serializer)
      ..add(GinsertPollData_insertPoll_options_votes.serializer)
      ..add(GinsertPollReq.serializer)
      ..add(GinsertPollVars.serializer)
      ..add(GregisterUserData.serializer)
      ..add(GregisterUserData_registerUser.serializer)
      ..add(GregisterUserData_registerUser_polls.serializer)
      ..add(GregisterUserData_registerUser_pollsWithVotes.serializer)
      ..add(GregisterUserData_registerUser_pollsWithVotes_poll.serializer)
      ..add(
          GregisterUserData_registerUser_pollsWithVotes_poll_options.serializer)
      ..add(GregisterUserData_registerUser_pollsWithVotes_poll_options_votes
          .serializer)
      ..add(GregisterUserData_registerUser_pollsWithVotes_userVotes.serializer)
      ..add(GregisterUserData_registerUser_pollsWithVotes_userVotes_option
          .serializer)
      ..add(GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes
          .serializer)
      ..add(GregisterUserData_registerUser_pollsWithVotes_userVotes_vote
          .serializer)
      ..add(GregisterUserData_registerUser_polls_options.serializer)
      ..add(GregisterUserData_registerUser_polls_options_votes.serializer)
      ..add(GregisterUserReq.serializer)
      ..add(GregisterUserVars.serializer)
      ..add(GvotePollData.serializer)
      ..add(GvotePollData_votePoll.serializer)
      ..add(GvotePollReq.serializer)
      ..add(GvotePollVars.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFullPollData_options)]),
          () => new ListBuilder<GFullPollData_options>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFullPollData_options_votes)]),
          () => new ListBuilder<GFullPollData_options_votes>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFullPollOptionData_votes)]),
          () => new ListBuilder<GFullPollOptionData_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFullPollUserData_poll_options)]),
          () => new ListBuilder<GFullPollUserData_poll_options>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFullPollUserData_poll_options_votes)]),
          () => new ListBuilder<GFullPollUserData_poll_options_votes>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFullPollUserData_userVotes)]),
          () => new ListBuilder<GFullPollUserData_userVotes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFullPollUserData_userVotes_option_votes)]),
          () => new ListBuilder<GFullPollUserData_userVotes_option_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFullPollUserVoteData_option_votes)]),
          () => new ListBuilder<GFullPollUserVoteData_option_votes>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFullUserData_polls)]),
          () => new ListBuilder<GFullUserData_polls>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFullUserData_pollsWithVotes)]),
          () => new ListBuilder<GFullUserData_pollsWithVotes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GFullUserData_pollsWithVotes_poll_options)
          ]),
          () => new ListBuilder<GFullUserData_pollsWithVotes_poll_options>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GFullUserData_pollsWithVotes_poll_options_votes)
          ]),
          () => new ListBuilder<
              GFullUserData_pollsWithVotes_poll_options_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFullUserData_pollsWithVotes_userVotes)]),
          () => new ListBuilder<GFullUserData_pollsWithVotes_userVotes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GFullUserData_pollsWithVotes_userVotes_option_votes)
          ]),
          () => new ListBuilder<
              GFullUserData_pollsWithVotes_userVotes_option_votes>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFullUserData_polls_options)]),
          () => new ListBuilder<GFullUserData_polls_options>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFullUserData_polls_options_votes)]),
          () => new ListBuilder<GFullUserData_polls_options_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GPollOptionInsert)]),
          () => new ListBuilder<GPollOptionInsert>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GPollOptionInsert)]),
          () => new ListBuilder<GPollOptionInsert>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GPollOptionVoteInsert)]),
          () => new ListBuilder<GPollOptionVoteInsert>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GaddPollOptionsData_addPollOptions_options)
          ]),
          () => new ListBuilder<GaddPollOptionsData_addPollOptions_options>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GaddPollOptionsData_addPollOptions_options_votes)
          ]),
          () => new ListBuilder<
              GaddPollOptionsData_addPollOptions_options_votes>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GgetPollsData_getPolls)]),
          () => new ListBuilder<GgetPollsData_getPolls>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GgetPollsData_getPolls_options)]),
          () => new ListBuilder<GgetPollsData_getPolls_options>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GgetPollsData_getPolls_options_votes)]),
          () => new ListBuilder<GgetPollsData_getPolls_options_votes>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GgetUserData_getUser_polls)]),
          () => new ListBuilder<GgetUserData_getUser_polls>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GgetUserData_getUser_pollsWithVotes)]),
          () => new ListBuilder<GgetUserData_getUser_pollsWithVotes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GgetUserData_getUser_pollsWithVotes_poll_options)
          ]),
          () => new ListBuilder<
              GgetUserData_getUser_pollsWithVotes_poll_options>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                GgetUserData_getUser_pollsWithVotes_poll_options_votes)
          ]),
          () => new ListBuilder<
              GgetUserData_getUser_pollsWithVotes_poll_options_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GgetUserData_getUser_pollsWithVotes_userVotes)
          ]),
          () =>
              new ListBuilder<GgetUserData_getUser_pollsWithVotes_userVotes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                GgetUserData_getUser_pollsWithVotes_userVotes_option_votes)
          ]),
          () => new ListBuilder<
              GgetUserData_getUser_pollsWithVotes_userVotes_option_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GgetUserData_getUser_polls_options)]),
          () => new ListBuilder<GgetUserData_getUser_polls_options>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GgetUserData_getUser_polls_options_votes)]),
          () => new ListBuilder<GgetUserData_getUser_polls_options_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GinsertPollData_insertPoll_options)]),
          () => new ListBuilder<GinsertPollData_insertPoll_options>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GinsertPollData_insertPoll_options_votes)]),
          () => new ListBuilder<GinsertPollData_insertPoll_options_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GregisterUserData_registerUser_polls)]),
          () => new ListBuilder<GregisterUserData_registerUser_polls>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GregisterUserData_registerUser_pollsWithVotes)
          ]),
          () =>
              new ListBuilder<GregisterUserData_registerUser_pollsWithVotes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                GregisterUserData_registerUser_pollsWithVotes_poll_options)
          ]),
          () => new ListBuilder<
              GregisterUserData_registerUser_pollsWithVotes_poll_options>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                GregisterUserData_registerUser_pollsWithVotes_poll_options_votes)
          ]),
          () => new ListBuilder<
              GregisterUserData_registerUser_pollsWithVotes_poll_options_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                GregisterUserData_registerUser_pollsWithVotes_userVotes)
          ]),
          () => new ListBuilder<
              GregisterUserData_registerUser_pollsWithVotes_userVotes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes)
          ]),
          () => new ListBuilder<
              GregisterUserData_registerUser_pollsWithVotes_userVotes_option_votes>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GregisterUserData_registerUser_polls_options)
          ]),
          () => new ListBuilder<GregisterUserData_registerUser_polls_options>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GregisterUserData_registerUser_polls_options_votes)
          ]),
          () => new ListBuilder<
              GregisterUserData_registerUser_polls_options_votes>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
