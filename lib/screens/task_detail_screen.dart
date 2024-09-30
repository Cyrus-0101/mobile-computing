import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';


class TaskDetailScreen extends StatelessWidget {
  final String taskId;

  const TaskDetailScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    // Get the task using the taskId from the provider
    final task = Provider.of<TaskProvider>(context).findById(taskId);

    if (task == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Task Details', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: const Center(
          child: Text('Task not found!'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              task.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Task Status: '),
                Checkbox(
                  value: task.isDone,
                  onChanged: null, // You can make this interactive if needed
                ),
                Text(task.isDone ? 'Completed' : 'Incomplete'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
