import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/size_utils.dart';

class LanguageSwitcher extends StatelessWidget {
  final Locale selectedLocale;
  final ValueChanged<Locale> onLanguageChanged;

  const LanguageSwitcher({
    super.key,
    required this.selectedLocale,
    required this.onLanguageChanged,
  });

  bool get isEnglish => selectedLocale.languageCode == 'en';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          _LanguageCircle(
            icon: AppAssets.enIcon,
            isSelected: isEnglish,
            onTap: () => onLanguageChanged(const Locale('en')),
          ),
          SizedBox(width: context.width * 0.03),
          _LanguageCircle(
            icon: AppAssets.arIcon,
            isSelected: !isEnglish,
            onTap: () => onLanguageChanged(const Locale('ar')),
          ),
        ],
      ),
    );
  }
}

class _LanguageCircle extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageCircle({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          border: isSelected ? Border.all(color: AppColors.primaryColor) : null,
        ),
        child: SvgPicture.asset(
          icon,
          width: width * 0.02,
          height: height * 0.02,
        ),
      ),
    );
  }
}
