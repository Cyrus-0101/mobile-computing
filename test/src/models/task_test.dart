// Write a test for the task model

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/task.dart';

void main() {
  group('Task', () {
    // Test for creation of the task
    test('should create a task with the given title, id, and isDone status',
        () {
      final task = Task(
        id: '1',
        title: 'Test Task',
        isDone: false,
      );

      expect(task.title, 'Test Task');
      expect(task.id, '1');
      expect(task.isDone, false);
    });

    // Test for the toggleDone method
    test('should toggle the isDone status', () {
      final task = Task(
        id: '1',
        title: 'Test Task',
        isDone: false,
      );

      // Toggle isDone from false to true
      task.toggleDone();
      expect(task.isDone, true);

      // Toggle isDone from true to false
      task.toggleDone();
      expect(task.isDone, false);
    });
  });
}
