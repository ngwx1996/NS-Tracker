import 'package:flutter/material.dart';
import 'package:ns_tracker/widgets/task_list.dart';
import 'add_task_screen.dart';

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('To-Do List'),
      ),
      body: _TodoState(),
    );
  }
}

class _TodoState extends StatefulWidget {
  @override
  __TodoStateState createState() => __TodoStateState();
}

class __TodoStateState extends State<_TodoState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
//            Icon(Icons.list),
//            Text('Todoey'),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
//              color: Colors.black38,
                decoration: BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: TaskList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
