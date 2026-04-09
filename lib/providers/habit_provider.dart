import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/habit_model.dart';
import '../services/firestore_service.dart';

class HabitProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<HabitModel> _habits = [];
  bool _isLoading = false;

  List<HabitModel> get habits => _habits;
  bool get isLoading => _isLoading;

  int get completedTodayCount =>
      _habits.where((h) => h.isCompletedToday).length;

  int get totalHabits => _habits.length;

  double get todayProgress {
    if (_habits.isEmpty) return 0.0;
    return completedTodayCount / totalHabits;
  }

  void init() {
    _firestoreService.getHabits().listen((habits) {
      _habits = habits;
      notifyListeners();
    });
  }

  Future<void> addHabit({
    required String name,
    IconData icon = Icons.star,
    String frequency = 'daily',
    Color color = const Color(0xFF19C3E6),
  }) async {
    _isLoading = true;
    notifyListeners();

    final habit = HabitModel(
      id: const Uuid().v4(),
      name: name,
      icon: icon,
      frequency: frequency,
      color: color,
    );

    await _firestoreService.addHabit(habit);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleHabit(String habitId) async {
    final habit = _habits.firstWhere((h) => h.id == habitId);
    await _firestoreService.toggleHabitCompletion(habit);
  }

  Future<void> deleteHabit(String habitId) async {
    await _firestoreService.deleteHabit(habitId);
  }

  Future<void> updateHabit(HabitModel habit) async {
    await _firestoreService.updateHabit(habit);
  }
}
