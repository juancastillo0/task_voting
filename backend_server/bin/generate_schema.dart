import 'dart:io';

import 'package:backend_server/graphql_api.schema.dart';

void main(List<String> args) async {
  generateSchema();
  if (!args.contains('--watch')) {
    return;
  }
  var previousChange = DateTime.now();
  final watchDir = Directory(Platform.script.resolve('../lib').toFilePath());
  watchDir.watch(recursive: true).listen((_) async {
    previousChange = DateTime.now();
    final p = previousChange;
    await Future.delayed(const Duration(seconds: 3));
    if (p != previousChange) return;

    generateSchemaCLI();
  });

  startBuildRunner(Platform.script.resolve('..').toFilePath());
  startBuildRunner(Platform.script.resolve('../../api_client').toFilePath());
}

void generateSchema() {
  final schema = recreateGraphQLApiSchema();
  File(Platform.script
          .resolve('../../api_client/lib/schema.graphql')
          .toFilePath())
      .writeAsStringSync(schema.schemaStr);
  print('generated schema');
}

void generateSchemaCLI() async {
  final p = await Process.start(
    'fvm',
    'dart run bin/generate_schema.dart'.split(' '),
    workingDirectory: Platform.script.resolve('..').toFilePath(),
    mode: ProcessStartMode.inheritStdio,
  );
  await p.exitCode;
}

void startBuildRunner(String workingDirectory) async {
  final dir = workingDirectory.split(RegExp(r'[/\\]')).last;
  while (true) {
    final p = await Process.start(
      'fvm',
      'dart pub run build_runner watch --delete-conflicting-outputs'.split(' '),
      workingDirectory: workingDirectory,
      mode: ProcessStartMode.inheritStdio,
    );
    await p.exitCode;
    print('build_runner "$dir" exited, restarting in 15 seconds');
    await Future.delayed(const Duration(seconds: 15));
  }
}
