import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class MovieHead extends StatelessWidget {
  final String movieName;
  final int movieTime;
  final VoidCallback onIconWatchButton;
  final VoidCallback onBookmarkButton;
  final bool isSaved;
  const MovieHead({
    super.key,
    required this.movieName,
    required this.movieTime,
    required this.onIconWatchButton,
    required this.onBookmarkButton,
    required this.isSaved,
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
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 30,
                color: AppColors.whiteColor,
              ),
            ),
            IconButton(
              onPressed: onBookmarkButton,
              tooltip: isSaved
                  ? AppLocalizations.of(context)!.removeFromWatchList
                  : AppLocalizations.of(context)!.addToWatchList,
              icon: Icon(
                isSaved ? Icons.bookmark : Icons.bookmark_border,
                size: 30,
                color: isSaved ? AppColors.redColor : AppColors.whiteColor,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.2),
        InkWell(
          onTap: onIconWatchButton,
          child: SvgPicture.asset(AppAssets.videoIcon),
        ),
        SizedBox(height: height * 0.14),
        Text(
          movieName,
          textAlign: .center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: height * 0.015),
        Text(
          movieTime.toString(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 22),
        ),
      ],
    );
  }
}
