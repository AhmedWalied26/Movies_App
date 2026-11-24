# Movies App

A Flutter movie browsing app with real data from a YTS-compatible movies API, Firebase authentication, and per-user watch history synced across devices.

## Screenshots

<p align="center">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/10-movies-1.webp" width="170" alt="Movies app screenshot 1">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/11-movies-2.webp" width="170" alt="Movies app screenshot 2">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/12-movies-3.webp" width="170" alt="Movies app screenshot 3">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/13-movies-4.webp" width="170" alt="Movies app screenshot 4">
</p>

## Features

- Email/password and Google sign-in with Firebase Authentication, plus password reset
- Onboarding flow with theme and language personalization
- Home tab with featured movie carousel and genre sections
- Browse movies by genre and search the full catalog
- Movie details screen with cast, genres, rating, summary and screenshots
- Smart movie suggestions on every details screen
- Watch trailers in-app (YouTube player / web view)
- Profile tab with personal watch history and an update-profile screen with avatars
- English and Arabic localization
- Offline-friendly history: local Hive cache with Firestore sync for signed-in users

## Tech Stack

- **Flutter** / Dart
- **State management:** BLoC / Cubit (flutter_bloc)
- **Networking:** Dio (REST API)
- **Backend:** Firebase Authentication, Cloud Firestore, Google Sign-In
- **Local storage:** Hive, SharedPreferences
- **UI:** carousel_slider, cached_network_image, shimmer, google_fonts, flutter_svg
- **Media:** youtube_player_flutter, webview_flutter

## Movie history

When a movie details request succeeds, the app stores the movie in two places:

- Hive box `movie_history`, keyed by `<userId>_<movieId>` for offline access.
- Firestore at `users/{userId}/history/{movieId}` for signed-in users.

Each signed-in user reads only their own UID-prefixed Hive records and their own
Firestore subcollection; histories are never shared between accounts.

The Firestore history document contains the fields from the movie API response
plus `viewedAt` (a Firestore `Timestamp`). Both stores keep the 10 most recent
movies. Opening an existing movie moves it to the newest position. The history
tab reads Hive immediately and falls back to that cached list if Firestore is
unavailable.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/AhmedWalied26/Movies_App.git
   cd Movies_App
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add your own Firebase configuration (`firebase_options.dart` / `google-services.json`) via FlutterFire CLI.
4. Run the app:
   ```bash
   flutter run
   ```

Movie data comes from a YTS-compatible API (`movies-api.accel.li/api/v2`).
