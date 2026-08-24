# movies_app

## Firebase setup

The app uses Firebase Authentication and Cloud Firestore. From the project
root, connect this Flutter app to the Firebase project you created:

```bash
flutterfire configure
flutter pub get
```

Select the Android, iOS, and web apps when prompted. This generates the
platform configuration files required by `Firebase.initializeApp()`.

Enable **Email/Password** under Firebase Authentication, create a Firestore
database, and deploy rules that restrict each user to their own profile:

Enable **Google** under Firebase Authentication > Sign-in providers. For
Android, add the SHA-1 fingerprint of the debug/release signing key to the
Android app in Firebase Project Settings. iOS also needs the generated
`GoogleService-Info.plist` added to the Runner target if you run the iOS app.

```text
match /users/{userId} {
	allow read, write: if request.auth != null && request.auth.uid == userId;
}
```

Profiles are stored in `users/{uid}` with `name`, `phone`, `avatar`, and
`email` fields. Passwords remain managed by Firebase Authentication.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
