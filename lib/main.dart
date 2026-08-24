import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/features/main/tabs/browse/browse_tab.dart';
import 'package:movies_app/features/main/tabs/profile/profile_tab.dart';
import 'package:movies_app/features/main/main_screen.dart';
import 'package:movies_app/features/onboarding/explore_screen.dart';
import 'package:movies_app/features/main/update_profile/update_profile_screen.dart';
import 'package:movies_app/features/main/update_profile/screens/reset_password_screen.dart';
import 'package:movies_app/features/onboarding/on_boarding_screens.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.updateProfileScreen: (context) => UpdateProfileScreen(),
        AppRoutes.resetPasswordScreen: (context) => const ResetPasswordScreen(),
        AppRoutes.mainScreen: (context) => MainScreen(),
        AppRoutes.exploreScreen: (context) => const ExploreScreen(),
        AppRoutes.loginScreen: (context) => const MainScreen(),
        AppRoutes.registerScreen: (context) => const MainScreen(),
        AppRoutes.forgotPasswordScreen: (context) => const MainScreen(),
        AppRoutes.onboardingScreen: (context) => OnBoardingScreens(),
        AppRoutes.browseScreen: (context) => BrowseTab(),
        AppRoutes.profileScreen: (context) => ProfileTab(),
      },

      initialRoute: AppRoutes.mainScreen,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .dark,
    );
  }
}
