import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallBack: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return NAlertDialog(
                        title: Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Text(
                              "Delete this task?",
                              style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              "NO",
                            ),
                            textColor: Colors.white,
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text("YES"),
                            textColor: Colors.white,
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              taskData.deleteTask(task);
                              Navigator.of(context).pop();
                              Fluttertoast.showToast(
                                  msg: "Task Deleted",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.lightBlueAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                          ),
                        ],
                      );
                    });
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
