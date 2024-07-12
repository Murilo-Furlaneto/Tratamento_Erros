import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tratamento_erros/pages/home_page.dart';
import 'package:tratamento_erros/services/post_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: ChangeNotifierProvider(
          create: (_) => PostNotifier(), child: const HomePage()),
    );
  }
}
