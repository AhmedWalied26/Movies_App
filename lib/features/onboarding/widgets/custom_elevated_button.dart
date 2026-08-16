import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressedButton2;
  final Color? bgColor;
  final TextStyle style;
  const CustomElevatedButton({
    super.key,
    required this.onPressedButton2,
    required this.title,
    this.bgColor = AppColors.primaryColor,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: .symmetric(vertical: 15),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      onPressed: onPressedButton2,
      child: Text(title, style: style),
    );
  }
}
