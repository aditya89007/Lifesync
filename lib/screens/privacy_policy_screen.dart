import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkCard : AppColors.lightCard,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDark 
                                ? AppColors.darkDivider 
                                : AppColors.lightDivider,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GlassCard(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeadline(context, '1. Data Collection & Usage'),
                      _buildBodyText(context, 'Account Information: Email address, Name, and Profile Picture if collected via Google Sign-In or manual sign up.\n\nApp Data: Tasks, Habits, streaks, and schedules are synced securely to Firebase Firestore.\n\nUsage Data: Basic device information and crash logs may be collected to improve app stability.'),
                      const SizedBox(height: 24),
                      
                      _buildSectionHeadline(context, '2. Third-Party Services'),
                      _buildBodyText(context, 'LifeSync integrates with trusted third-party providers including Firebase Authentication and Cloud Firestore for handling user logins securely and storing data.'),
                      const SizedBox(height: 24),

                      _buildSectionHeadline(context, '3. Device Permissions'),
                      _buildBodyText(context, 'The app requests notification and alarm permissions to schedule local reminders for your habits and tasks. These notifications are processed locally on your device.'),
                      const SizedBox(height: 24),

                      _buildSectionHeadline(context, '4. Data Security & Retention'),
                      _buildBodyText(context, 'We use industry-standard security measures. Data is encrypted in transit and at rest using Firebase infrastructure. Your data is retained as long as your account is active.'),
                      const SizedBox(height: 24),

                      _buildSectionHeadline(context, '5. User Rights & Data Deletion'),
                      _buildBodyText(context, 'You have the right to request the deletion of your account and all associated habit/task data. You can clear all data directly from the Settings screen or contact support for full account deletion.'),
                      const SizedBox(height: 32),

                      Center(
                        child: Text(
                          'Last updated: April 2026',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 60)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeadline(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.accent,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBodyText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        height: 1.5,
      ),
    );
  }
}
