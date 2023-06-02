import 'dart:io';

Future<void> main() async {
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  final code =
      'import \'dart:io\';\n\nFuture<void> main() async {\n  final port = int.parse(Platform.environment[\'PORT\'] ?? \'8080\');\n  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);\n  final code =\n      !!!;\n\n  print(\'Serving at http://\${server.address.host}:\${server.port}\');\n\n  server.listen((request) {\n    request.response.headers.contentType = ContentType.text;\n    request.response.write(code.replaceFirst(\'!!!\', \'\'\' +\n            code\n                .replaceAll(\'\\\\\', \'\\\\\\\')\n                .replaceAll(\'\\\\\'\', \'\\\\\'\')\n                .replaceAll(\'\\\$\', \'\\\\\\\$\')\n                .replaceAll(\'\\\\n\', \'\\\\\\n\') +\n            \'\'\'));\n    request.response.close();\n  });\n}\n\n';

  print('Serving at http://${server.address.host}:${server.port}');

  server.listen((request) {
    request.response.headers.contentType = ContentType.text;
    request.response.write(code.replaceFirst('!!!', ''' +
            code
                .replaceAll('\\', '\\\')
                .replaceAll('\\'', '\\'')
                .replaceAll('\$', '\\\$')
                .replaceAll('\\n', '\\\n') +
            '''));
    request.response.close();
  });
}
