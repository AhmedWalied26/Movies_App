import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/genre_localizer.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/movie_card_item.dart';

class TabBarWidget extends StatelessWidget {
  final List<String> genres;
  final List<Movie> movies;
  final String selectedGenre;
  final Function(String) onGenreSelected;

  const TabBarWidget({
    super.key,
    required this.genres,
    required this.movies,
    required this.selectedGenre,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: isDark
            ? AppColors.darkBlackColor
            : AppColors.whiteColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.012),
              SizedBox(
                height: 55,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    var genre = genres[index];
                    bool isSelected = selectedGenre == genre;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.012),
                      child: GestureDetector(
                        onTap: () {
                          onGenreSelected(genre);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.035,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? (isDark
                                      ? AppColors.primaryColor
                                      : AppColors.lightPrimaryColor)
                                : Colors.transparent,
                            border: Border.all(
                              color: isDark
                                  ? AppColors.primaryColor
                                  : AppColors.lightPrimaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              GenreLocalizer.localize(context, genre),
                              style: isSelected
                                  ? Theme.of(context).textTheme.displayMedium!
                                        .copyWith(fontWeight: FontWeight.bold)
                                  : Theme.of(context).textTheme.displayLarge!
                                        .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: SizeConfig.height(context) * 0.025),
              movies.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text(
                          'No movies found for this category',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.016),
                      itemCount: movies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),
                      itemBuilder: (context, index) {
                        var movie = movies[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.movieDetailsScreen,
                              arguments: movie.id,
                            );
                          },
                          child: MovieCardItem(
                            movie: movie,
                            movieImage:
                                movie.mediumCoverImage ??
                                movie.largeCoverImage ??
                                movie.backgroundImage ??
                                '',
                            movieRate: movie.rating != null
                                ? double.parse(movie.rating.toString())
                                : 0.0,
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
