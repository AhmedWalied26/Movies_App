import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.label_1,
    required this.label_2,
  });
  final String label_1;
  final String label_2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: SizeConfig.height(context) * 0.02),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(label_1, style: AppStyles.bold20Black)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(label_2, style: AppStyles.bold20White),
                    SvgPicture.asset(AppAssets.exitIcon),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
