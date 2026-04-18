// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'LifeSync';

  @override
  String get tasks => 'Aufgaben';

  @override
  String get habits => 'Gewohnheiten';

  @override
  String get settings => 'Einstellungen';

  @override
  String get language => 'Sprache';

  @override
  String get home => 'Home';

  @override
  String get focus => 'Fokus';

  @override
  String get createNew => 'Neu Erstellen';

  @override
  String get newTask => 'Neue Aufgabe';

  @override
  String get createAToDo => 'To-Do erstellen';

  @override
  String get newHabit => 'Neue Gewohnheit';

  @override
  String get buildARoutine => 'Eine Routine aufbauen';

  @override
  String get goodMorning => 'Guten Morgen';

  @override
  String get goodAfternoon => 'Guten Tag';

  @override
  String get goodEvening => 'Guten Abend';

  @override
  String get dailyProgress => 'Täglicher Fortschritt';

  @override
  String get addTasksToGetStarted => 'Füge Aufgaben hinzu, um zu beginnen!';

  @override
  String get allDoneForToday => 'Fantastisch! Alles erledigt für heute! 🎉';

  @override
  String almostThere(int pending) {
    return 'Fast geschafft! Noch $pending übrig! 💪';
  }

  @override
  String keepGoing(int completed, int total) {
    return 'Weiter so! $completed von $total erledigt';
  }

  @override
  String get completedProgress => 'abgeschlossen';

  @override
  String get streaks => 'Serien';

  @override
  String get overdue => 'Überfällig';

  @override
  String get upcoming => 'Anstehend';

  @override
  String get next7Days => 'Nächste 7 Tage';

  @override
  String get todaysTasks => 'Heutige Aufgaben';

  @override
  String remaining(int count) {
    return '$count verbleibend';
  }

  @override
  String get noTasksToday => 'Keine Aufgaben für heute';

  @override
  String get noTasksForThisDate => 'Keine Aufgaben für dieses Datum';

  @override
  String get tapToAddNewTask => 'Tippe auf +, um eine Aufgabe hinzuzufügen';

  @override
  String get tomorrow => 'Morgen';

  @override
  String inDays(int days) {
    return 'In $days Tagen';
  }

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get pushNotifications => 'Push-Benachrichtigungen';

  @override
  String get receiveDailyReminders => 'Tägliche Erinnerungen erhalten';

  @override
  String get reminderTime => 'Erinnerungszeit';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get darkMode => 'Dunkelmodus';

  @override
  String get darkThemeActive => 'Dunkles Design aktiv';

  @override
  String get lightThemeActive => 'Helles Design aktiv';

  @override
  String get dataAndAccount => 'Daten & Konto';

  @override
  String get syncData => 'Daten Synchronisieren';

  @override
  String get syncedWithFirebaseCloud => 'Mit Firebase Cloud synchronisiert';

  @override
  String get clearAllData => 'Alle Daten Löschen';

  @override
  String get deleteAllTasksAndHabits =>
      'Alle Aufgaben und Gewohnheiten löschen';

  @override
  String get signOut => 'Abmelden';

  @override
  String get logOutOfYourAccount => 'Melde dich von deinem Konto ab';

  @override
  String get about => 'Über';

  @override
  String get version => 'Version';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get selectLanguage => 'Sprache Auswählen';

  @override
  String get clearDataWarning =>
      'Dies löscht all deine Aufgaben und Gewohnheiten dauerhaft. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get deleteAll => 'Alles Löschen';

  @override
  String get allDataClearedSuccessfully =>
      'Alle Daten wurden erfolgreich gelöscht';

  @override
  String failedToClearData(String error) {
    return 'Fehler beim Löschen: $error';
  }

  @override
  String get areYouSureYouWantToSignOut =>
      'Möchtest du dich wirklich abmelden?';

  @override
  String done(int completed, int total) {
    return '$completed/$total erledigt';
  }

  @override
  String get createSomethingAmazing => 'Erschaffe etwas Großartiges';

  @override
  String get secretOfGettingAhead =>
      '\"Das Geheimnis des Vorankommens\\nist anzufangen.\"';

  @override
  String get taskTitle => 'Aufgabentitel';

  @override
  String get whatDoYouNeedToDo => 'Was musst du tun?';

  @override
  String get pleaseEnterTaskTitle => 'Bitte gib einen Aufgabentitel ein';

  @override
  String get description => 'Beschreibung';

  @override
  String get addSomeDetails => 'Füge Details hinzu (optional)';

  @override
  String get dueDate => 'Fälligkeitsdatum';

  @override
  String get priority => 'Priorität';

  @override
  String get category => 'Kategorie';

  @override
  String get createTask => 'Aufgabe Erstellen';

  @override
  String get taskCreated => 'Aufgabe erstellt! 🎯';

  @override
  String get low => 'Niedrig';

  @override
  String get medium => 'Mittel';

  @override
  String get high => 'Hoch';

  @override
  String get personal => 'Persönlich';

  @override
  String get work => 'Arbeit';

  @override
  String get health => 'Gesundheit';

  @override
  String get education => 'Bildung';

  @override
  String get other => 'Andere';

  @override
  String get addNewHabit => 'Neue Gewohnheit Hinzufügen';

  @override
  String get yourHabit => 'Deine Gewohnheit';

  @override
  String get habitName => 'Name der Gewohnheit';

  @override
  String get egDrinkWater => 'z.B., Wasser trinken, Sport';

  @override
  String get pleaseEnterHabitName => 'Bitte gib einen Namen ein';

  @override
  String get chooseIcon => 'Symbol Auswählen';

  @override
  String get frequency => 'Häufigkeit';

  @override
  String get daily => 'Täglich';

  @override
  String get weekly => 'Wöchentlich';

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get color => 'Farbe';

  @override
  String get createHabit => 'Gewohnheit Erstellen';

  @override
  String get habitCreated => 'Gewohnheit erstellt! Beginne deine Serie! 🔥';

  @override
  String get allTasks => 'Alle Aufgaben';

  @override
  String get searchTasks => 'Aufgaben suchen...';

  @override
  String get allFilter => 'Alle';

  @override
  String get pendingFilter => 'Ausstehend';

  @override
  String get doneFilter => 'Erledigt';

  @override
  String noResultsFor(String query) {
    return 'Keine Ergebnisse für \"$query\"';
  }

  @override
  String get noCompletedTasksYet => 'Noch keine erledigten Aufgaben';

  @override
  String get noOverdueTasks => 'Keine überfälligen Aufgaben! 🎉';

  @override
  String get allCaughtUp => 'Alles erledigt! 🎉';

  @override
  String get tryDifferentSearchTerm => 'Versuche einen anderen Suchbegriff';

  @override
  String get tapToCreateFirstTask =>
      'Tippe auf +, um deine 1. Aufgabe zu erstellen';

  @override
  String totalCount(int length) {
    return '$length insgesamt';
  }

  @override
  String get activeLabel => 'Aktiv';

  @override
  String get doneTodayLabel => 'Heute Erledigt';

  @override
  String get bestStreakLabel => 'Beste Serie';

  @override
  String get noHabitsYet => 'Noch keine Gewohnheiten';

  @override
  String get startBuildingHabitsToday =>
      'Beginne heute damit, Gewohnheiten aufzubauen!';

  @override
  String get focusTimerTitle => 'Fokus Timer';

  @override
  String get breakLabel => 'PAUSE';

  @override
  String get focusLabel => 'FOKUS';

  @override
  String get sessionsLabel => 'Sitzungen';

  @override
  String get focusTimeLabel => 'Fokus-Zeit';

  @override
  String get goalLabel => 'Ziel';

  @override
  String get resetSessions => 'Sitzungen Zurücksetzen';
}
