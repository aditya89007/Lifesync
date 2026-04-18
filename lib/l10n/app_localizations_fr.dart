// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'LifeSync';

  @override
  String get tasks => 'Tâches';

  @override
  String get habits => 'Habitudes';

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get home => 'Accueil';

  @override
  String get focus => 'Concentration';

  @override
  String get createNew => 'Créer Nouveau';

  @override
  String get newTask => 'Nouvelle Tâche';

  @override
  String get createAToDo => 'Créer une tâche';

  @override
  String get newHabit => 'Nouvelle Habitude';

  @override
  String get buildARoutine => 'Créer une routine';

  @override
  String get goodMorning => 'Bonjour';

  @override
  String get goodAfternoon => 'Bon Après-midi';

  @override
  String get goodEvening => 'Bonsoir';

  @override
  String get dailyProgress => 'Progrès Quotidien';

  @override
  String get addTasksToGetStarted => 'Ajoutez des tâches pour commencer !';

  @override
  String get allDoneForToday => 'Super ! Tout est fini pour aujourd\'hui ! 🎉';

  @override
  String almostThere(int pending) {
    return 'Presque ! Reste $pending ! 💪';
  }

  @override
  String keepGoing(int completed, int total) {
    return 'Continuez ! $completed sur $total terminées';
  }

  @override
  String get completedProgress => 'terminé';

  @override
  String get streaks => 'Séries';

  @override
  String get overdue => 'En retard';

  @override
  String get upcoming => 'À venir';

  @override
  String get next7Days => '7 prochains jours';

  @override
  String get todaysTasks => 'Tâches d\'Aujourd\'hui';

  @override
  String remaining(int count) {
    return '$count restants';
  }

  @override
  String get noTasksToday => 'Aucune tâche pour aujourd\'hui';

  @override
  String get noTasksForThisDate => 'Aucune tâche pour cette date';

  @override
  String get tapToAddNewTask => 'Appuyez sur + pour ajouter une tâche';

  @override
  String get tomorrow => 'Demain';

  @override
  String inDays(int days) {
    return 'Dans $days jours';
  }

  @override
  String get notifications => 'Notifications';

  @override
  String get pushNotifications => 'Notifications Push';

  @override
  String get receiveDailyReminders => 'Recevoir des rappels quotidiens';

  @override
  String get reminderTime => 'Heure de rappel';

  @override
  String get appearance => 'Apparence';

  @override
  String get darkMode => 'Mode Sombre';

  @override
  String get darkThemeActive => 'Thème sombre actif';

  @override
  String get lightThemeActive => 'Thème clair actif';

  @override
  String get dataAndAccount => 'Données et Compte';

  @override
  String get syncData => 'Synchroniser les données';

  @override
  String get syncedWithFirebaseCloud => 'Synchronisé avec Firebase Cloud';

  @override
  String get clearAllData => 'Effacer toutes les données';

  @override
  String get deleteAllTasksAndHabits =>
      'Supprimer toutes les tâches et habitudes';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get logOutOfYourAccount => 'Déconnectez-vous de votre compte';

  @override
  String get about => 'À propos';

  @override
  String get version => 'Version';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get selectLanguage => 'Choisir la Langue';

  @override
  String get clearDataWarning =>
      'Cela supprimera définitivement toutes vos tâches et habitudes. Cette action est irréversible.';

  @override
  String get cancel => 'Annuler';

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get allDataClearedSuccessfully =>
      'Toutes les données ont été effacées';

  @override
  String failedToClearData(String error) {
    return 'Échec de l\'effacement : $error';
  }

  @override
  String get areYouSureYouWantToSignOut =>
      'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String done(int completed, int total) {
    return '$completed/$total fait(s)';
  }

  @override
  String get createSomethingAmazing => 'Créez quelque chose d\'incroyable';

  @override
  String get secretOfGettingAhead =>
      '\"Le secret pour avancer\\nest de commencer.\"';

  @override
  String get taskTitle => 'Titre de la Tâche';

  @override
  String get whatDoYouNeedToDo => 'Que devez-vous faire ?';

  @override
  String get pleaseEnterTaskTitle => 'Veuillez entrer un titre de tâche';

  @override
  String get description => 'Description';

  @override
  String get addSomeDetails => 'Ajouter des détails (facultatif)';

  @override
  String get dueDate => 'Date d\'échéance';

  @override
  String get priority => 'Priorité';

  @override
  String get category => 'Catégorie';

  @override
  String get createTask => 'Créer Tâche';

  @override
  String get taskCreated => 'Tâche créée ! 🎯';

  @override
  String get low => 'Faible';

  @override
  String get medium => 'Moyenne';

  @override
  String get high => 'Haute';

  @override
  String get personal => 'Personnel';

  @override
  String get work => 'Travail';

  @override
  String get health => 'Santé';

  @override
  String get education => 'Éducation';

  @override
  String get other => 'Autre';

  @override
  String get addNewHabit => 'Ajouter Nouvelle Habitude';

  @override
  String get yourHabit => 'Votre Habitude';

  @override
  String get habitName => 'Nom de l\'Habitude';

  @override
  String get egDrinkWater => 'ex., Boire de l\'eau, Sport';

  @override
  String get pleaseEnterHabitName => 'Veuillez entrer un nom';

  @override
  String get chooseIcon => 'Choisir Icône';

  @override
  String get frequency => 'Fréquence';

  @override
  String get daily => 'Quotidien';

  @override
  String get weekly => 'Hebdomadaire';

  @override
  String get custom => 'Personnalisé';

  @override
  String get color => 'Couleur';

  @override
  String get createHabit => 'Créer Habitude';

  @override
  String get habitCreated => 'Habitude créée ! Commencez votre série ! 🔥';

  @override
  String get allTasks => 'Toutes les tâches';

  @override
  String get searchTasks => 'Rechercher des tâches...';

  @override
  String get allFilter => 'Tout';

  @override
  String get pendingFilter => 'En cours';

  @override
  String get doneFilter => 'Faites';

  @override
  String noResultsFor(String query) {
    return 'Aucun résultat pour \"$query\"';
  }

  @override
  String get noCompletedTasksYet => 'Aucune tâche terminée';

  @override
  String get noOverdueTasks => 'Aucune tâche en retard ! 🎉';

  @override
  String get allCaughtUp => 'Tout est à jour ! 🎉';

  @override
  String get tryDifferentSearchTerm => 'Essayez une autre recherche';

  @override
  String get tapToCreateFirstTask =>
      'Appuyez sur + pour créer votre 1ère tâche';

  @override
  String totalCount(int length) {
    return '$length au total';
  }

  @override
  String get activeLabel => 'Actif';

  @override
  String get doneTodayLabel => 'Fait Aujourd\'hui';

  @override
  String get bestStreakLabel => 'Meilleure Série';

  @override
  String get noHabitsYet => 'Aucune habitude';

  @override
  String get startBuildingHabitsToday =>
      'Commencez à créer des habitudes aujourd\'hui !';

  @override
  String get focusTimerTitle => 'Minuteur de Concentration';

  @override
  String get breakLabel => 'PAUSE';

  @override
  String get focusLabel => 'CONCENTRATION';

  @override
  String get sessionsLabel => 'Sessions';

  @override
  String get focusTimeLabel => 'Temps Concentré';

  @override
  String get goalLabel => 'Objectif';

  @override
  String get resetSessions => 'Réinitialiser';
}
