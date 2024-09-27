import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:todo_app/widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List App'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskTile(
            id: task.id,
            title: task.title,
            isDone: task.isDone,
            onChanged: (value) {
              Provider.of<TaskProvider>(context, listen: false)
                  .toggleTaskStatus(index);
            },
            onDelete: () {
              Provider.of<TaskProvider>(context, listen: false)
                  .deleteTask(index); // Delete the task when the callback is called
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
