import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/services/movie_history_service.dart';
import 'package:movies_app/features/auth/login/cubit/auth_view_model.dart';
import 'package:movies_app/services/firebase_service.dart';
import 'features/main/tabs/home/cubit/home_general_cubit.dart';
import 'firebase_options.dart';
import 'package:movies_app/features/auth/forget_password/forget_password_screen.dart';
import 'package:movies_app/features/auth/login/login_screen.dart';
import 'package:movies_app/features/auth/register/regsister_screen.dart';
import 'package:movies_app/features/main/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies_app/features/main/movie_details/movie_suggestions/cubit/movie_suggestion_view_model.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_details_bloc_builder.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/features/main/tabs/browse/browse_tab.dart';
import 'package:movies_app/features/main/tabs/profile/profile_tab.dart';
import 'package:movies_app/features/main/main_screen.dart';
import 'package:movies_app/features/onboarding/explore_screen.dart';
import 'package:movies_app/features/main/update_profile/update_profile_screen.dart';
import 'package:movies_app/features/main/update_profile/reset_password_screen.dart';
import 'package:movies_app/features/onboarding/on_boarding_screens.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MovieHistoryService.instance.initialize();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailsViewModel>(
          create: (context) => MovieDetailsViewModel(),
        ),
        BlocProvider<MovieSuggestionViewModel>(
          create: (context) => MovieSuggestionViewModel(),
        ),
        BlocProvider<AuthViewModel>(
          create: (context) => AuthViewModel(AuthService()),
        ),
        BlocProvider<HomeGeneralCubit>(create: (context) => HomeGeneralCubit()),
      ],
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // locale: Locale(languageProvider.appLanguage),
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.updateProfileScreen: (context) => UpdateProfileScreen(),
        AppRoutes.resetPasswordScreen: (context) => const ResetPasswordScreen(),
        AppRoutes.mainScreen: (context) => MainScreen(),
        AppRoutes.exploreScreen: (context) => const ExploreScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        AppRoutes.registerScreen: (context) => const RegisterScreen(),
        AppRoutes.forgotPasswordScreen: (context) =>
            const ForgetPasswordScreen(),
        AppRoutes.onboardingScreen: (context) => OnBoardingScreens(),
        AppRoutes.movieDetailsScreen: (context) => MovieDetailsBlocBuilder(),
        AppRoutes.browseScreen: (context) => BrowseTab(),
        AppRoutes.profileScreen: (context) => ProfileTab(),
      },
      initialRoute: AppRoutes.loginScreen,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
