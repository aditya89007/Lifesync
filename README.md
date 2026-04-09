# LifeSync 🔄

**Plan. Track. Focus.**

LifeSync is a beautifully designed, all-in-one daily planner built with Flutter. It helps you organize tasks, build lasting habits, and stay deeply focused — all in one clutter-free workspace.

---

## ✨ Features

- 🔐 **Email & Password Authentication**
- 🔑 **Google Sign-In Integration**
- 👋 **Personalized User Dashboard**
- 📝 **Daily Task Management**
- 🏷️ **Task Categorization & Prioritization**
- ⚠️ **Overdue Task Tracking**
- 📅 **Horizontal Calendar Date Selector**
- 🔁 **Daily Habit Tracking**
- 🔥 **Habit Streak Counter**
- ⏱️ **Pomodoro Focus Timer**
- 📊 **Focus Session Tracking**
- 💫 **Real-time Interactive Progress Rings**
- ☁️ **Cloud Data Sync (Firebase)**
- 🗑️ **One-Tap Clear All Data**
- 🌗 **Light & Dark Mode Theming**
- 🪟 **Modern Glassmorphism UI**
- 🔔 **Custom Push Notification Reminders**
- 🔒 **In-App Privacy Policy**

---

## 📸 Screenshots

| Home Dashboard | Task Management | Focus Timer |
|:-:|:-:|:-:|
| Dark glassmorphism UI with progress rings | Add, edit & organize by priority | Pomodoro timer with session tracking |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| **Framework** | Flutter (Dart) |
| **State Management** | Provider |
| **Authentication** | Firebase Auth + Google Sign-In |
| **Database** | Cloud Firestore |
| **Notifications** | flutter_local_notifications |
| **UI Design** | Custom Glassmorphism, Material 3 |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.x or later)
- Android Studio / VS Code
- Firebase project with Authentication & Firestore enabled

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/aditya89007/Lifesync.git
   cd Lifesync
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable **Email/Password** and **Google Sign-In** in Authentication
   - Create a **Cloud Firestore** database
   - Download `google-services.json` and place it in `android/app/`

4. **Run the app**
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
├── main.dart                  # App entry point
├── models/
│   ├── task_model.dart        # Task data model
│   └── habit_model.dart       # Habit data model
├── providers/
│   ├── auth_provider.dart     # Authentication state
│   ├── task_provider.dart     # Task state management
│   ├── habit_provider.dart    # Habit state management
│   └── theme_provider.dart    # Theme & settings state
├── screens/
│   ├── splash_screen.dart     # Animated splash screen
│   ├── login_screen.dart      # Login page
│   ├── signup_screen.dart     # Registration page
│   ├── main_screen.dart       # Bottom navigation shell
│   ├── home_screen.dart       # Dashboard with overview
│   ├── tasks_list_screen.dart # Task list with calendar
│   ├── add_task_screen.dart   # Create new task
│   ├── edit_task_screen.dart  # Edit existing task
│   ├── habits_list_screen.dart# Habit tracker
│   ├── add_habit_screen.dart  # Create new habit
│   ├── edit_habit_screen.dart # Edit existing habit
│   ├── focus_timer_screen.dart# Pomodoro timer
│   ├── settings_screen.dart   # App settings
│   └── privacy_policy_screen.dart # Privacy policy
├── services/
│   ├── auth_service.dart      # Firebase Auth service
│   ├── firestore_service.dart # Firestore CRUD operations
│   └── notification_service.dart # Local notifications
├── theme/
│   └── app_theme.dart         # Design system & colors
└── widgets/
    ├── glass_card.dart        # Glassmorphism card widget
    ├── task_card.dart         # Task list item
    ├── habit_card.dart        # Habit list item
    ├── date_selector.dart     # Horizontal calendar
    ├── animated_progress_ring.dart # Circular progress
    ├── progress_indicator.dart# Linear progress bar
    └── soft_card.dart         # Soft UI card widget
```

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

## 👨‍💻 Author

**Aditya** — [@aditya89007](https://github.com/aditya89007)

---

<p align="center">
  Made with ❤️ using Flutter<br>
  © 2026 LifeSync
</p>
