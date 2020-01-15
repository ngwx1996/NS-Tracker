import 'package:flutter/material.dart';
import 'package:ns_tracker/widgets/header.dart';
import 'package:ns_tracker/widgets/task_input.dart';
import 'package:ns_tracker/widgets/todo.dart';
import 'package:ns_tracker/widgets/done.dart';
import 'package:ns_tracker/models/todo.dart' as Model;
import 'package:ns_tracker/models/db_wrapper.dart';
import 'package:ns_tracker/utils/utils.dart';


class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('To-do List'),
      ),
      body: HomeScreen(),
    );
  }

}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String welcomeMsg;
  List<Model.Todo> todos;
  List<Model.Todo> dones;
  //String _selection;

  @override
  void initState() {
    super.initState();
    getTodosAndDones();
    welcomeMsg = 'Add a task';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: GestureDetector(
        onTap: () {
          Utils.hideKeyboard(context);
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xFF121212),
              automaticallyImplyLeading: false,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Header(
                                      msg: 'Add a task',
                                    ),

                                  ],
                                ),
                              ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: TaskInput(
                                onSubmitted: addTaskInTodo,
                              ), // Add Todos
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              expandedHeight: 200,
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  switch (index) {
                    case 0:
                      return Todo(
                        todos: todos,
                        onTap: markTodoAsDone,
                        onDeleteTask: deleteTask,
                      ); // Active todos
                    case 1:
                      return SizedBox(
                        height: 30,
                      );
                    default:
                      return Done(
                        dones: dones,
                        onTap: markDoneAsTodo,
                        onDeleteTask: deleteTask,
                      ); // Done todos
                  }
                },
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getTodosAndDones() async {
    final _todos = await DBWrapper.sharedInstance.getTodos();
    final _dones = await DBWrapper.sharedInstance.getDones();

    setState(() {
      todos = _todos;
      dones = _dones;
    });
  }

  void addTaskInTodo({@required TextEditingController controller}) {
    final inputText = controller.text.trim();

    if (inputText.length > 0) {
      // Add todos
      Model.Todo todo = Model.Todo(
        title: inputText,
        created: DateTime.now(),
        updated: DateTime.now(),
        status: Model.TodoStatus.active.index,
      );

      DBWrapper.sharedInstance.addTodo(todo);
      getTodosAndDones();
    } else {
      Utils.hideKeyboard(context);
    }

    controller.text = '';
  }

  void markTodoAsDone({@required int pos}) {
    DBWrapper.sharedInstance.markTodoAsDone(todos[pos]);
    getTodosAndDones();
  }

  void markDoneAsTodo({@required int pos}) {
    DBWrapper.sharedInstance.markDoneAsTodo(dones[pos]);
    getTodosAndDones();
  }

  void deleteTask({@required Model.Todo todo}) {
    DBWrapper.sharedInstance.deleteTodo(todo);
    getTodosAndDones();
  }
}