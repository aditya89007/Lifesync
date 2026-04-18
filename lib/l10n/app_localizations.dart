import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('gu'),
    Locale('hi'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'LifeSync'**
  String get appTitle;

  /// No description provided for @tasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasks;

  /// No description provided for @habits.
  ///
  /// In en, this message translates to:
  /// **'Habits'**
  String get habits;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @focus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get focus;

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'Create New'**
  String get createNew;

  /// No description provided for @newTask.
  ///
  /// In en, this message translates to:
  /// **'New Task'**
  String get newTask;

  /// No description provided for @createAToDo.
  ///
  /// In en, this message translates to:
  /// **'Create a to-do'**
  String get createAToDo;

  /// No description provided for @newHabit.
  ///
  /// In en, this message translates to:
  /// **'New Habit'**
  String get newHabit;

  /// No description provided for @buildARoutine.
  ///
  /// In en, this message translates to:
  /// **'Build a routine'**
  String get buildARoutine;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodEvening;

  /// No description provided for @dailyProgress.
  ///
  /// In en, this message translates to:
  /// **'Daily Progress'**
  String get dailyProgress;

  /// No description provided for @addTasksToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add tasks & habits to get started!'**
  String get addTasksToGetStarted;

  /// No description provided for @allDoneForToday.
  ///
  /// In en, this message translates to:
  /// **'Amazing! All done for today! 🎉'**
  String get allDoneForToday;

  /// No description provided for @almostThere.
  ///
  /// In en, this message translates to:
  /// **'Almost there! {pending} left to go! 💪'**
  String almostThere(int pending);

  /// No description provided for @keepGoing.
  ///
  /// In en, this message translates to:
  /// **'Keep going! {completed} of {total} completed'**
  String keepGoing(int completed, int total);

  /// No description provided for @completedProgress.
  ///
  /// In en, this message translates to:
  /// **'completed'**
  String get completedProgress;

  /// No description provided for @streaks.
  ///
  /// In en, this message translates to:
  /// **'Streaks'**
  String get streaks;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @next7Days.
  ///
  /// In en, this message translates to:
  /// **'Next 7 days'**
  String get next7Days;

  /// No description provided for @todaysTasks.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Tasks'**
  String get todaysTasks;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'{count} remaining'**
  String remaining(int count);

  /// No description provided for @noTasksToday.
  ///
  /// In en, this message translates to:
  /// **'No tasks for today'**
  String get noTasksToday;

  /// No description provided for @noTasksForThisDate.
  ///
  /// In en, this message translates to:
  /// **'No tasks for this date'**
  String get noTasksForThisDate;

  /// No description provided for @tapToAddNewTask.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add a new task'**
  String get tapToAddNewTask;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @inDays.
  ///
  /// In en, this message translates to:
  /// **'In {days} days'**
  String inDays(int days);

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @pushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get pushNotifications;

  /// No description provided for @receiveDailyReminders.
  ///
  /// In en, this message translates to:
  /// **'Receive daily reminders'**
  String get receiveDailyReminders;

  /// No description provided for @reminderTime.
  ///
  /// In en, this message translates to:
  /// **'Reminder Time'**
  String get reminderTime;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @darkThemeActive.
  ///
  /// In en, this message translates to:
  /// **'Dark theme active'**
  String get darkThemeActive;

  /// No description provided for @lightThemeActive.
  ///
  /// In en, this message translates to:
  /// **'Light theme active'**
  String get lightThemeActive;

  /// No description provided for @dataAndAccount.
  ///
  /// In en, this message translates to:
  /// **'Data & Account'**
  String get dataAndAccount;

  /// No description provided for @syncData.
  ///
  /// In en, this message translates to:
  /// **'Sync Data'**
  String get syncData;

  /// No description provided for @syncedWithFirebaseCloud.
  ///
  /// In en, this message translates to:
  /// **'Synced with Firebase Cloud'**
  String get syncedWithFirebaseCloud;

  /// No description provided for @clearAllData.
  ///
  /// In en, this message translates to:
  /// **'Clear All Data'**
  String get clearAllData;

  /// No description provided for @deleteAllTasksAndHabits.
  ///
  /// In en, this message translates to:
  /// **'Delete all tasks and habits'**
  String get deleteAllTasksAndHabits;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @logOutOfYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Log out of your account'**
  String get logOutOfYourAccount;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @clearDataWarning.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete all your tasks and habits. This action cannot be undone.'**
  String get clearDataWarning;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @deleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get deleteAll;

  /// No description provided for @allDataClearedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'All data cleared successfully'**
  String get allDataClearedSuccessfully;

  /// No description provided for @failedToClearData.
  ///
  /// In en, this message translates to:
  /// **'Failed to clear data: {error}'**
  String failedToClearData(String error);

  /// No description provided for @areYouSureYouWantToSignOut.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get areYouSureYouWantToSignOut;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'{completed}/{total} done'**
  String done(int completed, int total);

  /// No description provided for @createSomethingAmazing.
  ///
  /// In en, this message translates to:
  /// **'Create something amazing'**
  String get createSomethingAmazing;

  /// No description provided for @secretOfGettingAhead.
  ///
  /// In en, this message translates to:
  /// **'\"The secret of getting ahead\\nis getting started.\"'**
  String get secretOfGettingAhead;

  /// No description provided for @taskTitle.
  ///
  /// In en, this message translates to:
  /// **'Task Title'**
  String get taskTitle;

  /// No description provided for @whatDoYouNeedToDo.
  ///
  /// In en, this message translates to:
  /// **'What do you need to do?'**
  String get whatDoYouNeedToDo;

  /// No description provided for @pleaseEnterTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a task title'**
  String get pleaseEnterTaskTitle;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @addSomeDetails.
  ///
  /// In en, this message translates to:
  /// **'Add some details (optional)'**
  String get addSomeDetails;

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get dueDate;

  /// No description provided for @priority.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get priority;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @createTask.
  ///
  /// In en, this message translates to:
  /// **'Create Task'**
  String get createTask;

  /// No description provided for @taskCreated.
  ///
  /// In en, this message translates to:
  /// **'Task created! 🎯'**
  String get taskCreated;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @addNewHabit.
  ///
  /// In en, this message translates to:
  /// **'Add New Habit'**
  String get addNewHabit;

  /// No description provided for @yourHabit.
  ///
  /// In en, this message translates to:
  /// **'Your Habit'**
  String get yourHabit;

  /// No description provided for @habitName.
  ///
  /// In en, this message translates to:
  /// **'Habit Name'**
  String get habitName;

  /// No description provided for @egDrinkWater.
  ///
  /// In en, this message translates to:
  /// **'e.g., Drink Water, Exercise'**
  String get egDrinkWater;

  /// No description provided for @pleaseEnterHabitName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a habit name'**
  String get pleaseEnterHabitName;

  /// No description provided for @chooseIcon.
  ///
  /// In en, this message translates to:
  /// **'Choose Icon'**
  String get chooseIcon;

  /// No description provided for @frequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get frequency;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @createHabit.
  ///
  /// In en, this message translates to:
  /// **'Create Habit'**
  String get createHabit;

  /// No description provided for @habitCreated.
  ///
  /// In en, this message translates to:
  /// **'Habit created! Start your streak! 🔥'**
  String get habitCreated;

  /// No description provided for @allTasks.
  ///
  /// In en, this message translates to:
  /// **'All Tasks'**
  String get allTasks;

  /// No description provided for @searchTasks.
  ///
  /// In en, this message translates to:
  /// **'Search tasks...'**
  String get searchTasks;

  /// No description provided for @allFilter.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilter;

  /// No description provided for @pendingFilter.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingFilter;

  /// No description provided for @doneFilter.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneFilter;

  /// No description provided for @noResultsFor.
  ///
  /// In en, this message translates to:
  /// **'No results for \"{query}\"'**
  String noResultsFor(String query);

  /// No description provided for @noCompletedTasksYet.
  ///
  /// In en, this message translates to:
  /// **'No completed tasks yet'**
  String get noCompletedTasksYet;

  /// No description provided for @noOverdueTasks.
  ///
  /// In en, this message translates to:
  /// **'No overdue tasks! 🎉'**
  String get noOverdueTasks;

  /// No description provided for @allCaughtUp.
  ///
  /// In en, this message translates to:
  /// **'All caught up! 🎉'**
  String get allCaughtUp;

  /// No description provided for @tryDifferentSearchTerm.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term'**
  String get tryDifferentSearchTerm;

  /// No description provided for @tapToCreateFirstTask.
  ///
  /// In en, this message translates to:
  /// **'Tap + to create your first task'**
  String get tapToCreateFirstTask;

  /// No description provided for @totalCount.
  ///
  /// In en, this message translates to:
  /// **'{length} total'**
  String totalCount(int length);

  /// No description provided for @activeLabel.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeLabel;

  /// No description provided for @doneTodayLabel.
  ///
  /// In en, this message translates to:
  /// **'Done Today'**
  String get doneTodayLabel;

  /// No description provided for @bestStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'Best Streak'**
  String get bestStreakLabel;

  /// No description provided for @noHabitsYet.
  ///
  /// In en, this message translates to:
  /// **'No habits yet'**
  String get noHabitsYet;

  /// No description provided for @startBuildingHabitsToday.
  ///
  /// In en, this message translates to:
  /// **'Start building positive habits today!'**
  String get startBuildingHabitsToday;

  /// No description provided for @focusTimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Focus Timer'**
  String get focusTimerTitle;

  /// No description provided for @breakLabel.
  ///
  /// In en, this message translates to:
  /// **'BREAK'**
  String get breakLabel;

  /// No description provided for @focusLabel.
  ///
  /// In en, this message translates to:
  /// **'FOCUS'**
  String get focusLabel;

  /// No description provided for @sessionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get sessionsLabel;

  /// No description provided for @focusTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Focus Time'**
  String get focusTimeLabel;

  /// No description provided for @goalLabel.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goalLabel;

  /// No description provided for @resetSessions.
  ///
  /// In en, this message translates to:
  /// **'Reset Sessions'**
  String get resetSessions;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'gu',
    'hi',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
