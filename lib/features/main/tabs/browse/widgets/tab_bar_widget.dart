import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
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

    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: context.height * 0.1),
          child: Column(
            children: [
              SizedBox(height: height * 0.012),

              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.016),
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
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.008,
                            horizontal: width * 0.035,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryColor : Colors.transparent,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              genre,
                              style: isSelected
                                  ? AppStyles.bold20DarkBlack
                                  : AppStyles.bold20Primary,
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      // تم تعديل الترتيب هنا لتبدأ بالبوستر الطولي الواضح أولاً
                      movieImage: movie.mediumCoverImage ?? movie.largeCoverImage ?? movie.backgroundImage ?? '',
                      movieRate: movie.rating != null ? double.parse(movie.rating.toString()) : 0.0,
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