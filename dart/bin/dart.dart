import 'dart:io';

Future<void> main() async {
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  final code = """import 'dart:io';

Future<void> main() async {
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  final code =
      !!!

  print('Serving at http://\${server.address.host}:\${server.port}');

  server.listen((request) {
    request.response.headers.contentType = ContentType.text;
    request.response.write(code.replaceFirst(
        '!!!',
        '\\\'' +
            code
                .replaceAll('\\\\', '\\\\\\\\')
                .replaceAll('\\\'', '\\\\\\\'')
                .replaceAll('\\\$', '\\\\\\\$')
                .replaceAll('\\n', '\\\\n') +
            '\\\''));
    request.response.close();
  });
}
""";
  print('Serving at http://${server.address.host}:${server.port}');

  server.listen((request) {
    request.response.headers.contentType = ContentType.text;
    request.response.write(code.replaceFirst(
        '!!!',
        '\'' +
            code
                .replaceAll('\\', '\\\\')
                .replaceAll('\\\'', '\\\'')
                .replaceAll('\$', '\\\$')
                .replaceAll('\n', '\\n') +
            '\''));
    request.response.close();
  });
}
