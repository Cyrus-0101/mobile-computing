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
  void editTask(String id, String newTitle) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = Task(id: _tasks[taskIndex].id, title: newTitle, isDone: _tasks[taskIndex].isDone);
      notifyListeners();
    }
  }

 // Implementing the deleteTask method
  void deleteTask(int index) {
    _tasks.removeAt(index); // Remove the task at the given index
    notifyListeners(); // Notify listeners about the change
  }

  // You can also add methods for fetching and managing tasks
}
