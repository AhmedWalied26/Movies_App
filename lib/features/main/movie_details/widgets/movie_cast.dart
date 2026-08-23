import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class MovieCast extends StatelessWidget {
  final String name;
  final String character;
  const MovieCast({super.key, required this.name, required this.character});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Container(
      padding: EdgeInsets.all(width * 0.035),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: .circular(16),
      ),
      child: Row(
        spacing: width * 0.025,
        children: [
          Image.asset(AppAssets.castMovie),
          Column(
            crossAxisAlignment: .start,
            spacing: height * 0.012,
            children: [
              Text('Name : $name', style: AppStyles.regular20White),
              Text('Character : $character', style: AppStyles.regular20White),
            ],
          ),
        ],
      ),
    );
  }
}
