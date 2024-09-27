import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }


  // Get  a task by its id
  Task? findById(String id) {
    return _tasks.firstWhere((task) => task.id == id);
  }

  void toggleTaskStatus(int index) {
    tasks[index].toggleDone();
    notifyListeners();
  }

  // Implement methods to update and delete tasks

  // You can also add methods for fetching and managing tasks
}
