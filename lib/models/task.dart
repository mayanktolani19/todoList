import 'dart:convert';

class Task {
  final String name;
  bool isDone;
  Task({this.name, this.isDone});
  void toggleDone() {
    isDone = !isDone;
  }

  factory Task.fromJson(Map<String, dynamic> jsonData) {
    return Task(
        name: jsonData['name'],
        isDone: jsonData['isDone'] == 'true' ? true : false);
  }
  static Map<String, dynamic> toMap(Task task) =>
      {'name': task.name, 'isDone': task.isDone ? 'true' : 'false'};
  static String encode(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((t) => Task.toMap(t)).toList(),
      );
  static List<Task> decode(String t) => (json.decode(t) as List<dynamic>)
      .map<Task>((item) => Task.fromJson(item))
      .toList();
}
