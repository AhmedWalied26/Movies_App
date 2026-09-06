import 'package:flutter/material.dart';

class AppBottomNavAssets extends ThemeExtension<AppBottomNavAssets> {
  final String home;
  final String search;
  final String explore;
  final String profile;

  final String selectedHome;
  final String selectedSearch;
  final String selectedExplore;
  final String selectedProfile;

  const AppBottomNavAssets({
    required this.home,
    required this.search,
    required this.explore,
    required this.profile,
    required this.selectedHome,
    required this.selectedSearch,
    required this.selectedExplore,
    required this.selectedProfile,
  });

  @override
  AppBottomNavAssets copyWith({
    String? home,
    String? search,
    String? explore,
    String? profile,
    String? selectedHome,
    String? selectedSearch,
    String? selectedExplore,
    String? selectedProfile,
  }) {
    return AppBottomNavAssets(
      home: home ?? this.home,
      search: search ?? this.search,
      explore: explore ?? this.explore,
      profile: profile ?? this.profile,
      selectedHome: selectedHome ?? this.selectedHome,
      selectedSearch: selectedSearch ?? this.selectedSearch,
      selectedExplore: selectedExplore ?? this.selectedExplore,
      selectedProfile: selectedProfile ?? this.selectedProfile,
    );
  }

  @override
  AppBottomNavAssets lerp(
    covariant AppBottomNavAssets? other,
    double t,
  ) {
    return this;
  }
}