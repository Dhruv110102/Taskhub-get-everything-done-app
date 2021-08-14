import 'package:flutter/widgets.dart';
import 'package:todo_flutter/src/bloc/todo_list_bloc.dart';

// create a provider so that the bloc 
// can be accessed anywhere in widget tree
class TodoListProvider extends InheritedWidget {
  final TodoListBloc todoListBloc;

  TodoListProvider({
    Key key,
    @required TodoListBloc todoListBloc,
    @required Widget child
  }) : todoListBloc = todoListBloc ?? TodoListBloc(),
      super(key: key, child: child);

  @override
  // whether or not to notify widgets that inherit from this widget
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  // fallback logic in case no widget in scope
  static TodoListProvider of(BuildContext context) {
    // will return null
    return context.inheritFromWidgetOfExactType(TodoListProvider);
  }
  
}