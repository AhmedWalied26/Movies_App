import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class MovieCast extends StatelessWidget {
  final Movie movieDetails;
  const MovieCast({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.cast,
              style: AppStyles.bold24White,
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movieDetails.cast!.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: height * 0.008),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(width * 0.035),
              decoration: BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: .circular(16),
              ),
              child: Row(
                spacing: width * 0.025,
                children: [
                  ClipRRect(
                    borderRadius: .circular(10),
                    child: Image.network(
                      movieDetails.cast![index].urlSmallImage!,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: .start,
                    spacing: height * 0.004,
                    children: [
                      Text(
                        'Name : ${movieDetails.cast![index].name!}',
                        style: AppStyles.regular20White,
                      ),
                      Text(
                        'Character : ${movieDetails.cast![index].characterName!}',
                        style: AppStyles.regular20White,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
