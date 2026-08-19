import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';

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
      width: 47,
      height: 21,
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 1.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        textDirection: TextDirection.ltr,

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onLanguageChanged(const Locale('en')),
            child: Container(
              width: 20,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isEnglish
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: SvgPicture.asset(AppAssets.enIcon, width: 30, height: 30),
            ),
          ),

          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onLanguageChanged(const Locale('ar')),
            child: Container(
              width: 20,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: !isEnglish
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: SvgPicture.asset(AppAssets.arIcon, width: 14, height: 14),
            ),
          ),
        ],
      ),
    );
  }
}
