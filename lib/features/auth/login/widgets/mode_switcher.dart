import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/size_utils.dart';

class AppModeSwitcher extends StatelessWidget {
  final ThemeMode selectedMode;
  final ValueChanged<ThemeMode> onModeChanged;

  const AppModeSwitcher({
    super.key,
    required this.selectedMode,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = AppColors.primaryColor;

    return Directionality(
            textDirection: TextDirection.ltr,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: primaryColor, width: 2),
        ),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            _ModeCircle(
              icon: Icons.sunny,
              isSelected: selectedMode == ThemeMode.light,
              onTap: () => onModeChanged(ThemeMode.light),
            ),
            SizedBox(width: context.width * 0.03),
            _ModeCircle(
              icon: Icons.nightlight_round,
              isSelected: selectedMode == ThemeMode.dark,
              onTap: () => onModeChanged(ThemeMode.dark),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeCircle extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeCircle({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.width;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = AppColors.primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? primaryColor : Colors.transparent,
          border: isSelected ? Border.all(color: primaryColor) : null,
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.whiteColor : primaryColor,
          size: width * 0.05,
        ),
      ),
    );
  }
}
