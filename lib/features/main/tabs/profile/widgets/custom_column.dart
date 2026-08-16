import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_styles.dart';

class CustomColumn extends StatelessWidget {
  final String label_1;
  final String label_2;
  const CustomColumn({super.key, required this.label_1, required this.label_2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('12', style: AppStyles.bold24White),
            Text(label_1, style: AppStyles.bold24White),
          ],
        ),
        const SizedBox(width: 24),
        Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('10', style: AppStyles.bold24White),
            Text(label_2, style: AppStyles.bold24White),
          ],
        ),
      ],
    );
  }
}
