// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'LifeSync';

  @override
  String get tasks => 'कार्य';

  @override
  String get habits => 'आदतें';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get language => 'भाषा';

  @override
  String get home => 'होम';

  @override
  String get focus => 'फोकस';

  @override
  String get createNew => 'नया बनाएं';

  @override
  String get newTask => 'नया कार्य';

  @override
  String get createAToDo => 'एक टू-डू बनाएं';

  @override
  String get newHabit => 'नई आदत';

  @override
  String get buildARoutine => 'रूटीन बनाएं';

  @override
  String get goodMorning => 'शुभ प्रभात';

  @override
  String get goodAfternoon => 'शुभ दोपहर';

  @override
  String get goodEvening => 'शुभ संध्या';

  @override
  String get dailyProgress => 'आज की प्रगति';

  @override
  String get addTasksToGetStarted => 'शुरू करने के लिए कार्य जोड़ें!';

  @override
  String get allDoneForToday => 'अद्भुत! आज के लिए सब हो गया! 🎉';

  @override
  String almostThere(int pending) {
    return 'लगभग वहाँ! $pending बाकी! 💪';
  }

  @override
  String keepGoing(int completed, int total) {
    return 'चलते रहो! $total में से $completed';
  }

  @override
  String get completedProgress => 'पूर्ण';

  @override
  String get streaks => 'स्ट्रीक्स';

  @override
  String get overdue => 'बाकी';

  @override
  String get upcoming => 'आगे';

  @override
  String get next7Days => 'अगले 7 दिन';

  @override
  String get todaysTasks => 'आज के कार्य';

  @override
  String remaining(int count) {
    return '$count बाकी';
  }

  @override
  String get noTasksToday => 'आज के लिए कोई कार्य नहीं';

  @override
  String get noTasksForThisDate => 'इस तिथि के लिए कोई कार्य नहीं';

  @override
  String get tapToAddNewTask => 'नया कार्य जोड़ने के लिए + टैप करें';

  @override
  String get tomorrow => 'कल';

  @override
  String inDays(int days) {
    return '$days दिनों में';
  }

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get pushNotifications => 'पुश सूचनाएं';

  @override
  String get receiveDailyReminders => 'दैनिक अनुस्मारक प्राप्त करें';

  @override
  String get reminderTime => 'अनुस्मारक समय';

  @override
  String get appearance => 'दिखावट';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get darkThemeActive => 'डार्क थीम सक्रिय';

  @override
  String get lightThemeActive => 'लाइट थीम सक्रिय';

  @override
  String get dataAndAccount => 'डेटा और खाता';

  @override
  String get syncData => 'सिंक डेटा';

  @override
  String get syncedWithFirebaseCloud => 'क्लाउड के साथ सिंक किया गया';

  @override
  String get clearAllData => 'सभी डेटा साफ़ करें';

  @override
  String get deleteAllTasksAndHabits => 'सभी कार्य और आदतें हटाएं';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get logOutOfYourAccount => 'खाते से लॉग आउट करें';

  @override
  String get about => 'के बारे में';

  @override
  String get version => 'संस्करण';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get clearDataWarning =>
      'यह आपके सभी कार्यों को स्थायी रूप से हटा देगा। यह क्रिया वापस नहीं की जा सकती।';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get deleteAll => 'सभी हटाएं';

  @override
  String get allDataClearedSuccessfully => 'सभी डेटा सफलतापूर्वक साफ़ किया गया';

  @override
  String failedToClearData(String error) {
    return 'डेटा साफ़ करने में विफल: $error';
  }

  @override
  String get areYouSureYouWantToSignOut =>
      'क्या आप वाकई साइन आउट करना चाहते हैं?';

  @override
  String done(int completed, int total) {
    return '$completed/$total किया गया';
  }

  @override
  String get createSomethingAmazing => 'कुछ अद्भुत बनाएं';

  @override
  String get secretOfGettingAhead => '\"आगे बढ़ने का रहस्य\\nशुरुआत करना है।\"';

  @override
  String get taskTitle => 'कार्य का शीर्षक';

  @override
  String get whatDoYouNeedToDo => 'आपको क्या करना है?';

  @override
  String get pleaseEnterTaskTitle => 'कृपया एक शीर्षक दर्ज करें';

  @override
  String get description => 'विवरण';

  @override
  String get addSomeDetails => 'कुछ विवरण जोड़ें (वैकल्पिक)';

  @override
  String get dueDate => 'नियत तारीख';

  @override
  String get priority => 'प्राथमिकता';

  @override
  String get category => 'श्रेणी';

  @override
  String get createTask => 'कार्य बनाएं';

  @override
  String get taskCreated => 'कार्य बनाया गया! 🎯';

  @override
  String get low => 'कम';

  @override
  String get medium => 'मध्यम';

  @override
  String get high => 'उच्च';

  @override
  String get personal => 'व्यक्तिगत';

  @override
  String get work => 'काम';

  @override
  String get health => 'स्वास्थ्य';

  @override
  String get education => 'शिक्षा';

  @override
  String get other => 'अन्य';

  @override
  String get addNewHabit => 'नई आदत जोड़ें';

  @override
  String get yourHabit => 'आपकी आदत';

  @override
  String get habitName => 'आदत का नाम';

  @override
  String get egDrinkWater => 'उदा. पानी पिएं, व्यायाम करें';

  @override
  String get pleaseEnterHabitName => 'कृपया आदत का नाम दर्ज करें';

  @override
  String get chooseIcon => 'आइकन चुनें';

  @override
  String get frequency => 'आवृत्ति';

  @override
  String get daily => 'दैनिक';

  @override
  String get weekly => 'साप्ताहिक';

  @override
  String get custom => 'कस्टम';

  @override
  String get color => 'रंग';

  @override
  String get createHabit => 'आदत बनाएं';

  @override
  String get habitCreated => 'आदत बनाई गई! अपनी लकीर शुरू करें! 🔥';

  @override
  String get allTasks => 'सभी कार्य';

  @override
  String get searchTasks => 'कार्य खोजें...';

  @override
  String get allFilter => 'सभी';

  @override
  String get pendingFilter => 'लंबित';

  @override
  String get doneFilter => 'पूर्ण';

  @override
  String noResultsFor(String query) {
    return '\"$query\" के लिए कोई परिणाम नहीं';
  }

  @override
  String get noCompletedTasksYet => 'अभी तक कोई पूर्ण कार्य नहीं';

  @override
  String get noOverdueTasks => 'कोई बाकी कार्य नहीं! 🎉';

  @override
  String get allCaughtUp => 'सभी कार्य पूर्ण! 🎉';

  @override
  String get tryDifferentSearchTerm => 'कोई अन्य खोज शब्द आज़माएं';

  @override
  String get tapToCreateFirstTask =>
      'अपना पहला कार्य बनाने के लिए + पर टैप करें';

  @override
  String totalCount(int length) {
    return 'कुल $length';
  }

  @override
  String get activeLabel => 'सक्रिय';

  @override
  String get doneTodayLabel => 'आज पूर्ण किया';

  @override
  String get bestStreakLabel => 'सर्वश्रेष्ठ स्ट्रीक';

  @override
  String get noHabitsYet => 'अभी कोई आदतें नहीं';

  @override
  String get startBuildingHabitsToday =>
      'आज ही सकारात्मक आदतें बनाना शुरू करें!';

  @override
  String get focusTimerTitle => 'फोकस टाइमर';

  @override
  String get breakLabel => 'ब्रेक';

  @override
  String get focusLabel => 'फोकस';

  @override
  String get sessionsLabel => 'सत्र';

  @override
  String get focusTimeLabel => 'फोकस समय';

  @override
  String get goalLabel => 'लक्ष्य';

  @override
  String get resetSessions => 'सत्र रीसेट करें';
}
