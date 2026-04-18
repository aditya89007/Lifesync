// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'LifeSync';

  @override
  String get tasks => 'Tasks';

  @override
  String get habits => 'Habits';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get home => 'Home';

  @override
  String get focus => 'Focus';

  @override
  String get createNew => 'Create New';

  @override
  String get newTask => 'New Task';

  @override
  String get createAToDo => 'Create a to-do';

  @override
  String get newHabit => 'New Habit';

  @override
  String get buildARoutine => 'Build a routine';

  @override
  String get goodMorning => 'Good Morning';

  @override
  String get goodAfternoon => 'Good Afternoon';

  @override
  String get goodEvening => 'Good Evening';

  @override
  String get dailyProgress => 'Daily Progress';

  @override
  String get addTasksToGetStarted => 'Add tasks & habits to get started!';

  @override
  String get allDoneForToday => 'Amazing! All done for today! 🎉';

  @override
  String almostThere(int pending) {
    return 'Almost there! $pending left to go! 💪';
  }

  @override
  String keepGoing(int completed, int total) {
    return 'Keep going! $completed of $total completed';
  }

  @override
  String get completedProgress => 'completed';

  @override
  String get streaks => 'Streaks';

  @override
  String get overdue => 'Overdue';

  @override
  String get upcoming => 'Upcoming';

  @override
  String get next7Days => 'Next 7 days';

  @override
  String get todaysTasks => 'Today\'s Tasks';

  @override
  String remaining(int count) {
    return '$count remaining';
  }

  @override
  String get noTasksToday => 'No tasks for today';

  @override
  String get noTasksForThisDate => 'No tasks for this date';

  @override
  String get tapToAddNewTask => 'Tap + to add a new task';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String inDays(int days) {
    return 'In $days days';
  }

  @override
  String get notifications => 'Notifications';

  @override
  String get pushNotifications => 'Push Notifications';

  @override
  String get receiveDailyReminders => 'Receive daily reminders';

  @override
  String get reminderTime => 'Reminder Time';

  @override
  String get appearance => 'Appearance';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get darkThemeActive => 'Dark theme active';

  @override
  String get lightThemeActive => 'Light theme active';

  @override
  String get dataAndAccount => 'Data & Account';

  @override
  String get syncData => 'Sync Data';

  @override
  String get syncedWithFirebaseCloud => 'Synced with Firebase Cloud';

  @override
  String get clearAllData => 'Clear All Data';

  @override
  String get deleteAllTasksAndHabits => 'Delete all tasks and habits';

  @override
  String get signOut => 'Sign Out';

  @override
  String get logOutOfYourAccount => 'Log out of your account';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get clearDataWarning =>
      'This will permanently delete all your tasks and habits. This action cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteAll => 'Delete All';

  @override
  String get allDataClearedSuccessfully => 'All data cleared successfully';

  @override
  String failedToClearData(String error) {
    return 'Failed to clear data: $error';
  }

  @override
  String get areYouSureYouWantToSignOut => 'Are you sure you want to sign out?';

  @override
  String done(int completed, int total) {
    return '$completed/$total done';
  }

  @override
  String get createSomethingAmazing => 'Create something amazing';

  @override
  String get secretOfGettingAhead =>
      '\"The secret of getting ahead\\nis getting started.\"';

  @override
  String get taskTitle => 'Task Title';

  @override
  String get whatDoYouNeedToDo => 'What do you need to do?';

  @override
  String get pleaseEnterTaskTitle => 'Please enter a task title';

  @override
  String get description => 'Description';

  @override
  String get addSomeDetails => 'Add some details (optional)';

  @override
  String get dueDate => 'Due Date';

  @override
  String get priority => 'Priority';

  @override
  String get category => 'Category';

  @override
  String get createTask => 'Create Task';

  @override
  String get taskCreated => 'Task created! 🎯';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get personal => 'Personal';

  @override
  String get work => 'Work';

  @override
  String get health => 'Health';

  @override
  String get education => 'Education';

  @override
  String get other => 'Other';

  @override
  String get addNewHabit => 'Add New Habit';

  @override
  String get yourHabit => 'Your Habit';

  @override
  String get habitName => 'Habit Name';

  @override
  String get egDrinkWater => 'e.g., Drink Water, Exercise';

  @override
  String get pleaseEnterHabitName => 'Please enter a habit name';

  @override
  String get chooseIcon => 'Choose Icon';

  @override
  String get frequency => 'Frequency';

  @override
  String get daily => 'Daily';

  @override
  String get weekly => 'Weekly';

  @override
  String get custom => 'Custom';

  @override
  String get color => 'Color';

  @override
  String get createHabit => 'Create Habit';

  @override
  String get habitCreated => 'Habit created! Start your streak! 🔥';

  @override
  String get allTasks => 'All Tasks';

  @override
  String get searchTasks => 'Search tasks...';

  @override
  String get allFilter => 'All';

  @override
  String get pendingFilter => 'Pending';

  @override
  String get doneFilter => 'Done';

  @override
  String noResultsFor(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String get noCompletedTasksYet => 'No completed tasks yet';

  @override
  String get noOverdueTasks => 'No overdue tasks! 🎉';

  @override
  String get allCaughtUp => 'All caught up! 🎉';

  @override
  String get tryDifferentSearchTerm => 'Try a different search term';

  @override
  String get tapToCreateFirstTask => 'Tap + to create your first task';

  @override
  String totalCount(int length) {
    return '$length total';
  }

  @override
  String get activeLabel => 'Active';

  @override
  String get doneTodayLabel => 'Done Today';

  @override
  String get bestStreakLabel => 'Best Streak';

  @override
  String get noHabitsYet => 'No habits yet';

  @override
  String get startBuildingHabitsToday =>
      'Start building positive habits today!';

  @override
  String get focusTimerTitle => 'Focus Timer';

  @override
  String get breakLabel => 'BREAK';

  @override
  String get focusLabel => 'FOCUS';

  @override
  String get sessionsLabel => 'Sessions';

  @override
  String get focusTimeLabel => 'Focus Time';

  @override
  String get goalLabel => 'Goal';

  @override
  String get resetSessions => 'Reset Sessions';
}
