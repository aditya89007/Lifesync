import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/habit_card.dart';
import '../widgets/glass_card.dart';
import 'edit_habit_screen.dart';
import 'package:lifesync/l10n/app_localizations.dart';

class HabitsListScreen extends StatelessWidget {
  const HabitsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Consumer<HabitProvider>(
      builder: (context, habitProvider, _) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.habits,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        if (habitProvider.habits.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.done(habitProvider.completedTodayCount, habitProvider.totalHabits),
                              style: const TextStyle(
                                color: AppColors.accent,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // Stats Row
                if (habitProvider.habits.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                      child: GlassCard(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _StatItem(
                              icon: Icons.repeat,
                              value: '${habitProvider.totalHabits}',
                              label: AppLocalizations.of(context)!.activeLabel,
                              color: AppColors.accent,
                            ),
                            Container(
                              width: 1,
                              height: 36,
                              color: isDark
                                  ? AppColors.darkDivider
                                  : AppColors.lightDivider,
                            ),
                            _StatItem(
                              icon: Icons.check_circle_outline,
                              value: '${habitProvider.completedTodayCount}',
                              label: AppLocalizations.of(context)!.doneTodayLabel,
                              color: AppColors.priorityLow,
                            ),
                            Container(
                              width: 1,
                              height: 36,
                              color: isDark
                                  ? AppColors.darkDivider
                                  : AppColors.lightDivider,
                            ),
                            _StatItem(
                              icon: Icons.local_fire_department,
                              value: _getBestStreak(habitProvider),
                              label: AppLocalizations.of(context)!.bestStreakLabel,
                              color: AppColors.priorityMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Habits List
                if (habitProvider.habits.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: GlassCard(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Icon(
                              Icons.repeat,
                              size: 56,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              AppLocalizations.of(context)!.noHabitsYet,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: isDark
                                        ? AppColors.darkTextTertiary
                                        : AppColors.lightTextTertiary,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              AppLocalizations.of(context)!.startBuildingHabitsToday,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      EditHabitScreen(habit: habit),
                                ),
                              );
                            },
                          );
                        },
                        childCount: habitProvider.habits.length,
                      ),
                    ),
                  ),

                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getBestStreak(HabitProvider provider) {
    if (provider.habits.isEmpty) return '0';
    final best = provider.habits
        .map((h) => h.currentStreak)
        .reduce((a, b) => a > b ? a : b);
    return '$best';
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 11,
              ),
        ),
      ],
    );
  }
}
