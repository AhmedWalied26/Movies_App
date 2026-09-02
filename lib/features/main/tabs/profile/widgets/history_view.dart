import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class HistoryView extends StatelessWidget {
  final List<Movie> movies;
  final ValueChanged<int> onMovieTap;

  const HistoryView({
    super.key,
    required this.movies,
    required this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    return GridView.builder(
      padding: EdgeInsets.all(width * 0.035),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: width * 0.04,
        mainAxisSpacing: height * 0.016,
        childAspectRatio: 189 / 279,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return InkWell(
          onTap: () => onMovieTap(movie.id!),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.darkGreyColor,
              image: movie.mediumCoverImage == null
                  ? null
                  : DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        movie.mediumCoverImage!,
                      ),
                    ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.005,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.blackColor.withValues(alpha: 0.71),
              ),
              child: Text(
                movie.rating?.toString() ?? '-',
                style: AppStyles.regular16White,
              ),
            ),
          ),
        );
      },
    );
  }
}