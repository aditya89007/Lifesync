import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum TaskPriority {
  low,
  medium,
  high;

  String get label {
    switch (this) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }
}

enum TaskCategory {
  personal,
  work,
  health,
  education,
  other;

  String get label {
    switch (this) {
      case TaskCategory.personal:
        return 'Personal';
      case TaskCategory.work:
        return 'Work';
      case TaskCategory.health:
        return 'Health';
      case TaskCategory.education:
        return 'Education';
      case TaskCategory.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case TaskCategory.personal:
        return Icons.person_outline;
      case TaskCategory.work:
        return Icons.work_outline;
      case TaskCategory.health:
        return Icons.favorite_outline;
      case TaskCategory.education:
        return Icons.school_outlined;
      case TaskCategory.other:
        return Icons.more_horiz;
    }
  }
}

class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final TaskPriority priority;
  final TaskCategory category;
  final bool isCompleted;
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description = '',
    required this.date,
    this.priority = TaskPriority.medium,
    this.category = TaskCategory.personal,
    this.isCompleted = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    TaskPriority? priority,
    TaskCategory? category,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': Timestamp.fromDate(date),
      'priority': priority.index,
      'category': category.index,
      'isCompleted': isCompleted,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      priority: TaskPriority.values[map['priority'] ?? 1],
      category: TaskCategory.values[map['category'] ?? 0],
      isCompleted: map['isCompleted'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  String get priorityLabel {
    switch (priority) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }

  String get categoryLabel {
    switch (category) {
      case TaskCategory.personal:
        return 'Personal';
      case TaskCategory.work:
        return 'Work';
      case TaskCategory.health:
        return 'Health';
      case TaskCategory.education:
        return 'Education';
      case TaskCategory.other:
        return 'Other';
    }
  }
}
