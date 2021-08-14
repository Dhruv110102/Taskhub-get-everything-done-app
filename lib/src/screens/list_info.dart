import 'package:flutter/material.dart';

import 'package:todo_flutter/src/bloc/todo_list_bloc.dart';
import 'package:todo_flutter/src/widgets.dart';


class ListInfoScreen extends StatelessWidget {
  final TodoListBloc todoListBloc;

  ListInfoScreen({
    this.todoListBloc
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: 'listInfo',
            child: Card(
              elevation: 0.0,
              child: TodoListSummary(todoListBloc: todoListBloc,),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go back"),
          )

            
        ],
      ),
    );
  }
}