import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/task_card.dart';
import '../widgets/glass_card.dart';
import 'edit_task_screen.dart';
import 'package:lifesync/l10n/app_localizations.dart';

class TasksListScreen extends StatefulWidget {
  const TasksListScreen({super.key});

  @override
  State<TasksListScreen> createState() => _TasksListScreenState();
}

class _TasksListScreenState extends State<TasksListScreen> {
  String _filter = 'all';
  String _searchQuery = '';
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Consumer<TaskProvider>(
      builder: (context, taskProvider, _) {
        final tasks = _getFilteredTasks(taskProvider);

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
                          AppLocalizations.of(context)!.allTasks,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          AppLocalizations.of(context)!.totalCount(taskProvider.tasks.length),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.accent),
                        ),
                      ],
                    ),
                  ),
                ),

                // Search Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (val) => setState(() => _searchQuery = val),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                          ),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.searchTasks,
                        prefixIcon:
                            const Icon(Icons.search, color: AppColors.accent),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.close,
                                    size: 20,
                                    color: isDark
                                        ? AppColors.darkTextTertiary
                                        : AppColors.lightTextTertiary),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() => _searchQuery = '');
                                },
                              )
                            : null,
                        filled: true,
                        fillColor:
                            isDark ? AppColors.darkSurface : AppColors.lightCardLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),

                // Filter chips
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          _FilterChip(
                            label: AppLocalizations.of(context)!.allFilter,
                            isSelected: _filter == 'all',
                            onTap: () => setState(() => _filter = 'all'),
                            count: taskProvider.tasks.length,
                          ),
                          const SizedBox(width: 8),
                          _FilterChip(
                            label: AppLocalizations.of(context)!.pendingFilter,
                            isSelected: _filter == 'pending',
                            onTap: () => setState(() => _filter = 'pending'),
                            count: taskProvider.pendingTasks.length,
                          ),
                          const SizedBox(width: 8),
                          _FilterChip(
                            label: AppLocalizations.of(context)!.doneFilter,
                            isSelected: _filter == 'completed',
                            onTap: () => setState(() => _filter = 'completed'),
                            count: taskProvider.completedTasks.length,
                          ),
                          const SizedBox(width: 8),
                          _FilterChip(
                            label: AppLocalizations.of(context)!.overdue,
                            isSelected: _filter == 'overdue',
                            onTap: () => setState(() => _filter = 'overdue'),
                            count: taskProvider.overdueTasks.length,
                            isWarning: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Tasks List
                if (tasks.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: GlassCard(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Icon(
                              _searchQuery.isNotEmpty
                                  ? Icons.search_off
                                  : _filter == 'completed'
                                      ? Icons.task_alt
                                      : _filter == 'overdue'
                                          ? Icons.warning_amber_rounded
                                          : Icons.inbox_outlined,
                              size: 56,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _searchQuery.isNotEmpty
                                  ? AppLocalizations.of(context)!.noResultsFor(_searchQuery)
                                  : _filter == 'completed'
                                      ? AppLocalizations.of(context)!.noCompletedTasksYet
                                      : _filter == 'overdue'
                                          ? AppLocalizations.of(context)!.noOverdueTasks
                                          : _filter == 'pending'
                                              ? AppLocalizations.of(context)!.allCaughtUp
                                              : AppLocalizations.of(context)!.noTasksToday,
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
                              _searchQuery.isNotEmpty
                                  ? AppLocalizations.of(context)!.tryDifferentSearchTerm
                                  : AppLocalizations.of(context)!.tapToCreateFirstTask,
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
                          final task = tasks[index];
                          return TaskCard(
                            task: task,
                            onToggle: () =>
                                taskProvider.toggleTask(task.id),
                            onDelete: () =>
                                taskProvider.deleteTask(task.id),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      EditTaskScreen(task: task),
                                ),
                              );
                            },
                          );
                        },
                        childCount: tasks.length,
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

  List<dynamic> _getFilteredTasks(TaskProvider provider) {
    var tasks = switch (_filter) {
      'pending' => provider.pendingTasks,
      'completed' => provider.completedTasks,
      'overdue' => provider.overdueTasks,
      _ => provider.tasks,
    };

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      tasks = tasks
          .where((t) =>
              t.title.toLowerCase().contains(query) ||
              t.description.toLowerCase().contains(query))
          .toList();
    }

    return tasks;
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final int count;
  final bool isWarning;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.count,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? (isWarning ? AppColors.priorityHigh.withValues(alpha: 0.15) : AppColors.accent.withValues(alpha: 0.15))
              : (isDark ? AppColors.darkSurface : AppColors.lightCardLight),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? (isWarning ? AppColors.priorityHigh : AppColors.accent)
                : (isDark ? AppColors.darkDivider : AppColors.lightDivider),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? (isWarning ? AppColors.priorityHigh : AppColors.accent)
                    : (isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected
                    ? (isWarning ? AppColors.priorityHigh.withValues(alpha: 0.2) : AppColors.accent.withValues(alpha: 0.2))
                    : (isDark ? AppColors.darkCard : AppColors.lightDivider),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  color: isSelected ? (isWarning ? AppColors.priorityHigh : AppColors.accent) : null,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
