import 'package:flutter/material.dart';
import 'package:clearapp/model/todo.dart';
import 'package:uuid/uuid.dart';

class BaiscList extends StatefulWidget {
  @override
  _BaiscListState createState() => _BaiscListState();
}

class _BaiscListState extends State<BaiscList> {
  var uuid = Uuid();
  List<Todo> todos = [
    Todo(title: "Swipe right to complete", id: Uuid().v4(), isDone: false),
    Todo(title: "Swipe left to delete", id: Uuid().v4(), isDone: false),
    Todo(title: "Tap and Hold to pick me up", id: Uuid().v4(), isDone: false),
    Todo(
        title: "Swipe vertically or use the floating button to create an item",
        id: Uuid().v4(),
        isDone: false),
    Todo(title: "Try pinching to rows apart", id: Uuid().v4(), isDone: false),
  ];
  var temp;
  String input;
  double position;

  @override
  void initState() {
    super.initState();
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Todo item = todos.removeAt(oldIndex);
      todos.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clear"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text("Add a item"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          todos.add(Todo(
                              title: input, id: Uuid().v4(), isDone: false));
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Add"),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    )
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GestureDetector(
        onVerticalDragEnd: (DragEndDetails details) {
          print(
              'vertical ${details.velocity.pixelsPerSecond.dy.abs().floorToDouble()}');
          var y = details.velocity.pixelsPerSecond.dy.abs().floorToDouble();
          y > 0.0
              ? showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      title: Text("Add a item"),
                      content: TextField(
                        onChanged: (String value) {
                          input = value;
                        },
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              // todos.add(input);
                              todos.add(Todo(
                                  title: input,
                                  id: Uuid().v4(),
                                  isDone: false));
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add"),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        )
                      ],
                    );
                  })
              : null;
        },
        child: Container(
          color: Colors.black,
          child: ReorderableListView(onReorder: _onReorder, children: [
            for (var index = 0; index < todos.length; index++)
              Dismissible(
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    setState(() {
                      todos.removeAt(index);
                    });
                  }
                  if (direction == DismissDirection.startToEnd) {
                    print(todos.length);
                    setState(() {
                      todos[index].isDone = true;
                      todos[index].id = Uuid().v4();
                      temp = todos[index];
                      todos.removeAt(index);
                      todos.add(temp);
                    });
                    print(todos.length);
                  }
                },
                background: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: AlignmentDirectional.centerStart,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                key: Key(todos[index].id),
                child: Card(
                  elevation: 4,
                  child: todos[index].isDone
                      ? ListTile(
                          title: Text(todos[index].title,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough)),
                        )
                      : ListTile(
                          tileColor: Colors.red.withOpacity(
                              (todos.length - index) / todos.length),
                          title: Text(
                            todos[index].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
