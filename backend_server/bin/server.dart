import 'package:backend_server/server.dart';

Future<void> main() async {
  final server = await runServer();
  final url = Uri.parse('http://${server.address.host}:${server.port}/graphql');
  await testServer(url);
}
