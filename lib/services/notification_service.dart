import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    tzdata.initializeTimeZones();
    try {
      final timeZoneInfo = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneInfo.identifier));
    } catch (e) {
      debugPrint('[NotificationService] Timezone init failed: $e, using UTC');
      tz.setLocalLocation(tz.UTC);
    }

    // Local notifications setup
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initSettings = InitializationSettings(android: androidSettings);
    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Request Android 13+ notification permission at runtime
    await _requestPermissions();

    // Firebase Cloud Messaging setup
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Get FCM token for push notifications
    await _firebaseMessaging.getToken();

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
  }

  /// Request runtime notification permission (Android 13+)
  Future<bool> _requestPermissions() async {
    if (Platform.isAndroid) {
      final androidPlugin =
          _localNotifications.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (androidPlugin != null) {
        final granted = await androidPlugin.requestNotificationsPermission();
        debugPrint('[NotificationService] Permission granted: $granted');
        return granted ?? false;
      }
    }
    return true;
  }

  void _onNotificationTapped(NotificationResponse response) {
    // Handle notification tap - can be extended later
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    await showNotification(
      title: message.notification?.title ?? 'Smart Planner',
      body: message.notification?.body ?? '',
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
    int id = 0,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'smart_planner_channel',
      'Smart Planner Notifications',
      channelDescription: 'Daily reminders and task notifications',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      playSound: true,
      enableVibration: true,
    );
    const details = NotificationDetails(android: androidDetails);
    await _localNotifications.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }

  /// Schedule a notification for a specific task at its due date/time
  Future<void> scheduleTaskReminder({
    required String taskId,
    required String taskTitle,
    required DateTime scheduledTime,
  }) async {
    // Use hashCode of taskId to get a unique int id for the notification
    final notifId = taskId.hashCode.abs() % 100000;

    final scheduledDate = tz.TZDateTime.from(scheduledTime, tz.local);
    
    // Don't schedule if the time is in the past
    if (scheduledDate.isBefore(tz.TZDateTime.now(tz.local))) return;

    const androidDetails = AndroidNotificationDetails(
      'task_reminder_channel',
      'Task Reminders',
      channelDescription: 'Reminders for your scheduled tasks',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      playSound: true,
      enableVibration: true,
    );

    const details = NotificationDetails(android: androidDetails);

    await _localNotifications.zonedSchedule(
      id: notifId,
      title: '📋 Task Reminder',
      body: taskTitle,
      scheduledDate: scheduledDate,
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
    debugPrint('[NotificationService] Scheduled task reminder: $taskTitle at $scheduledDate');
  }

  /// Schedule the daily planning reminder
  Future<void> scheduleDailyReminder({
    required int hour,
    required int minute,
  }) async {
    // Cancel only the daily reminder (id: 100), not all notifications
    await _localNotifications.cancel(id: 100);

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    const androidDetails = AndroidNotificationDetails(
      'daily_reminder_channel',
      'Daily Reminders',
      channelDescription: 'Your daily planning reminder',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      playSound: true,
      enableVibration: true,
    );

    const details = NotificationDetails(android: androidDetails);

    await _localNotifications.zonedSchedule(
      id: 100,
      title: '⏰ Time to Plan Your Day!',
      body: 'Check your tasks and habits for today. Stay consistent! 💪',
      scheduledDate: scheduledDate,
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    debugPrint('[NotificationService] Daily reminder scheduled at $hour:$minute');
  }

  /// Send an instant test notification (for debugging)
  Future<void> sendTestNotification() async {
    await showNotification(
      title: '🔔 Notifications Working!',
      body: 'Your Smart Planner notifications are set up correctly.',
      id: 999,
    );
  }

  Future<void> cancelTaskReminder(String taskId) async {
    final notifId = taskId.hashCode.abs() % 100000;
    await _localNotifications.cancel(id: notifId);
  }

  Future<void> cancelAllNotifications() async {
    await _localNotifications.cancelAll();
  }
}
