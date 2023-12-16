import 'dart:async';

import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:http/http.dart' as http;
import 'package:api_client/__generated__/schema.schema.gql.dart'
    show possibleTypesMap;

typedef ApiClient = Client;

ApiClient makeClient({
  String? url,
  FutureOr<String?> Function()? getAuthHeader,
}) {
  final link = HttpLink(
    url ?? 'http://localhost:8050/graphql',
    httpClient: _HttpClient(getAuthHeader: getAuthHeader),
  );
  final cache = Cache(possibleTypes: possibleTypesMap);
  final apiClient = Client(
    link: link,
    cache: cache,
    defaultFetchPolicies: {
      OperationType.query: FetchPolicy.CacheAndNetwork,
      OperationType.mutation: FetchPolicy.NetworkOnly,
      OperationType.subscription: FetchPolicy.CacheAndNetwork,
    },
  );
  return apiClient;
}

extension ApiClientFuture on ApiClient {
  Future<OperationResponse<TData, TVars>> requestNoCache<TData, TVars>(
    OperationRequest<TData, TVars> r,
  ) =>
      request(r).firstWhere((e) => e.dataSource != DataSource.Cache);

  Future<TData> requestNoCacheThrow<TData, TVars>(
    OperationRequest<TData, TVars> r,
  ) async {
    final response = await requestNoCache(r);
    final data = response.data;
    if (response.hasErrors || data == null) {
      throw (response.linkException ?? response.graphqlErrors)!;
    }
    return data;
  }
}

class _HttpClient extends http.BaseClient {
  final FutureOr<String?> Function()? getAuthHeader;

  _HttpClient({required this.getAuthHeader});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (getAuthHeader != null) {
      final h = await getAuthHeader!();
      if (h != null) request.headers['authorization'] = h;
    }
    return request.send();
  }
}
