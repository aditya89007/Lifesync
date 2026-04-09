import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/auth_provider.dart';
import '../services/notification_service.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import 'login_screen.dart';
import 'privacy_policy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Consumer2<ThemeProvider, AuthProvider>(
      builder: (context, themeProvider, authProvider, _) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text(
                      'Settings',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),

                // Profile Card
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: GlassCard(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.accent,
                                  AppColors.accentLight,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                authProvider.initials,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  authProvider.displayName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  authProvider.email,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Notifications Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                    child: Text(
                      'Notifications',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GlassCard(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                          _SettingsTile(
                            icon: Icons.notifications_outlined,
                            title: 'Push Notifications',
                            subtitle: 'Receive daily reminders',
                            trailing: Switch(
                              value: themeProvider.notificationsEnabled,
                              onChanged: (val) {
                                themeProvider.setNotificationsEnabled(val);
                                if (val) {
                                  NotificationService().scheduleDailyReminder(
                                    hour: themeProvider.reminderHour,
                                    minute: themeProvider.reminderMinute,
                                  );
                                } else {
                                  NotificationService()
                                      .cancelAllNotifications();
                                }
                              },
                            ),
                          ),
                          Divider(
                            height: 1,
                            indent: 56,
                            color: isDark
                                ? AppColors.darkDivider
                                : AppColors.lightDivider,
                          ),
                          _SettingsTile(
                            icon: Icons.access_time_outlined,
                            title: 'Reminder Time',
                            subtitle: themeProvider.reminderTimeFormatted,
                            trailing: Icon(
                              Icons.chevron_right,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                            onTap: () => _pickReminderTime(
                                context, themeProvider),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                // Appearance Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                    child: Text(
                      'Appearance',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GlassCard(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                          _SettingsTile(
                            icon: Icons.dark_mode_outlined,
                            title: 'Dark Mode',
                            subtitle: themeProvider.isDarkMode
                                ? 'Dark theme active'
                                : 'Light theme active',
                            trailing: Switch(
                              value: themeProvider.isDarkMode,
                              onChanged: (_) => themeProvider.toggleTheme(),
                            ),
                          ),
                          Divider(
                            height: 1,
                            indent: 56,
                            color: isDark
                                ? AppColors.darkDivider
                                : AppColors.lightDivider,
                          ),
                          _SettingsTile(
                            icon: Icons.language_outlined,
                            title: 'Language',
                            subtitle: 'English (Default)',
                            trailing: Icon(
                              Icons.chevron_right,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'English is the default language. Support for more languages coming soon!'),
                                  backgroundColor: AppColors.accent,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Data Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                    child: Text(
                      'Data & Account',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GlassCard(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                          _SettingsTile(
                            icon: Icons.cloud_sync_outlined,
                            title: 'Sync Data',
                            subtitle: 'Synced with Firebase Cloud',
                            trailing: const Icon(
                              Icons.check_circle,
                              color: AppColors.priorityLow,
                              size: 22,
                            ),
                          ),
                          Divider(
                            height: 1,
                            indent: 56,
                            color: isDark
                                ? AppColors.darkDivider
                                : AppColors.lightDivider,
                          ),
                          _SettingsTile(
                            icon: Icons.delete_outline,
                            title: 'Clear All Data',
                            subtitle: 'Delete all tasks and habits',
                            iconColor: AppColors.priorityHigh,
                            titleColor: AppColors.priorityHigh,
                            onTap: () => _showClearDataDialog(context),
                          ),
                          Divider(
                            height: 1,
                            indent: 56,
                            color: isDark
                                ? AppColors.darkDivider
                                : AppColors.lightDivider,
                          ),
                          _SettingsTile(
                            icon: Icons.logout,
                            title: 'Sign Out',
                            subtitle: 'Log out of your account',
                            iconColor: AppColors.priorityMedium,
                            onTap: () => _showLogoutDialog(context, authProvider),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // About Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                    child: Text(
                      'About',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GlassCard(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                          _SettingsTile(
                            icon: Icons.info_outline,
                            title: 'Version',
                            subtitle: '1.0.0 (Build 1)',
                            trailing: Icon(
                              Icons.chevron_right,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                          ),
                          Divider(
                            height: 1,
                            indent: 56,
                            color: isDark
                                ? AppColors.darkDivider
                                : AppColors.lightDivider,
                          ),
                          _SettingsTile(
                            icon: Icons.lock_outline,
                            title: 'Privacy Policy',
                            trailing: Icon(
                              Icons.chevron_right,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicyScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Footer
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          'LifeSync',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.accent,
                                  ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '© 2026 LifeSync',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickReminderTime(
      BuildContext context, ThemeProvider themeProvider) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: themeProvider.reminderHour,
        minute: themeProvider.reminderMinute,
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.accent,
                ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      await themeProvider.setReminderTime(picked.hour, picked.minute);
      if (themeProvider.notificationsEnabled) {
        await NotificationService().scheduleDailyReminder(
          hour: picked.hour,
          minute: picked.minute,
        );
      }
    }
  }

  void _showClearDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkCard
            : AppColors.lightCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber, color: AppColors.priorityHigh),
            SizedBox(width: 8),
            Text('Clear All Data'),
          ],
        ),
        content: const Text(
          'This will permanently delete all your tasks and habits. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context); // Dismiss dialog immediately
              
              try {
                await FirestoreService().clearAllData();
                await NotificationService().cancelAllNotifications();
                
                if (context.mounted) {
                  // Re-enable daily reminder if it was active
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  if (themeProvider.notificationsEnabled) {
                    await NotificationService().scheduleDailyReminder(
                      hour: themeProvider.reminderHour,
                      minute: themeProvider.reminderMinute,
                    );
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All data cleared successfully'),
                      backgroundColor: AppColors.priorityHigh,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to clear data: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.priorityHigh,
            ),
            child: const Text('Delete All', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthProvider authProvider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkCard
            : AppColors.lightCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await authProvider.signOut();
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.priorityMedium,
            ),
            child: const Text('Sign Out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? titleColor;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final effectiveIconColor = iconColor ?? AppColors.accent;
    final effectiveTitleColor = titleColor;

    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: effectiveIconColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: effectiveIconColor,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: effectiveTitleColor ??
                  (isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary),
              fontSize: 15,
            ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall,
            )
          : null,
      trailing: trailing,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    );
  }
}
