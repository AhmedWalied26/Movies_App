import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';

class MovieGeners extends StatelessWidget {
  final String generType;
  const MovieGeners({super.key, required this.generType});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      decoration: BoxDecoration(
        borderRadius: .circular(12),
        color: AppColors.darkGreyColor,
      ),
      child: Text(generType, style: AppStyles.regular16White),
    );
  }
}
