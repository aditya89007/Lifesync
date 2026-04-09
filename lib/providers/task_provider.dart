import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/task_model.dart';
import '../services/firestore_service.dart';

class TaskProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<TaskModel> _tasks = [];
  bool _isLoading = false;

  List<TaskModel> get tasks => _tasks;
  bool get isLoading => _isLoading;

  List<TaskModel> get todayTasks {
    final now = DateTime.now();
    return _tasks.where((task) {
      return task.date.year == now.year &&
          task.date.month == now.month &&
          task.date.day == now.day;
    }).toList();
  }

  List<TaskModel> get completedTasks =>
      _tasks.where((t) => t.isCompleted).toList();

  List<TaskModel> get pendingTasks =>
      _tasks.where((t) => !t.isCompleted).toList();

  List<TaskModel> get todayPendingTasks =>
      todayTasks.where((t) => !t.isCompleted).toList();

  List<TaskModel> get todayCompletedTasks =>
      todayTasks.where((t) => t.isCompleted).toList();

  /// Tasks in the next 7 days (excluding today), sorted by date
  List<TaskModel> get upcomingTasks {
    final now = DateTime.now();
    final todayEnd = DateTime(now.year, now.month, now.day + 1);
    final weekEnd = todayEnd.add(const Duration(days: 7));
    return _tasks
        .where((t) => t.date.isAfter(todayEnd.subtract(const Duration(seconds: 1))) && t.date.isBefore(weekEnd))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  /// Overdue tasks — past date and still incomplete
  List<TaskModel> get overdueTasks {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    return _tasks
        .where((t) => !t.isCompleted && t.date.isBefore(todayStart))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  /// Tasks for a specific date
  List<TaskModel> tasksForDate(DateTime date) {
    return _tasks.where((task) {
      return task.date.year == date.year &&
          task.date.month == date.month &&
          task.date.day == date.day;
    }).toList();
  }

  double get todayProgress {
    if (todayTasks.isEmpty) return 0.0;
    return todayCompletedTasks.length / todayTasks.length;
  }

  void init() {
    _firestoreService.getTasks().listen((tasks) {
      _tasks = tasks;
      notifyListeners();
    });
  }

  Future<void> addTask({
    required String title,
    String description = '',
    required DateTime date,
    TaskPriority priority = TaskPriority.medium,
    TaskCategory category = TaskCategory.personal,
  }) async {
    _isLoading = true;
    notifyListeners();

    final task = TaskModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
      date: date,
      priority: priority,
      category: category,
    );

    await _firestoreService.addTask(task);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleTask(String taskId) async {
    final task = _tasks.firstWhere((t) => t.id == taskId);
    await _firestoreService.toggleTaskCompletion(taskId, !task.isCompleted);
  }

  Future<void> deleteTask(String taskId) async {
    await _firestoreService.deleteTask(taskId);
  }

  Future<void> updateTask(TaskModel task) async {
    await _firestoreService.updateTask(task);
  }
}
