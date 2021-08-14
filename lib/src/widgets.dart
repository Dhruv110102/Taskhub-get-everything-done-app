import 'package:flutter/material.dart';

import 'package:todo_flutter/src/bloc/todo_list_bloc.dart';
import 'package:todo_flutter/src/util.dart';

// simply a display container for TodoList info, stateless
class TodoListSummary extends StatelessWidget {
  // not sure if blocs should be passed this way
  final TodoListBloc todoListBloc;

  TodoListSummary({
    this.todoListBloc
  });

  @override
  Widget build(BuildContext context) {
    // var todoListBloc = TodoListProvider.of(context).todoListBloc;
      return Container(
          padding: EdgeInsets.all(defaultPadding/2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // # of tasks text
              StreamBuilder<int>(
                stream: todoListBloc.todoCount,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  return Text(
                    "${snapshot.data} Tasks",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  );
                }
              ),
              // list name text
              StreamBuilder(
                stream: todoListBloc.name,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  if (snapshot.data != null) {
                    return Text(
                      snapshot.data,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500
                      ),
                    );
                  }
                  else {
                    return Text("Empty name.");
                  }
                },
              )
            ],
          ),
      );
    }
}