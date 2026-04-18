import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/auth_provider.dart';
import '../services/notification_service.dart';
import '../services/firestore_service.dart';
import '../providers/language_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import 'login_screen.dart';
import 'privacy_policy_screen.dart';
import 'package:lifesync/l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final languageProvider = Provider.of<LanguageProvider>(context);

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
                      AppLocalizations.of(context)!.settings,
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
                      AppLocalizations.of(context)!.notifications,
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
                            title: AppLocalizations.of(context)!.pushNotifications,
                            subtitle: AppLocalizations.of(context)!.receiveDailyReminders,
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
                            title: AppLocalizations.of(context)!.reminderTime,
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
                      AppLocalizations.of(context)!.appearance,
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
                            title: AppLocalizations.of(context)!.darkMode,
                            subtitle: themeProvider.isDarkMode
                                ? AppLocalizations.of(context)!.darkThemeActive
                                : AppLocalizations.of(context)!.lightThemeActive,
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
                            title: AppLocalizations.of(context)!.language,
                            subtitle: _getLanguageName(languageProvider.currentLocale.languageCode),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                            onTap: () => _showLanguageDialog(context, languageProvider),
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
                      AppLocalizations.of(context)!.dataAndAccount,
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
                            title: AppLocalizations.of(context)!.syncData,
                            subtitle: AppLocalizations.of(context)!.syncedWithFirebaseCloud,
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
                            title: AppLocalizations.of(context)!.clearAllData,
                            subtitle: AppLocalizations.of(context)!.deleteAllTasksAndHabits,
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
                            title: AppLocalizations.of(context)!.signOut,
                            subtitle: AppLocalizations.of(context)!.logOutOfYourAccount,
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
                      AppLocalizations.of(context)!.about,
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
                            title: AppLocalizations.of(context)!.version,
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
                            icon: Icons.code_rounded,
                            title: 'Developed By',
                            trailing: Icon(
                              Icons.chevron_right,
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  insetPadding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    elevation: 8,
                                    color: isDark ? AppColors.darkCard : AppColors.lightCard,
                                    child: Padding(
                                      padding: const EdgeInsets.all(28.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.accent,
                                                  AppColors.accentLight,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.code,
                                              size: 40,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            'DEVELOPED BY',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.accent,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2.0,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            'Adityaraj Chudasama',
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w800,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            'B.Tech Computer Engineering',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: isDark
                                                  ? AppColors.darkTextSecondary
                                                  : AppColors.lightTextSecondary,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 32),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 48,
                                            child: ElevatedButton(
                                              onPressed: () => Navigator.pop(context),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors.accent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(14),
                                                ),
                                                elevation: 0,
                                              ),
                                              child: const Text(
                                                'Cool!',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
                            title: AppLocalizations.of(context)!.privacyPolicy,
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

  String _getLanguageName(String code) {
    switch (code) {
      case 'es': return 'Español';
      case 'hi': return 'हिन्दी';
      case 'fr': return 'Français';
      case 'de': return 'Deutsch';
      case 'gu': return 'ગુજરાતી';
      default: return 'English';
    }
  }

  void _showLanguageDialog(BuildContext context, LanguageProvider languageProvider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkCard
            : AppColors.lightCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(AppLocalizations.of(context)!.selectLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('English'),
              trailing: languageProvider.currentLocale.languageCode == 'en' ? const Icon(Icons.check, color: AppColors.accent) : null,
              onTap: () {
                languageProvider.setLanguage('en');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Español'),
              trailing: languageProvider.currentLocale.languageCode == 'es' ? const Icon(Icons.check, color: AppColors.accent) : null,
              onTap: () {
                languageProvider.setLanguage('es');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('हिन्दी (Hindi)'),
              trailing: languageProvider.currentLocale.languageCode == 'hi' ? const Icon(Icons.check, color: AppColors.accent) : null,
              onTap: () {
                languageProvider.setLanguage('hi');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Français'),
              trailing: languageProvider.currentLocale.languageCode == 'fr' ? const Icon(Icons.check, color: AppColors.accent) : null,
              onTap: () {
                languageProvider.setLanguage('fr');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Deutsch'),
              trailing: languageProvider.currentLocale.languageCode == 'de' ? const Icon(Icons.check, color: AppColors.accent) : null,
              onTap: () {
                languageProvider.setLanguage('de');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('ગુજરાતી (Gujarati)'),
              trailing: languageProvider.currentLocale.languageCode == 'gu' ? const Icon(Icons.check, color: AppColors.accent) : null,
              onTap: () {
                languageProvider.setLanguage('gu');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
        title: Row(
          children: [
            const Icon(Icons.warning_amber, color: AppColors.priorityHigh),
            const SizedBox(width: 8),
            Text(AppLocalizations.of(context)!.clearAllData),
          ],
        ),
        content: Text(
          AppLocalizations.of(context)!.clearDataWarning,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
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
                    SnackBar(
                      content: Text(AppLocalizations.of(context)!.allDataClearedSuccessfully),
                      backgroundColor: AppColors.priorityHigh,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context)!.failedToClearData(e.toString())),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.priorityHigh,
            ),
            child: Text(AppLocalizations.of(context)!.deleteAll, style: const TextStyle(color: Colors.white)),
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
        title: Text(AppLocalizations.of(context)!.signOut),
        content: Text(AppLocalizations.of(context)!.areYouSureYouWantToSignOut),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
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
            child: Text(AppLocalizations.of(context)!.signOut, style: const TextStyle(color: Colors.white)),
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
