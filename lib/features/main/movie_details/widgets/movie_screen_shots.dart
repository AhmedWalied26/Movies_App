import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class MovieScreenShots extends StatelessWidget {
  final Movie movieDetails;
  const MovieScreenShots({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.screenshots,
              style: AppStyles.bold24White,
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movieDetails.mediumScreenshots!.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: height * 0.014),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: .circular(16),
              child: Image.network(
                movieDetails.mediumScreenshots![index],
                fit: .cover,
              ),
            );
          },
        ),
      ],
    );
  }
}
