import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import 'package:todo_flutter/src/models.dart';

class TodoListBloc {
  static TodoList _todoList = TodoList();

  // Output
  Stream<String> get name => _nameSubject.stream;
  final _nameSubject = BehaviorSubject<String>(seedValue:  _todoList.name);

  Stream<IconData> get iconData => _iconSubject.stream;
  final _iconSubject = BehaviorSubject<IconData>(seedValue: _todoList.iconData);

  Stream<TodoList> get todoList => _todoListSubject.stream;
  final _todoListSubject = BehaviorSubject<TodoList>(seedValue: _todoList); 

  // output: todos list
  // keep as <List<Todo>> to keep list info - length, order, etc.
  // Observable aka Stream
  Stream<List<Todo>> get todos => _todosSubject.stream;
  final _todosSubject = BehaviorSubject<List<Todo>>();

  Stream<int> get todoCount => _todoCountSubject.stream;
  final _todoCountSubject = BehaviorSubject<int>(seedValue: 0);

  // input stream, accessed externally
  Sink<Todo> get addTodo => _addTodoSubject.sink;
  // helper for input stream - send data, error, done events
  final _addTodoSubject = BehaviorSubject<Todo>();

  
  TodoListBloc() {
    // _nameSubject.stream.listen((name) {
    //   // _todoList.updateName(name);
    // });

    // listen for addTodo function
    _addTodoSubject.stream.listen((addedTodo) {
      // actually modify the TodoList
      _todoList.add(addedTodo);
      _todoCountSubject.add(_todoList.todoCount);
    });
  }

  // close all inputs - Sinks/Observables
  void close() {
    addTodo.close();
  }


}

class TodoBloc {
  Todo _todo;

  Observable<Todo> get updateTodo => _updateTodoController.stream;
  BehaviorSubject<Todo> _updateTodoController = BehaviorSubject<Todo>();

  TodoBloc() {
    _updateTodoController.stream.listen((data) {

    });
  }
}