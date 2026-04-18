// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'LifeSync';

  @override
  String get tasks => 'Tareas';

  @override
  String get habits => 'Hábitos';

  @override
  String get settings => 'Ajustes';

  @override
  String get language => 'Idioma';

  @override
  String get home => 'Inicio';

  @override
  String get focus => 'Concentración';

  @override
  String get createNew => 'Crear Nuevo';

  @override
  String get newTask => 'Nueva Tarea';

  @override
  String get createAToDo => 'Crear una tarea';

  @override
  String get newHabit => 'Nuevo Hábito';

  @override
  String get buildARoutine => 'Crear una rutina';

  @override
  String get goodMorning => 'Buenos Días';

  @override
  String get goodAfternoon => 'Buenas Tardes';

  @override
  String get goodEvening => 'Buenas Noches';

  @override
  String get dailyProgress => 'Progreso Diario';

  @override
  String get addTasksToGetStarted => '¡Añade tareas para empezar!';

  @override
  String get allDoneForToday => '¡Increíble! ¡Todo hecho por hoy! 🎉';

  @override
  String almostThere(int pending) {
    return '¡Ya casi! ¡Faltan $pending! 💪';
  }

  @override
  String keepGoing(int completed, int total) {
    return '¡Sigue así! $completed de $total completados';
  }

  @override
  String get completedProgress => 'completado';

  @override
  String get streaks => 'Rachas';

  @override
  String get overdue => 'Atrasados';

  @override
  String get upcoming => 'Próximos';

  @override
  String get next7Days => 'Próximos 7 días';

  @override
  String get todaysTasks => 'Tareas de Hoy';

  @override
  String remaining(int count) {
    return '$count restantes';
  }

  @override
  String get noTasksToday => 'Sin tareas para hoy';

  @override
  String get noTasksForThisDate => 'Sin tareas para esta fecha';

  @override
  String get tapToAddNewTask => 'Toca + para nueva tarea';

  @override
  String get tomorrow => 'Mañana';

  @override
  String inDays(int days) {
    return 'En $days días';
  }

  @override
  String get notifications => 'Notificaciones';

  @override
  String get pushNotifications => 'Notificaciones Push';

  @override
  String get receiveDailyReminders => 'Recibir recordatorios diarios';

  @override
  String get reminderTime => 'Hora del recordatorio';

  @override
  String get appearance => 'Apariencia';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get darkThemeActive => 'Tema oscuro activo';

  @override
  String get lightThemeActive => 'Tema claro activo';

  @override
  String get dataAndAccount => 'Datos y Cuenta';

  @override
  String get syncData => 'Sincronizar Datos';

  @override
  String get syncedWithFirebaseCloud => 'Sincronizado con Firebase Cloud';

  @override
  String get clearAllData => 'Borrar todos los datos';

  @override
  String get deleteAllTasksAndHabits => 'Eliminar todas las tareas y hábitos';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get logOutOfYourAccount => 'Salir de tu cuenta';

  @override
  String get about => 'Acerca de';

  @override
  String get version => 'Versión';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get selectLanguage => 'Seleccionar Idioma';

  @override
  String get clearDataWarning =>
      'Esto eliminará permanentemente todas tus tareas y hábitos. Esta acción no se puede deshacer.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get deleteAll => 'Eliminar todo';

  @override
  String get allDataClearedSuccessfully => 'Todos los datos eliminados';

  @override
  String failedToClearData(String error) {
    return 'Error al borrar datos: $error';
  }

  @override
  String get areYouSureYouWantToSignOut => '¿Seguro que quieres cerrar sesión?';

  @override
  String done(int completed, int total) {
    return '$completed/$total listos';
  }

  @override
  String get createSomethingAmazing => 'Crea algo asombroso';

  @override
  String get secretOfGettingAhead =>
      '\"El secreto para avanzar\\nes empezar.\"';

  @override
  String get taskTitle => 'Título de la Tarea';

  @override
  String get whatDoYouNeedToDo => '¿Qué necesitas hacer?';

  @override
  String get pleaseEnterTaskTitle => 'Por favor ingresa un título';

  @override
  String get description => 'Descripción';

  @override
  String get addSomeDetails => 'Añade detalles (opcional)';

  @override
  String get dueDate => 'Fecha de Vencimiento';

  @override
  String get priority => 'Prioridad';

  @override
  String get category => 'Categoría';

  @override
  String get createTask => 'Crear Tarea';

  @override
  String get taskCreated => '¡Tarea creada! 🎯';

  @override
  String get low => 'Baja';

  @override
  String get medium => 'Media';

  @override
  String get high => 'Alta';

  @override
  String get personal => 'Personal';

  @override
  String get work => 'Trabajo';

  @override
  String get health => 'Salud';

  @override
  String get education => 'Educación';

  @override
  String get other => 'Otro';

  @override
  String get addNewHabit => 'Añadir Nuevo Hábito';

  @override
  String get yourHabit => 'Tu Hábito';

  @override
  String get habitName => 'Nombre del Hábito';

  @override
  String get egDrinkWater => 'ej. Beber Agua, Ejercicio';

  @override
  String get pleaseEnterHabitName => 'Por favor ingresa un nombre';

  @override
  String get chooseIcon => 'Elige un Ícono';

  @override
  String get frequency => 'Frecuencia';

  @override
  String get daily => 'Diario';

  @override
  String get weekly => 'Semanal';

  @override
  String get custom => 'Personalizado';

  @override
  String get color => 'Color';

  @override
  String get createHabit => 'Crear Hábito';

  @override
  String get habitCreated => '¡Hábito creado! ¡Comienza tu racha! 🔥';

  @override
  String get allTasks => 'Todas las tareas';

  @override
  String get searchTasks => 'Buscar tareas...';

  @override
  String get allFilter => 'Todo';

  @override
  String get pendingFilter => 'Pendientes';

  @override
  String get doneFilter => 'Hechas';

  @override
  String noResultsFor(String query) {
    return 'Sin resultados para \"$query\"';
  }

  @override
  String get noCompletedTasksYet => 'Aún no hay tareas completadas';

  @override
  String get noOverdueTasks => '¡Sin tareas atrasadas! 🎉';

  @override
  String get allCaughtUp => '¡Todo al día! 🎉';

  @override
  String get tryDifferentSearchTerm => 'Intenta otra búsqueda';

  @override
  String get tapToCreateFirstTask => 'Toca + para tu primera tarea';

  @override
  String totalCount(int length) {
    return '$length en total';
  }

  @override
  String get activeLabel => 'Activo';

  @override
  String get doneTodayLabel => 'Hechas hoy';

  @override
  String get bestStreakLabel => 'Mejor racha';

  @override
  String get noHabitsYet => 'Aún no hay hábitos';

  @override
  String get startBuildingHabitsToday => '¡Crea hábitos positivos hoy!';

  @override
  String get focusTimerTitle => 'Temporizador Focus';

  @override
  String get breakLabel => 'DESCANSO';

  @override
  String get focusLabel => 'CONCENTRARSE';

  @override
  String get sessionsLabel => 'Sesiones';

  @override
  String get focusTimeLabel => 'Tiempo concentrado';

  @override
  String get goalLabel => 'Meta';

  @override
  String get resetSessions => 'Reiniciar sesiones';
}
