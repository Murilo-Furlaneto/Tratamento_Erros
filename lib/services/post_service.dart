import 'dart:io';

import 'package:tratamento_erros/model/post_model.dart';
import 'package:tratamento_erros/utils/failure.dart';

import 'fake_http_client.dart';

class PostService {
  final httpClient = FakeHttpClient();

  Future<PostModel> getOnePost() async {
    try {
      final responseBody = await httpClient.getResponseBody();
      return PostModel.fromJson(responseBody);
    } on SocketException {
      throw Failure('Sem conexão com a internet');
    } on HttpException {
      throw Failure('Post não encontrado');
    } on FormatException {
      throw Failure('Formato de requisição incorreto');
    }
  }
}
