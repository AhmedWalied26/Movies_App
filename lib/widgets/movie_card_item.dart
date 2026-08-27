import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/api/model/movie_list/movies.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class MovieCardItem extends StatelessWidget {
  final Movies? movie;
  const MovieCardItem({
    super.key,
    this.movie,
    this.movieImage,
    this.movieRate,
    this.isSuggestion = false,
  });
  final String? movieImage;
  final double? movieRate;
  final bool isSuggestion;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Container(
      padding: .directional(start: width * 0.02, top: width * 0.03),
      alignment: .topStart,
      decoration: BoxDecoration(
        borderRadius: .circular(20),
        image: isSuggestion
            ? DecorationImage(image: NetworkImage(movieImage!))
            : (movie?.mediumCoverImage != null &&
                  movie!.mediumCoverImage!.isNotEmpty)
            ? DecorationImage(
                fit: .fill,
                image: NetworkImage(movie!.mediumCoverImage!),
              )
            : null,
      ),
      child: Container(
        padding: .symmetric(horizontal: width * 0.02, vertical: height * 0.005),
        decoration: BoxDecoration(
          borderRadius: .circular(10),
          color: AppColors.blackColor.withValues(alpha: 0.71),
        ),
        child: Row(
          spacing: width * 0.01,
          mainAxisSize: .min,
          children: [
            Text(
              isSuggestion ? movieRate.toString() : movie!.rating.toString(),
              style: AppStyles.regular16White,
            ),
            SvgPicture.asset(
              AppAssets.rateIcon,
              width: width * 0.034,
              height: height * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}
