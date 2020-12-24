import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  updateTasks(String tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tasks", tasks);
  }

  fetchTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("tasks");
  }
}
