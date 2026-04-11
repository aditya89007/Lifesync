import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/task_provider.dart';
import '../providers/habit_provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/task_card.dart';
import '../widgets/habit_card.dart';
import '../widgets/animated_progress_ring.dart';
import '../widgets/date_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();

  bool get _isToday {
    final now = DateTime.now();
    return _selectedDate.year == now.year &&
        _selectedDate.month == now.month &&
        _selectedDate.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final now = DateTime.now();
    final dateFormatted = DateFormat('EEEE, MMM d').format(now);
    final userName = context.watch<AuthProvider>().displayName.split(' ').first;

    return Consumer2<TaskProvider, HabitProvider>(
      builder: (context, taskProvider, habitProvider, _) {
        final todayTasks = taskProvider.todayTasks;
        final selectedDateTasks = _isToday
            ? todayTasks
            : taskProvider.tasksForDate(_selectedDate);
        final pendingCount = taskProvider.todayPendingTasks.length;
        final totalTasks = todayTasks.length;
        final totalHabits = habitProvider.totalHabits;
        final completedHabits = habitProvider.completedTodayCount;
        final upcomingTasks = taskProvider.upcomingTasks;
        final overdueTasks = taskProvider.overdueTasks;

        // Combined progress (today)
        final totalItems = totalTasks + totalHabits;
        final completedItems =
            taskProvider.todayCompletedTasks.length + completedHabits;
        final overallProgress =
            totalItems > 0 ? completedItems / totalItems : 0.0;

        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateFormatted,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Good ${_getGreeting()}, $userName! 👋',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: isDark
                                    ? AppColors.darkTextPrimary
                                    : AppColors.lightTextPrimary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Date Selector
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: DateSelector(
                      selectedDate: _selectedDate,
                      onDateSelected: (date) {
                        setState(() => _selectedDate = date);
                      },
                    ),
                  ),
                ),

                // Progress Card (only show for today)
                if (_isToday)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                      child: GlassCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              'Daily Progress',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _getProgressMessage(
                                pendingCount,
                                totalItems,
                                completedItems,
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.accent),
                            ),
                            const SizedBox(height: 20),
                            AnimatedProgressRing(
                              progress: overallProgress,
                              size: 140,
                              label: 'completed',
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _StatChip(
                                  icon: Icons.check_circle_outline,
                                  label: 'Tasks',
                                  value:
                                      '${taskProvider.todayCompletedTasks.length}/$totalTasks',
                                  color: AppColors.priorityLow,
                                ),
                                _StatChip(
                                  icon: Icons.repeat,
                                  label: 'Habits',
                                  value: '$completedHabits/$totalHabits',
                                  color: AppColors.accent,
                                ),
                                _StatChip(
                                  icon: Icons.local_fire_department,
                                  label: 'Streaks',
                                  value: _getBestStreak(habitProvider),
                                  color: AppColors.priorityMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Overdue Tasks
                if (overdueTasks.isNotEmpty && _isToday) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 18,
                            decoration: BoxDecoration(
                              color: AppColors.priorityHigh,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Overdue',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: AppColors.priorityHigh),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.priorityHigh
                                  .withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${overdueTasks.length}',
                              style: const TextStyle(
                                color: AppColors.priorityHigh,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final task = overdueTasks[index];
                          return TaskCard(
                            task: task,
                            onToggle: () =>
                                taskProvider.toggleTask(task.id),
                            onDelete: () =>
                                taskProvider.deleteTask(task.id),
                          );
                        },
                        childCount: overdueTasks.length,
                      ),
                    ),
                  ),
                ],

                // Habits Section (only on today)
                if (habitProvider.habits.isNotEmpty && _isToday) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Habits',
                                style:
                                    Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          Text(
                            '$completedHabits/$totalHabits done',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.accent),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final habit = habitProvider.habits[index];
                          return HabitCard(
                            habit: habit,
                            onToggle: () =>
                                habitProvider.toggleHabit(habit.id),
                            onDelete: () =>
                                habitProvider.deleteHabit(habit.id),
                          );
                        },
                        childCount: habitProvider.habits.length,
                      ),
                    ),
                  ),
                ],

                // Tasks Section (selected date)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 18,
                              decoration: BoxDecoration(
                                color: AppColors.categoryWork,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _isToday
                                  ? "Today's Tasks"
                                  : DateFormat('MMM d').format(_selectedDate),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        if (selectedDateTasks.isNotEmpty)
                          Text(
                            '${selectedDateTasks.where((t) => !t.isCompleted).length} remaining',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.accent),
                          ),
                      ],
                    ),
                  ),
                ),

                if (selectedDateTasks.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GlassCard(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            Icon(
                              Icons.task_alt,
                              size: 48,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _isToday
                                  ? 'No tasks for today'
                                  : 'No tasks for this date',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: isDark
                                        ? AppColors.darkTextTertiary
                                        : AppColors.lightTextTertiary,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tap + to add a new task',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final task = selectedDateTasks[index];
                          return TaskCard(
                            task: task,
                            onToggle: () =>
                                taskProvider.toggleTask(task.id),
                            onDelete: () =>
                                taskProvider.deleteTask(task.id),
                          );
                        },
                        childCount: selectedDateTasks.length,
                      ),
                    ),
                  ),

                // Upcoming Tasks Section (only show on today)
                if (upcomingTasks.isNotEmpty && _isToday) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 18,
                            decoration: BoxDecoration(
                              color: AppColors.categoryPersonal,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Upcoming',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Next 7 days',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.categoryPersonal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final task = upcomingTasks[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 4, bottom: 4),
                                  child: Text(
                                    _getRelativeDate(task.date),
                                    style: const TextStyle(
                                      color: AppColors.categoryPersonal,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TaskCard(
                                  task: task,
                                  onToggle: () =>
                                      taskProvider.toggleTask(task.id),
                                  onDelete: () =>
                                      taskProvider.deleteTask(task.id),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: upcomingTasks.length,
                      ),
                    ),
                  ),
                ],

                // Bottom spacing
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    final diff = target.difference(today).inDays;
    if (diff == 1) return 'Tomorrow';
    if (diff <= 7) return 'In $diff days';
    return DateFormat('MMM d').format(date);
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Morning';
    if (hour < 17) return 'Afternoon';
    return 'Evening';
  }

  String _getProgressMessage(int pending, int total, int completed) {
    if (total == 0) return 'Add tasks & habits to get started!';
    if (completed == total) return 'Amazing! All done for today! 🎉';
    if (pending <= 3) return 'Almost there! $pending left to go! 💪';
    return 'Keep going! $completed of $total completed';
  }

  String _getBestStreak(HabitProvider provider) {
    if (provider.habits.isEmpty) return '0';
    final best = provider.habits
        .map((h) => h.currentStreak)
        .reduce((a, b) => a > b ? a : b);
    return '$best';
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: color,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
