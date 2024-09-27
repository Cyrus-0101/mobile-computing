import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/task_provider.dart';

void main() {
  group('TaskProvider', () {
    late TaskProvider taskProvider;

    setUp(() {
      taskProvider = TaskProvider();
    });

    test('should initialize with an empty task list', () {
      expect(taskProvider.tasks, []);
    });

    test('should add a task and notify listeners', () {
      // Arrange
      final task = Task(id: '1', title: 'Test Task', isDone: false);

      // Act
      taskProvider.addTask(task);

      // Assert
      expect(taskProvider.tasks.length, 1);
      expect(taskProvider.tasks[0].title, 'Test Task');
    });

    test('should toggle task status and notify listeners', () {
      // Arrange
      final task = Task(id: '1', title: 'Test Task', isDone: false);
      taskProvider.addTask(task);

      // Act: Toggle task status
      taskProvider.toggleTaskStatus(0);

      // Assert: Task status should be toggled
      expect(taskProvider.tasks[0].isDone, true);

      // Act: Toggle task status back
      taskProvider.toggleTaskStatus(0);

      // Assert: Task status should be toggled back
      expect(taskProvider.tasks[0].isDone, false);
    });

    test('should notify listeners when adding a task', () {
      // Create a listener
      bool listenerCalled = false;
      taskProvider.addListener(() {
        listenerCalled = true;
      });

      // Act
      final task = Task(id: '1', title: 'Test Task', isDone: false);
      taskProvider.addTask(task);

      // Assert
      expect(listenerCalled, true);
    });

    test('should notify listeners when toggling task status', () {
      // Arrange: Create a task and add it to the provider
      final task = Task(id: '1', title: 'Test Task', isDone: false);
      taskProvider.addTask(task);

      // Create a listener
      bool listenerCalled = false;
      taskProvider.addListener(() {
        listenerCalled = true;
      });

      // Act: Toggle the task status
      taskProvider.toggleTaskStatus(0);

      // Assert: The listener should be notified
      expect(listenerCalled, true);
    });
  });
}
