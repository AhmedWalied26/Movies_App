import 'package:movies_app/features/auth/forget_password/forget_password_screen.dart';
import 'package:movies_app/features/auth/login/login_screen.dart';
import 'package:movies_app/features/auth/register/regsister_screen.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Providers/Language_Provider.dart';
import 'package:movies_app/features/onboarding/explore_screen.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: const MoviesApp(),
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
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.exploreScreen: (context) => const ExploreScreen(),
        // AppRoutes.onboardingScreen: (context) => const OnboardingScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        AppRoutes.registerScreen: (context) => const RegisterScreen(),
        AppRoutes.forgotPasswordScreen: (context) =>
            const ForgetPasswordScreen(),
        // AppRoutes.movieDetailsScreen: (context) => const MovieDetailsScreen(),
        // AppRoutes.updateProfileScreen: (context) => const UpdateProfileScreen(),
      },
      initialRoute: AppRoutes.loginScreen,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .dark,
    );
  }
}
