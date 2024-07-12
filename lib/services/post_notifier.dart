import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tratamento_erros/model/post_model.dart';
import 'package:tratamento_erros/services/post_service.dart';
import 'package:tratamento_erros/utils/failure.dart';

enum NotifierState { initial, loading, loaded }

class PostNotifier extends ChangeNotifier {
  final _postService = PostService();

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;

  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  /*
  PostModel? _post;
  PostModel get post => _post!;

  void _setPost(PostModel post) {
    _post = post;
    notifyListeners();
  } */

  Either<Failure, PostModel>? _post;
  Either<Failure, PostModel> get post => _post!;

  void _setPost(Either<Failure, PostModel> post) {
    _post = post;
    notifyListeners();
  }

/*
  Failure _failure = Failure('');
  Failure get failure => _failure;

  void setFailure(Failure failure) {
    _failure = failure;
  } */

  // quando chamar a função, o setState passa para carregando
  // e quando ele setar o valor, muda o status para carregado
  /*
  void getOnePost() async {
    _setState(NotifierState.loading);
    try {
      final post = await _postService.getOnePost();
      _setPost(post);
    } on Failure catch (f) {
      setFailure(f);
    }
    _setState(NotifierState.loaded);
  }
*/
  void getOnePost() async {
    _setState(NotifierState.loading);
    await Task(() => _postService.getOnePost())
        .attempt()
        .map((either) => either.leftMap((obj) {
              try {
                return obj as Failure;
              } catch (e) {
                throw obj;
              }
            }))
        .run()
        .then((value) => _setPost(value));

    _setState(NotifierState.loaded);
  }
}
