import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:todo_app/screens/edit_task_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
       title: const Text(
          'Todo List App',
          style: TextStyle(color: Colors.white), // AppBar title text color set to white
        ),
        backgroundColor: Colors.blue,
        
      ),
      body: tasks.isEmpty
          ? Center(  // If no tasks, show this
              child: Text(
                'No tasks available!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            )
          :
      ListView.builder(
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
          onEdit: () {
            showFullScreenEditTaskDialog(context, task.id, task.title);
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
