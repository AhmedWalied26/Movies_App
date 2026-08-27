import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class MovieHead extends StatelessWidget {
  final String movieName;
  final int movieTime;
  const MovieHead({
    super.key,
    required this.movieName,
    required this.movieTime,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined, size: 30),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_outlined, size: 30),
            ),
          ],
        ),
        SizedBox(height: height * 0.2),
        SvgPicture.asset(AppAssets.videoIcon),
        SizedBox(height: height * 0.14),
        Text(movieName, textAlign: .center, style: AppStyles.bold24White),
        SizedBox(height: height * 0.015),
        Text(movieTime.toString(), style: AppStyles.bold20lightGrey),
      ],
    );
  }
}
