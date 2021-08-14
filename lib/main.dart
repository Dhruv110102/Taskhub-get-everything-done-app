import 'package:flutter/material.dart';

import 'package:todo_flutter/src/screens/todo_list.dart';

void main() => runApp(MyApp());

// TODO:
// - local cache of todos + user info
// - backend setup for cloud sync 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: screen routes
    return MaterialApp(
      title: 'Todo',
      home: Scaffold(
        body: TodoListScreen(),
      ),
    );
  }
}


