import 'package:flutter/material.dart';
import 'package:todo_app/screens/task_detail_screen.dart'; 

class TaskTile extends StatefulWidget {
  final String id;
  final String title;
  final bool isDone;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.id,
    required this.title,
    required this.isDone,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _isHovered = false; // To track hover state

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: _isHovered
              ? Border.all(color: Colors.blue, width: 2) // Show border on hover
              : Border.all(color: Colors.transparent), // Transparent border otherwise
        ),
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              decoration: widget.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          leading: Checkbox(
            value: widget.isDone,
            onChanged: widget.onChanged,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TaskDetailScreen(taskId: widget.id),
              ),
            );
          },
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: widget.onEdit, // Trigger the edit callback
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: widget.onDelete, // Trigger the delete callback
              ),
            ],
          ),
        ),
      ),
    );
  }
}
