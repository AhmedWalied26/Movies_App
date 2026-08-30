import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class MainError extends StatelessWidget {
  final VoidCallback onTap;
  final String? errorMessage;
  const MainError({super.key, required this.onTap, this.errorMessage, required Null Function() onPressed});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Center(
      child: Column(
        spacing: height * 0.08,
        mainAxisAlignment: .center,
        children: [
          Text(
            errorMessage ?? 'Something went wrong',
            style: AppStyles.regular20White,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: .circular(8)),
            ),
            onPressed: onTap,
            child: Text('Try again', style: AppStyles.regular20White),
          ),
        ],
      ),
    );
  }
}
