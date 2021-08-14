import 'package:flutter/material.dart';

// import 'package:carousel_slider/carousel_slider.dart';

import 'package:todo_flutter/src/bloc/todo_list_provider.dart';
import 'package:todo_flutter/src/bloc/todo_list_bloc.dart';
import 'package:todo_flutter/src/screens/list_info.dart';
import 'package:todo_flutter/src/models.dart';
import 'package:todo_flutter/src/util.dart';
import 'package:todo_flutter/src/widgets.dart';


class TodoListScreen extends StatefulWidget {

  @override
  _TodoListScreenState createState() => _TodoListScreenState(); 
} 

class _TodoListScreenState extends State<TodoListScreen> {

  // TODO: Decide when to create the initial todolist during actual app use
  TodoListBloc _todoListBloc = TodoListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _todoListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var body = Container(
      padding: EdgeInsets.only(
        left: defaultPadding, 
        right: defaultPadding, 
        bottom: defaultPadding*2
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SplashInfo(),
          TodoListCard()
        ],
      ),
    );

    return TodoListProvider(
      todoListBloc: _todoListBloc,
      child: Container( // container for gradient bg
        child: Scaffold( 
          appBar: appBar,
          body: body,
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
        ),
        decoration: BoxDecoration(
          gradient: pinkToOrangeGradient,
        ),
      )
    );
  }
}

class SplashInfo extends StatelessWidget {

  final Profile _user = Profile();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTileTheme(
        textColor: Colors.white,
        child: ListTile(
          title: Text(
            "Hello, ${_user.name}.", 
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500
            ),
          ),
          subtitle: const Text("Cool."),
        ),
      ),
    );
  }
}

class TodoListCard extends StatelessWidget {

  // final TodoList _list = TodoList();

  @override
  Widget build(BuildContext context) {

    TodoListBloc _todoListBloc = TodoListProvider.of(context).todoListBloc;

    var _todoListIcon =
//    ShaderMask(
//      shaderCallback: (_) {
//        return pinkToOrangeGradient.createShader(_);
//        },
//      blendMode: BlendMode.modulate,
      Icon(Icons.check, color: Colors.grey,);
    // StreamBuilder(
    //   stream: todoListBloc.iconData,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       print("error");
    //       return Text("Error: ${snapshot.error}");
    //     }
//    );

    var todoListCardBar = Container(
      padding: EdgeInsets.all(defaultPadding/2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize:  MainAxisSize.min,
        children: <Widget>[
          
          Expanded(
            flex: 1,
            // expanded container
            child: Align(
              alignment: Alignment.centerLeft,
              child: _todoListIcon,
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.grey,),
        ],
      )
    );



    return Expanded( // expanded to fill body space
      flex: 1,
      child: Card(
          elevation: 10.0,
          margin: EdgeInsets.only(right: defaultPadding/2.0, left: defaultPadding/2.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: GestureDetector(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (_) => ListInfoScreen(todoListBloc: _todoListBloc,)
              )
            );
          },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            todoListCardBar,
            ListTile(
              title: Text("Tap to open list info."),
            ),
            Expanded(
              flex: 1,
              child: Hero(
                tag: 'listInfo',
                child: TodoListSummary(todoListBloc: _todoListBloc,),
              )
            ),
            // TODO: progress indicator
              
            ],
          )
        ),
      ),
    );
  }
}

// TODO: TodoListCardBar
