import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tratamento_erros/model/post_model.dart';
import 'package:tratamento_erros/services/post_notifier.dart';
import 'package:tratamento_erros/services/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Handling'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<PostNotifier>(builder: (_, notifier, __) {
              if (notifier.state == NotifierState.initial) {
                return const Text(
                  'Clique no botão',
                  style: TextStyle(fontSize: 17),
                );
              } else if (notifier.state == NotifierState.loading) {
                return const CircularProgressIndicator();
              } else { // LEFT é o tratamento em caso de erro
                return notifier.post.fold((failure) => Text(failure.toString()),
                    (post) => Text(post.toString()));
                    // RIGHT é o tratamento caso de certo.
              }
            }),
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<PostNotifier>(context).getOnePost();
                  },
                  child: const Text(
                    'Post',
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
