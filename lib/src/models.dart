import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

// use uuid.v1 for time-based uuids, v4 for random
Uuid uuid = Uuid();

class Profile {
  final String _id = uuid.v1();
  String _name = "User";
  Image profileImage;

  Profile();

  String get name => _name;
}


class TodoList {
  
  final String _id = uuid.v1();
  String _name = "Todo";
  IconData _iconData = Icons.check_box;
  final List<Todo> _todos = <Todo>[];
  double _progress = 0.0;
  int _todosCount = 0;

  // Creates an empty TodoList.
  // TodoList();

  String get id => _id;

  double get progress => _progress;

  // Name methods
  String get name => _name;
  void updateName(String name) {
    _name = name;
  }

  ///// Icon methods
  IconData get iconData => _iconData;
  void updateIcon(IconData _iconData) {
    _iconData = _iconData;
  }

  ///// List<Todo> methods
  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  int get todoCount => _todosCount;

  void add(Todo todo) {
    _todos.add(todo);
    _todosCount = _todos.length;
    print(_todos);
  }

  void remove(Todo todo) {
    _todos.remove(todo);
  }

}

class Todo {
  final String id = uuid.v1();
  String name = "";
  String notes = "";
  bool complete = false;

  // Creates empty Todo.
  Todo();

  @override 
  String toString() => 
    "{ id: ${this.id}; name: ${this.name}; " +
    "notes: ${this.notes}; complete: ${this.complete}}";
}