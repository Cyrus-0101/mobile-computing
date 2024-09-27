import 'package:flutter/material.dart';
import 'package:todo_app/screens/task_detail_screen.dart'; 

class TaskTile extends StatelessWidget {
  final String id;
  final String title;
  final bool isDone;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete; // Callback for delete action


  const TaskTile({
    super.key,
    required this.id,
    required this.title,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
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
      
   trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          _showDeleteConfirmationDialog(context);
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // Close the dialog without deleting
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onDelete(); // Call the delete callback
              Navigator.of(ctx).pop(); // Close the dialog after deleting
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
