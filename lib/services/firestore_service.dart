import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/task_model.dart';
import '../models/habit_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  // =================== TASKS ===================

  CollectionReference get _tasksCollection {
    final uid = _uid;
    if (uid == null) throw Exception('User not authenticated');
    return _firestore.collection('users').doc(uid).collection('tasks');
  }

  Stream<List<TaskModel>> getTasks() {
    if (_uid == null) return Stream.value([]);
    return _tasksCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return TaskModel.fromMap(doc.data() as Map<String, dynamic>);
          }).toList();
        });
  }

  Future<List<TaskModel>> getTasksForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final snapshot =
        await _tasksCollection
            .where(
              'date',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay),
            )
            .where('date', isLessThan: Timestamp.fromDate(endOfDay))
            .get();

    return snapshot.docs.map((doc) {
      return TaskModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<void> addTask(TaskModel task) async {
    await _tasksCollection.doc(task.id).set(task.toMap());
  }

  Future<void> updateTask(TaskModel task) async {
    await _tasksCollection.doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String taskId) async {
    await _tasksCollection.doc(taskId).delete();
  }

  Future<void> toggleTaskCompletion(String taskId, bool isCompleted) async {
    await _tasksCollection.doc(taskId).update({'isCompleted': isCompleted});
  }

  // =================== HABITS ===================

  CollectionReference get _habitsCollection {
    final uid = _uid;
    if (uid == null) throw Exception('User not authenticated');
    return _firestore.collection('users').doc(uid).collection('habits');
  }

  Stream<List<HabitModel>> getHabits() {
    if (_uid == null) return Stream.value([]);
    return _habitsCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return HabitModel.fromMap(doc.data() as Map<String, dynamic>);
          }).toList();
        });
  }

  Future<void> addHabit(HabitModel habit) async {
    await _habitsCollection.doc(habit.id).set(habit.toMap());
  }

  Future<void> updateHabit(HabitModel habit) async {
    await _habitsCollection.doc(habit.id).update(habit.toMap());
  }

  Future<void> deleteHabit(String habitId) async {
    await _habitsCollection.doc(habitId).delete();
  }

  Future<void> toggleHabitCompletion(HabitModel habit) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final List<DateTime> updatedDates = List.from(habit.completedDates);

    if (habit.isCompletedToday) {
      updatedDates.removeWhere(
        (d) => d.year == today.year && d.month == today.month && d.day == today.day,
      );
    } else {
      updatedDates.add(today);
    }

    final updatedHabit = habit.copyWith(completedDates: updatedDates);
    await _habitsCollection.doc(habit.id).update(updatedHabit.toMap());
  }

  // =================== CLEAR ALL ===================

  Future<void> clearAllData() async {
    try {
      final batch = _firestore.batch();

      // Delete all tasks
      final tasks = await _tasksCollection.get();
      for (final doc in tasks.docs) {
        batch.delete(doc.reference);
      }

      // Delete all habits
      final habits = await _habitsCollection.get();
      for (final doc in habits.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      print('Error clearing data: $e');
      rethrow;
    }
  }
}
