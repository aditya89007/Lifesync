import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HabitModel {
  final String id;
  final String name;
  final IconData icon;
  final String frequency; // 'daily', 'weekly', 'custom'
  final int currentStreak;
  final List<DateTime> completedDates;
  final Color color;
  final DateTime createdAt;

  HabitModel({
    required this.id,
    required this.name,
    this.icon = Icons.star,
    this.frequency = 'daily',
    this.currentStreak = 0,
    this.completedDates = const [],
    this.color = const Color(0xFF19C3E6),
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  HabitModel copyWith({
    String? id,
    String? name,
    IconData? icon,
    String? frequency,
    int? currentStreak,
    List<DateTime>? completedDates,
    Color? color,
    DateTime? createdAt,
  }) {
    return HabitModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      frequency: frequency ?? this.frequency,
      currentStreak: currentStreak ?? this.currentStreak,
      completedDates: completedDates ?? this.completedDates,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  bool get isCompletedToday {
    final now = DateTime.now();
    return completedDates.any(
      (d) => d.year == now.year && d.month == now.month && d.day == now.day,
    );
  }

  int _calculateStreak() {
    if (completedDates.isEmpty) return 0;

    final sorted = List<DateTime>.from(completedDates)
      ..sort((a, b) => b.compareTo(a));

    int streak = 0;
    DateTime checkDate = DateTime.now();

    for (final date in sorted) {
      final diff = DateTime(
        checkDate.year,
        checkDate.month,
        checkDate.day,
      ).difference(DateTime(date.year, date.month, date.day)).inDays;

      if (diff <= 1) {
        streak++;
        checkDate = date;
      } else {
        break;
      }
    }
    return streak;
  }

  static IconData iconFromName(String name) {
    switch (name) {
      case 'water_drop': return Icons.water_drop;
      case 'self_improvement': return Icons.self_improvement;
      case 'fitness_center': return Icons.fitness_center;
      case 'menu_book': return Icons.menu_book;
      case 'music_note': return Icons.music_note;
      case 'bedtime': return Icons.bedtime;
      case 'emoji_food_beverage': return Icons.emoji_food_beverage;
      case 'directions_run': return Icons.directions_run;
      case 'spa': return Icons.spa;
      case 'favorite': return Icons.favorite;
      case 'code': return Icons.code;
      case 'brush': return Icons.brush;
      case 'school': return Icons.school;
      default: return Icons.star;
    }
  }

  String get _iconName {
    if (icon == Icons.water_drop) return 'water_drop';
    if (icon == Icons.self_improvement) return 'self_improvement';
    if (icon == Icons.fitness_center) return 'fitness_center';
    if (icon == Icons.menu_book) return 'menu_book';
    if (icon == Icons.music_note) return 'music_note';
    if (icon == Icons.bedtime) return 'bedtime';
    if (icon == Icons.emoji_food_beverage) return 'emoji_food_beverage';
    if (icon == Icons.directions_run) return 'directions_run';
    if (icon == Icons.spa) return 'spa';
    if (icon == Icons.star) return 'star';
    if (icon == Icons.favorite) return 'favorite';
    if (icon == Icons.code) return 'code';
    if (icon == Icons.brush) return 'brush';
    if (icon == Icons.school) return 'school';
    return 'star';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': _iconName,
      'frequency': frequency,
      'currentStreak': _calculateStreak(),
      'completedDates':
          completedDates.map((d) => Timestamp.fromDate(d)).toList(),
      'color': color.toARGB32(),
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    final completedDates =
        (map['completedDates'] as List<dynamic>?)
            ?.map((d) => (d as Timestamp).toDate())
            .toList() ??
        [];

    return HabitModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      icon: iconFromName(map['icon'] ?? 'star'),
      frequency: map['frequency'] ?? 'daily',
      currentStreak: map['currentStreak'] ?? 0,
      completedDates: completedDates,
      color: Color(map['color'] ?? 0xFF19C3E6),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  static List<IconData> get availableIcons => [
    Icons.water_drop,
    Icons.self_improvement,
    Icons.fitness_center,
    Icons.menu_book,
    Icons.music_note,
    Icons.bedtime,
    Icons.emoji_food_beverage,
    Icons.directions_run,
    Icons.spa,
    Icons.star,
    Icons.favorite,
    Icons.code,
    Icons.brush,
    Icons.school,
  ];
}
