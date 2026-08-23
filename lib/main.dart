import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/forget_password/forget_password_screen.dart';
import 'package:movies_app/features/auth/login/login_screen.dart';
import 'package:movies_app/features/auth/register/regsister_screen.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/features/main/tabs/browse/browse_tab.dart';
import 'package:movies_app/features/main/tabs/profile/profile_tab.dart';
import 'package:movies_app/features/main/main_screen.dart';
import 'package:movies_app/features/onboarding/explore_screen.dart';
import 'package:movies_app/features/main/update_profile/update_profile_screen.dart';
import 'package:movies_app/features/onboarding/on_boarding_screens.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_theme.dart';
import 'package:movies_app/providers/language_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
   runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),

      child: MoviesApp(),
    ),
  );
  
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
var languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(languageProvider.appLanguage),
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.updateProfileScreen: (context) => UpdateProfileScreen(),
        AppRoutes.mainScreen: (context) => MainScreen(),
        AppRoutes.exploreScreen: (context) => const ExploreScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        AppRoutes.registerScreen: (context) => const RegisterScreen(),
        AppRoutes.forgotPasswordScreen: (context) =>
            const ForgetPasswordScreen(),
        AppRoutes.onboardingScreen: (context) => OnBoardingScreens(),
        AppRoutes.browseScreen: (context) => BrowseTab(),
        AppRoutes.profileScreen: (context) => ProfileTab(),
      },

      initialRoute: AppRoutes.exploreScreen,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .dark,
    );
  }
}
