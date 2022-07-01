/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/controllers/todo_provider.dart';
import 'package:provider_example/views/screens/crud/list.dart';

void main() {
  runApp(
    // TODO: add providers above your app
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodoProvider()),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Development Provider Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}
