import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:api_client/__generated__/schema.schema.gql.dart'
    show possibleTypesMap;

typedef ApiClient = Client;

ApiClient makeClient([String? url]) {
  final link = HttpLink(url ?? 'http://localhost:8050/graphql');
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
}
