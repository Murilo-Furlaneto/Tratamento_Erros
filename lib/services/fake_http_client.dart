import 'dart:io';

class FakeHttpClient {
  Future<String> getResponseBody() async {
    await Future.delayed(const Duration(milliseconds: 500));

    //No Internet Connection
    //throw const SocketException('No internet');
    //404
    //throw const HttpException('404');
    // Invalid JSON (throws FormatException)
    // return 'abcd';
    throw const FileSystemException();
    return '{"userId": 1, "id": 1, "title": "nice title", "body": "teste body"}';
  }
}
