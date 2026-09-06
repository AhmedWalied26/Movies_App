import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/genre_localizer.dart';
import 'package:movies_app/utils/size_utils.dart';

class MovieGeners extends StatelessWidget {
  final Movie movieDetails;
  const MovieGeners({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.genres,
              style: AppStyles.bold24White,
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movieDetails.genres!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 28 / 8,
            mainAxisSpacing: height * 0.011,
            crossAxisSpacing: width * 0.035,
          ),
          itemBuilder: (context, index) {
            return Container(
              alignment: .center,
              decoration: BoxDecoration(
                borderRadius: .circular(12),
                color: isDark
                    ? AppColors.darkGreyColor
                    : AppColors.lightRateColor,
              ),

              child: Text(
                GenreLocalizer.localize(context, movieDetails.genres![index]),
                // style: AppStyles.regular16White,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 16,
                  color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
        SizedBox(height: height * 0.016),
      ],
    );
  }
}
