import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/api/model/movie_suggestions_response/movie_suggestion.dart';
import 'package:movies_app/features/main/movie_details/movie_suggestions/cubit/movie_suggestion_view_model.dart';
import 'package:movies_app/features/main/movie_details/movie_suggestions/widgets/movie_suggestion_bloc_builder.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_cast.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_geners.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_head.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_info.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_screen_shots.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_summary.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie? movieDetails;
  final List<MovieSuggestion>? movieSuggestion;

  const MovieDetailsScreen({
    super.key,
    this.movieSuggestion,
    this.movieDetails,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieSuggestionViewModel>().getMovieSuggestions(
      widget.movieDetails!.id!,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.55,
                      child: Image.network(
                        widget.movieDetails!.mediumCoverImage!,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: height * 0.55,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.blackColor.withValues(alpha: 0.2),
                            AppColors.blackColor.withValues(alpha: 0.7),
                            AppColors.blackColor,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              child: SafeArea(
                child: Column(
                  children: [
                    MovieHead(
                      movieName: widget.movieDetails!.title!,
                      movieTime: widget.movieDetails!.year!,
                    ),
                    SizedBox(height: height * 0.016),
                    CustomElevatedButton(
                      onPressedButton2: () {},
                      title: AppLocalizations.of(context)!.watch,
                      style: AppStyles.bold24White,
                      bgColor: AppColors.redColor,
                    ),
                    SizedBox(height: height * 0.016),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MovieInfo(
                          text: widget.movieDetails!.likeCount!,
                          icon: AppAssets.favoriteIcon,
                        ),
                        MovieInfo(
                          text: widget.movieDetails!.runtime!,
                          icon: AppAssets.timeIcon,
                        ),
                        MovieInfo(
                          text: widget.movieDetails!.rating!,
                          icon: AppAssets.rateIcon,
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.016),
                    MovieScreenShots(movieDetails: widget.movieDetails!),
                    SizedBox(height: height * 0.024),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.similar,
                          style: AppStyles.bold24White,
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.016),
                    MovieSuggestionBlocBuilder(
                      movieId: widget.movieDetails!.id!,
                    ),
                    SizedBox(height: height * 0.024),
                    MovieSummary(movieDetails: widget.movieDetails!),
                    SizedBox(height: height * 0.024),
                    MovieCast(movieDetails: widget.movieDetails!),
                    SizedBox(height: height * 0.024),
                    MovieGeners(movieDetails: widget.movieDetails!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
