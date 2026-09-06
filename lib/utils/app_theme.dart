import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_nav_bar_assets.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimaryColor,
      onPrimary: AppColors.blackColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.lightTextColor,
      error: AppColors.lightRedColor,
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackgroundColor,
      foregroundColor: AppColors.lightTextColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppStyles.bold20Black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightPrimaryColor,
      selectedItemColor: AppColors.navBarSelectedLight,
      unselectedItemColor: AppColors.navBarUnselectedLight,
    ),
    extensions: const [
      AppBottomNavAssets(
        home: AppAssets.unhomeIconLight,
        search: AppAssets.unsearchLight,
        explore: AppAssets.unexploreIcon,
        profile: AppAssets.unprofileIcon,

        selectedHome: AppAssets.homeIcon,
        selectedSearch: AppAssets.searchDark,
        selectedExplore: AppAssets.exploreIcon,
        selectedProfile: AppAssets.profileIcon,
      ),
    ],
    // Text
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold24BlackInter,
      headlineMedium: AppStyles.bold20Black,
      displayMedium: AppStyles.regular20White,
      titleLarge: AppStyles.bold18Black,
      titleMedium: AppStyles.bold16Black,
      labelSmall: AppStyles.bold24Grey,
      bodyLarge: AppStyles.regular14Black,
      labelMedium: AppStyles.regular20Gray,
      titleSmall: AppStyles.regular16GrayInter,
      displayLarge: AppStyles.regular16Gray,
      headlineSmall: AppStyles.regular12RedLight,
      displaySmall: AppStyles.regular12Black,
      bodyMedium: AppStyles.regular13Black,
      bodySmall: AppStyles.regular12Grey,
      labelLarge: AppStyles.bold14Black,
    ),

    // TextField
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightBackgroundColor,

      hintStyle: AppStyles.regular12Grey,
      labelStyle: AppStyles.regular13Grey,

      prefixIconColor: AppColors.lightIconColor,
      suffixIconColor: AppColors.lightIconColor,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      // enabledBorder: OutlineInputBorder(

      //   borderRadius: BorderRadius.circular(15),
      //   borderSide: BorderSide.none,
      // ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.lightSecondaryTextColor.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.lightPrimaryColor,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.lightRedColor),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.lightRedColor,
          width: 1.5,
        ),
      ),
    ),

    // Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimaryColor,
        foregroundColor: AppColors.blackColor,
        elevation: 0,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppStyles.bold14Black,
      ),
    ),
  );


  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.blackColor,
      surface: AppColors.blackColor,
      onSurface: AppColors.whiteColor,
      error: AppColors.redColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      foregroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppStyles.bold20White,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkGreyColor,
      selectedItemColor: AppColors.navBarSelectedDark,
      unselectedItemColor: AppColors.navBarUnselectedDark,
    ),
    extensions: const [
      AppBottomNavAssets(
        home: AppAssets.homeIcon,
        search: AppAssets.searchDark,
        explore: AppAssets.exploreIcon,
        profile: AppAssets.profileIcon,

        selectedHome: AppAssets.selectedhomeDarkIcon,
        selectedSearch: AppAssets.selectedsearchDarkIcon,
        selectedExplore: AppAssets.selectedexploreDarkIcon,
        selectedProfile: AppAssets.selectedprofileDarkIcon,
      ),
    ],

    textTheme: TextTheme(
      headlineLarge: AppStyles.bold24White,
      headlineMedium: AppStyles.bold20White,
      titleLarge: AppStyles.bold18White,
      headlineSmall: AppStyles.regular12Red,
      displayLarge: AppStyles.regular16DarkPrimary,
      labelSmall: AppStyles.bold24white,

      labelMedium: AppStyles.regular20White,
      titleMedium: AppStyles.bold16White,
      bodyLarge: AppStyles.regular14White,
      displayMedium: AppStyles.regular20Black,
      titleSmall: AppStyles.regular16White,

      displaySmall: AppStyles.regular14White,
      bodyMedium: AppStyles.regular13White,
      bodySmall: AppStyles.regular12Grey,
      labelLarge: AppStyles.bold14Black,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkGreyColor,

      hintStyle: AppStyles.regular16White,
      labelStyle: AppStyles.regular16White,

      prefixIconColor: AppColors.whiteColor,
      suffixIconColor: AppColors.whiteColor,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.blackColor,
        elevation: 0,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppStyles.bold14Black,
      ),
    ),
  );
}
