// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'LifeSync';

  @override
  String get tasks => 'કાર્યો';

  @override
  String get habits => 'આદતો';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get language => 'ભાષા';

  @override
  String get home => 'હોમ';

  @override
  String get focus => 'ફોર્કસ';

  @override
  String get createNew => 'નવું બનાવો';

  @override
  String get newTask => 'નવું કાર્ય';

  @override
  String get createAToDo => 'એક ટુ-ડૂ બનાવો';

  @override
  String get newHabit => 'નવી આદત';

  @override
  String get buildARoutine => 'એક રૂટીન બનાવો';

  @override
  String get goodMorning => 'શુભ સવાર';

  @override
  String get goodAfternoon => 'શુભ બપોર';

  @override
  String get goodEvening => 'શુભ સાંજ';

  @override
  String get dailyProgress => 'દૈનિક પ્રગતિ';

  @override
  String get addTasksToGetStarted => 'શરૂ કરવા માટે કાર્યો ઉમેરો!';

  @override
  String get allDoneForToday => 'અદ્ભુત! આજનું બધું પૂરું! 🎉';

  @override
  String almostThere(int pending) {
    return 'લગભગ ત્યાં! $pending બાકી! 💪';
  }

  @override
  String keepGoing(int completed, int total) {
    return 'ચાલુ રાખો! $total માંથી $completed પૂર્ણ';
  }

  @override
  String get completedProgress => 'પૂર્ણ';

  @override
  String get streaks => 'સ્ટ્રીક્સ';

  @override
  String get overdue => 'બાકી છે';

  @override
  String get upcoming => 'આગામી';

  @override
  String get next7Days => 'આગળના 7 દિવસ';

  @override
  String get todaysTasks => 'આજના કાર્યો';

  @override
  String remaining(int count) {
    return '$count બાકી';
  }

  @override
  String get noTasksToday => 'આજે કોઈ કાર્યો નથી';

  @override
  String get noTasksForThisDate => 'આ તારીખ માટે કોઈ કાર્યો નથી';

  @override
  String get tapToAddNewTask => 'નવું કાર્ય ઉમેરવા માટે + ટેપ કરો';

  @override
  String get tomorrow => 'આવતીકાલે';

  @override
  String inDays(int days) {
    return '$days દિવસોમાં';
  }

  @override
  String get notifications => 'સૂચનાઓ';

  @override
  String get pushNotifications => 'પુશ સૂચનાઓ';

  @override
  String get receiveDailyReminders => 'દૈનિક રિમાઇન્ડર્સ મેળવો';

  @override
  String get reminderTime => 'રિમાઇન્ડરનો સમય';

  @override
  String get appearance => 'દેખાવ';

  @override
  String get darkMode => 'ડાર્ક મોડ';

  @override
  String get darkThemeActive => 'ડાર્ક થીમ સક્રિય';

  @override
  String get lightThemeActive => 'લાઇટ થીમ સક્રિય';

  @override
  String get dataAndAccount => 'ડેટા અને એકાઉન્ટ';

  @override
  String get syncData => 'ડેટા સિંક કરો';

  @override
  String get syncedWithFirebaseCloud => 'ક્લાઉડ સાથે સિંક કર્યું';

  @override
  String get clearAllData => 'બધો ડેટા સાફ કરો';

  @override
  String get deleteAllTasksAndHabits => 'બધા કાર્યો અને આદતો કાઢી નાખો';

  @override
  String get signOut => 'સાઇન આઉટ';

  @override
  String get logOutOfYourAccount => 'તમારા એકાઉન્ટમાંથી લોગ આઉટ કરો';

  @override
  String get about => 'વિશે';

  @override
  String get version => 'સંસ્કરણ';

  @override
  String get privacyPolicy => 'ગોપનીયતા નીતિ';

  @override
  String get selectLanguage => 'ભાષા પસંદ કરો';

  @override
  String get clearDataWarning =>
      'આ તમારા બધા કાર્યો કાયમી ધોરણે કાઢી નાખશે. આ ક્રિયા પાછી ખેંચી શકાતી નથી.';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get deleteAll => 'બધું કાઢી નાખો';

  @override
  String get allDataClearedSuccessfully =>
      'બધો ડેટા સફળતાપૂર્વક સાફ કરવામાં આવ્યો છે';

  @override
  String failedToClearData(String error) {
    return 'ડેટા સાફ કરવામાં નિષ્ફળ: $error';
  }

  @override
  String get areYouSureYouWantToSignOut =>
      'શું તમે ખરેખર સાઇન આઉટ કરવા માંગો છો?';

  @override
  String done(int completed, int total) {
    return '$completed/$total પૂર્ણ';
  }

  @override
  String get createSomethingAmazing => 'કંઈક અદ્ભુત બનાવો';

  @override
  String get secretOfGettingAhead => '\"આગળ વધવાનું રહસ્ય\\nશરૂ કરવાનું છે.\"';

  @override
  String get taskTitle => 'કાર્યનું શીર્ષક';

  @override
  String get whatDoYouNeedToDo => 'તમારે શું કરવાનું છે?';

  @override
  String get pleaseEnterTaskTitle => 'કૃપા કરીને શીર્ષક દાખલ કરો';

  @override
  String get description => 'વિગત';

  @override
  String get addSomeDetails => 'કેટલીક વિગતો ઉમેરો (વૈકલ્પિક)';

  @override
  String get dueDate => 'નિયત તારીખ';

  @override
  String get priority => 'પ્રાથમિકતા';

  @override
  String get category => 'શ્રેણી';

  @override
  String get createTask => 'કાર્ય બનાવો';

  @override
  String get taskCreated => 'કાર્ય બનાવ્યું! 🎯';

  @override
  String get low => 'ઓછું';

  @override
  String get medium => 'મધ્યમ';

  @override
  String get high => 'વધુ';

  @override
  String get personal => 'વ્યક્તિગત';

  @override
  String get work => 'કામ';

  @override
  String get health => 'સ્વાસ્થ્ય';

  @override
  String get education => 'શિક્ષણ';

  @override
  String get other => 'અન્ય';

  @override
  String get addNewHabit => 'નવી આદત ઉમેરો';

  @override
  String get yourHabit => 'તમારી આદત';

  @override
  String get habitName => 'આદતનું નામ';

  @override
  String get egDrinkWater => 'દા.ત. પાણી પીવો';

  @override
  String get pleaseEnterHabitName => 'કૃપા કરીને આદતનું નામ દાખલ કરો';

  @override
  String get chooseIcon => 'આઇકન પસંદ કરો';

  @override
  String get frequency => 'આવર્તન';

  @override
  String get daily => 'દૈનિક';

  @override
  String get weekly => 'સાપ્તાહિક';

  @override
  String get custom => 'કસ્ટમ';

  @override
  String get color => 'રંગ';

  @override
  String get createHabit => 'આદત બનાવો';

  @override
  String get habitCreated => 'આદત બની ગઈ! તમારી લકીર શરૂ કરો! 🔥';

  @override
  String get allTasks => 'બધા કાર્યો';

  @override
  String get searchTasks => 'કાર્યો શોધો...';

  @override
  String get allFilter => 'બધા';

  @override
  String get pendingFilter => 'બાકી';

  @override
  String get doneFilter => 'પૂર્ણ';

  @override
  String noResultsFor(String query) {
    return '\"$query\" માટે કોઈ પરિણામો નથી';
  }

  @override
  String get noCompletedTasksYet => 'હજુ સુધી કોઈ પૂર્ણ કાર્યો નથી';

  @override
  String get noOverdueTasks => 'કોઈ બાકી કાર્યો નથી! 🎉';

  @override
  String get allCaughtUp => 'બધા કાર્યો પૂર્ણ! 🎉';

  @override
  String get tryDifferentSearchTerm => 'અન્ય શોધ શબ્દ અજમાવો';

  @override
  String get tapToCreateFirstTask =>
      'તમારું પહેલું કાર્ય બનાવવા માટે + ટેપ કરો';

  @override
  String totalCount(int length) {
    return 'કુલ $length';
  }

  @override
  String get activeLabel => 'સક્રિય';

  @override
  String get doneTodayLabel => 'આજે પૂર્ણ';

  @override
  String get bestStreakLabel => 'શ્રેષ્ઠ સ્ટ્રીક';

  @override
  String get noHabitsYet => 'હજુ કોઈ આદતો નથી';

  @override
  String get startBuildingHabitsToday =>
      'આજે જ હકારાત્મક આદતો બનાવવાનું શરૂ કરો!';

  @override
  String get focusTimerTitle => 'ફોર્કસ ટાઈમર';

  @override
  String get breakLabel => 'વિરામ';

  @override
  String get focusLabel => 'ફોર્કસ';

  @override
  String get sessionsLabel => 'સત્રો';

  @override
  String get focusTimeLabel => 'ફોર્કસનો સમય';

  @override
  String get goalLabel => 'લક્ષ્ય';

  @override
  String get resetSessions => 'સત્રો રીસેટ કરો';
}
