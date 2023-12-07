import 'dart:io';

import 'package:backend_server/graphql_api.schema.dart';

void main() {
  final schema = recreateGraphQLApiSchema();
  File(Platform.script
          .resolve('../../api_client/lib/schema.graphql')
          .toFilePath())
      .writeAsStringSync(schema.schemaStr);
}
