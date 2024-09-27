import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';

void showFullScreenEditTaskDialog(BuildContext context, String taskId, String currentTitle) {
  final TextEditingController taskController = TextEditingController(text: currentTitle);

  showDialog(
    context: context,
    barrierDismissible: false, // Prevent closing by tapping outside
    builder: (ctx) => Dialog(
      insetPadding: EdgeInsets.zero, // Removes padding to make it full screen
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Task', style: TextStyle(fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(ctx).pop(); // Close without saving
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: taskController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Task',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final taskText = taskController.text;
                  if (taskText.isNotEmpty) {
                    Provider.of<TaskProvider>(context, listen: false)
                        .editTask(taskId, taskText);
                    Navigator.of(ctx).pop(); // Close after saving
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
