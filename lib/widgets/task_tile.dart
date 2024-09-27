import 'package:flutter/material.dart';
import 'package:todo_app/screens/task_detail_screen.dart'; 

class TaskTile extends StatelessWidget {
  final String id;
  final String title;
  final bool isDone;
  final ValueChanged<bool?> onChanged;

  const TaskTile({
    super.key,
    required this.id,
    required this.title,
    required this.isDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
      // Step 3: Add onTap for navigation to TaskDetailScreen
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetailScreen(taskId: id),
          ),
        );
      },
      
    );
  }
}
