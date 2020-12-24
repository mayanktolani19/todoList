import 'package:flutter/foundation.dart';
import 'package:todoey/database/database.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  LocalDatabase localDatabase = new LocalDatabase();
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  fetchTasks() async {
    String td = await localDatabase.fetchTasks();
    print(td);
    if (td != null) _tasks = Task.decode(td);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) async {
    final task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
    String t = Task.encode(_tasks);
    await localDatabase.updateTasks(t);
  }

  void updateTask(Task task) async {
    task.toggleDone();
    notifyListeners();
    String t = Task.encode(_tasks);
    await localDatabase.updateTasks(t);
  }

  void deleteTask(Task task) async {
    _tasks.remove(task);
    notifyListeners();
    String t = Task.encode(_tasks);
    await localDatabase.updateTasks(t);
  }
}
