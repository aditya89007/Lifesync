## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

## Google Sign-In
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.** { *; }
-dontwarn com.google.android.gms.**

## Google Play Services Auth
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.common.** { *; }

## Credential Manager (used by newer google_sign_in versions)
-if class androidx.credentials.CredentialManager
-keep class androidx.credentials.** { *; }
-if class androidx.credentials.CredentialManager
-keep class com.google.android.libraries.identity.googleid.** { *; }

## Google Play Core (deferred components) - suppress missing class warnings
-dontwarn com.google.android.play.core.splitcompat.**
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**
