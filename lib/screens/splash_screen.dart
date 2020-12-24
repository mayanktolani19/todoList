import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateUser();
    super.initState();
  }

  void navigateUser() async {
    await Provider.of<TaskData>(context, listen: false).fetchTasks();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => TasksScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: CircleAvatar(
                child: Icon(
                  Icons.list,
                  size: 50,
                  color: Colors.lightBlueAccent,
                ),
                backgroundColor: Colors.white,
                radius: 50,
              ),
            ),
            Expanded(flex: 2, child: SizedBox(height: 10)),
            Expanded(
              flex: 1,
              child: Text(
                'Todoey - To Do List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
