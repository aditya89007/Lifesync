# 🔄 LifeSync: Smart Daily Planner & Habit Tracker

**Plan. Track. Focus. All in one place.**

This project is a beautifully designed, all-in-one Android application built with Flutter that helps users organize daily tasks, build lasting habits, and stay deeply focused using a Pomodoro timer — all synced securely to the cloud via Firebase.

Perfect for students, professionals, and anyone looking to take control of their daily routine and boost productivity.

---

## ✨ Features

- **🔐 Secure Authentication:** Email/Password and Google Sign-In via Firebase Auth.
- **📝 Task Management:** Create, edit, prioritize, and categorize daily tasks with due dates.
- **⚠️ Overdue Tracking:** Automatically highlights overdue tasks for quick action.
- **📅 Calendar View:** Horizontal date selector to browse tasks by day.
- **🔁 Habit Tracking:** Build daily habits with visual streak counters and progress rings.
- **🔥 Streak Counter:** Track consecutive days of habit completion to stay motivated.
- **⏱️ Pomodoro Focus Timer:** Built-in focus timer with customizable work/break sessions.
- **📊 Progress Dashboard:** Interactive animated progress rings on the home screen.
- **☁️ Cloud Sync:** All data is synced in real-time to Firebase Firestore.
- **🔔 Smart Notifications:** Custom local push notification reminders for tasks and habits.
- **🌗 Light & Dark Mode:** Full theming support with automatic system detection.
- **🪟 Glassmorphism UI:** Modern, premium UI design with frosted glass cards and smooth animations.
- **🌍 Multi-Language Support:** Localized in English, Hindi, Gujarati, Spanish, French, German, and more.
- **🗑️ Data Management:** One-tap clear all data from Settings.
- **🔒 In-App Privacy Policy:** Built-in privacy policy screen.

---

## 🛠️ Tech Stack & Requirements

| Layer | Technology |
|---|---|
| **Language** | Dart |
| **Framework** | Flutter |
| **IDE** | Android Studio / VS Code |
| **Min SDK** | Android 6.0 (Marshmallow - API 23) or higher |
| **State Management** | Provider |
| **Authentication** | Firebase Auth + Google Sign-In |
| **Database** | Cloud Firestore (Real-time sync) |
| **Notifications** | flutter_local_notifications |
| **UI Design** | Custom Glassmorphism, Material 3, Google Fonts |
| **Build System** | Gradle (Kotlin DSL) |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.x or later)
- Android Studio / VS Code with Flutter plugin
- A Firebase project with Authentication & Firestore enabled

### Installation & Build

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/aditya89007/Lifesync.git
   cd Lifesync
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase:**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable **Email/Password** and **Google Sign-In** in Authentication
   - Create a **Cloud Firestore** database
   - Download `google-services.json` and place it in `android/app/`

4. **Run the App:**
   ```bash
   flutter run
   ```

### Build Release

```bash
# APK (for direct install)
flutter build apk --release

# AAB (for Google Play Store)
flutter build appbundle --release
```

---

## 📁 Project Structure

```
lib/
├── main.dart                     # App entry point
├── l10n/                         # Localization files (ARB)
├── models/
│   ├── task_model.dart           # Task data model
│   └── habit_model.dart          # Habit data model
├── providers/
│   ├── auth_provider.dart        # Authentication state
│   ├── task_provider.dart        # Task state management
│   ├── habit_provider.dart       # Habit state management
│   └── theme_provider.dart       # Theme & settings state
├── screens/
│   ├── splash_screen.dart        # Animated splash screen
│   ├── login_screen.dart         # Login page
│   ├── signup_screen.dart        # Registration page
│   ├── main_screen.dart          # Bottom navigation shell
│   ├── home_screen.dart          # Dashboard with overview
│   ├── add_task_screen.dart      # Create new task
│   ├── edit_task_screen.dart     # Edit existing task
│   ├── habits_list_screen.dart   # Habit tracker
│   ├── add_habit_screen.dart     # Create new habit
│   ├── edit_habit_screen.dart    # Edit existing habit
│   ├── focus_timer_screen.dart   # Pomodoro timer
│   ├── settings_screen.dart      # App settings
│   └── privacy_policy_screen.dart # Privacy policy
├── services/
│   ├── auth_service.dart         # Firebase Auth service
│   ├── firestore_service.dart    # Firestore CRUD operations
│   └── notification_service.dart # Local notifications
├── theme/
│   └── app_theme.dart            # Design system & colors
└── widgets/
    ├── glass_card.dart           # Glassmorphism card widget
    ├── soft_card.dart            # Soft UI card widget
    ├── task_card.dart            # Task list item
    ├── habit_card.dart           # Habit list item
    ├── date_selector.dart        # Horizontal calendar
    ├── animated_progress_ring.dart # Circular progress
    └── progress_indicator.dart   # Linear progress bar
```

---

## 🔑 Signing Information (Release Key)

The release `.aab` file for the Google Play Store is signed using a secure Keystore.

| Item | Status |
|---|---|
| **Keystore File** | `upload-keystore.jks` (Stored securely outside the repo) |
| **Key Alias** | `upload` |
| **Build Variant** | `release` |
| **Application ID** | `com.marwadiuniversity.Lifesync` |

---

## 🛡️ Privacy Policy (Google Play Console)

> **Note:** This section serves as the required public disclosure for the Google Play Store listing.

**[LifeSync: Privacy Policy]**

**Effective Date:** April 2026

### 1. Data Collection & Usage

- **Account Information:** Email address, Name, and Profile Picture are collected via Google Sign-In or manual sign-up for the purpose of user authentication.
- **App Data:** Tasks, Habits, streaks, and schedules are synced securely to Firebase Firestore to provide a seamless cross-device experience.
- **Usage Data:** Basic device information and crash logs may be collected to improve app stability.

### 2. Third-Party Services

This application integrates with trusted third-party providers:
- **Firebase Authentication** — for secure user logins.
- **Cloud Firestore** — for real-time data storage and synchronization.
- No third-party advertising or analytics SDKs are used.

### 3. Device Permissions

| Permission | Purpose |
|---|---|
| `INTERNET` | Cloud data sync via Firebase |
| `POST_NOTIFICATIONS` | Local reminders for tasks & habits |
| `SCHEDULE_EXACT_ALARM` | Precise notification scheduling |
| `RECEIVE_BOOT_COMPLETED` | Re-schedule notifications after device reboot |
| `VIBRATE` | Notification alerts |

### 4. Data Security & Retention

We use industry-standard security measures. Data is encrypted in transit and at rest using Firebase infrastructure. Your data is retained as long as your account is active.

### 5. User Rights & Data Deletion

You have the right to request the deletion of your account and all associated data. You can clear all data directly from the **Settings** screen or contact support for full account deletion.

### 6. Contact Us

If you have any questions about this Privacy Policy, please contact the developer at: **adityapatel89007@gmail.com**

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License.

---

## 📧 Contact

- **Project Link:** [https://github.com/aditya89007/Lifesync](https://github.com/aditya89007/Lifesync)
- **Developer:** Aditya Patel
- **Email:** adityapatel89007@gmail.com

---

<p align="center">
  Made with ❤️ using Flutter<br>
  © 2026 LifeSync
</p>
