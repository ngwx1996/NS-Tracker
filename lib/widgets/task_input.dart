import 'package:flutter/material.dart';


class TaskInput extends StatefulWidget {
  final Function onSubmitted;

  TaskInput({@required Function this.onSubmitted});

  @override
  _TaskInputState createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Color(0xFF1F1F1F),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 40,
              child: Icon(
                Icons.add,
                color: Colors.greenAccent,
                size: 30,
              ),
            ),
            Expanded(
              child: TextField(
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                    hintText: 'What do you want to do?',
                    border: InputBorder.none),
                textInputAction: TextInputAction.done,
                controller: textEditingController,
                onEditingComplete: () {
                  widget.onSubmitted(controller: textEditingController);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}