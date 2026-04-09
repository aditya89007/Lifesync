import 'dart:math';
import 'package:flutter/material.dart';
import '../models/habit_model.dart';
import '../theme/app_theme.dart';
import 'soft_card.dart';

class HabitCard extends StatelessWidget {
  final HabitModel habit;
  final VoidCallback onToggle;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const HabitCard({
    super.key,
    required this.habit,
    required this.onToggle,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dismissible(
      key: Key(habit.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete?.call(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.priorityHigh.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_outline, color: AppColors.priorityHigh, size: 28),
      ),
      child: SoftCard(
        onTap: onTap,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icon with progress ring
            _HabitProgressRing(
              icon: habit.icon,
              color: habit.color,
              isCompleted: habit.isCompletedToday,
            ),
            const SizedBox(width: 16),

            // Habit info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: habit.isCompletedToday
                          ? (isDark
                              ? AppColors.darkTextTertiary
                              : AppColors.lightTextTertiary)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        size: 16,
                        color: habit.currentStreak > 0
                            ? AppColors.priorityMedium
                            : (isDark
                                ? AppColors.darkTextTertiary
                                : AppColors.lightTextTertiary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${habit.currentStreak} day streak',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: habit.currentStreak > 0
                              ? AppColors.priorityMedium
                              : null,
                          fontWeight: habit.currentStreak > 0
                              ? FontWeight.w600
                              : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Completion check
            GestureDetector(
              onTap: onToggle,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: habit.isCompletedToday
                      ? habit.color.withValues(alpha: 0.2)
                      : Colors.transparent,
                  border: Border.all(
                    color: habit.isCompletedToday
                        ? habit.color
                        : (isDark
                            ? AppColors.darkDivider
                            : AppColors.lightDivider),
                    width: 2,
                  ),
                ),
                child: habit.isCompletedToday
                    ? Icon(Icons.check, size: 20, color: habit.color)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HabitProgressRing extends StatelessWidget {
  final IconData icon;
  final Color color;
  final bool isCompleted;

  const _HabitProgressRing({
    required this.icon,
    required this.color,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Progress ring
          CustomPaint(
            size: const Size(48, 48),
            painter: _RingPainter(
              color: color,
              progress: isCompleted ? 1.0 : 0.0,
            ),
          ),
          // Icon
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.15),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final Color color;
  final double progress;

  _RingPainter({required this.color, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background ring
    final bgPaint = Paint()
      ..color = color.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(center, radius, bgPaint);

    // Progress ring
    if (progress > 0) {
      final progressPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        2 * pi * progress,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
