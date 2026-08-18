
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Providers/Language_Provider.dart';
import 'package:movies_app/features/main/tabs/browse/browse_tab.dart';
import 'package:movies_app/features/main/tabs/profile/profile_tab.dart';
import 'package:movies_app/features/onboarding/on_boarding_screens.dart';
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