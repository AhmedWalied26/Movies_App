import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/api/model/movie_suggestions_response/movie_suggestion.dart';
import 'package:movies_app/features/main/movie_details/movie_suggestions/widgets/movie_suggestion_bloc_builder.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_cast.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_geners.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_head.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_info.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_screen_shots.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_summary.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_web_view.dart';
import 'package:movies_app/features/main/tabs/profile/watch/watch_list_service.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  late YoutubePlayerController _playerController;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkIfSaved();
  }

  Future<void> _checkIfSaved() async {
    final saved = await WatchListService.instance.isSaved(
      widget.movieDetails?.id,
    );
    if (mounted) setState(() => isSaved = saved);
  }

  Future<void> _toggleSave() async {
    if (widget.movieDetails == null) return;
    final newState = await WatchListService.instance.toggleSave(
      widget.movieDetails!,
    );
    if (mounted) setState(() => isSaved = newState);
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? Color(0xFF121312)
          : const Color.fromARGB(255, 255, 255, 255),
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

                          colors: isDark
                              ? [
                                  const Color.fromARGB(82, 56, 47, 5),
                                  const Color.fromARGB(92, 104, 97, 64),
                                  const Color.fromARGB(153, 81, 83, 81),
                                  const Color(0xFF121312),
                                ]
                              : [
                                  const Color.fromARGB(101, 54, 45, 9),
                                  const Color.fromARGB(94, 43, 34, 1),
                                  const Color.fromARGB(143, 131, 129, 75),

                                  const Color.fromARGB(251, 255, 255, 255),
                                ],
                          stops: [0.0, 0.35, 0.65, 1.0],
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
                      onIconWatchButton: showTrailer,
                      onBookmarkButton: _toggleSave,
                      isSaved: isSaved,
                      movieName: widget.movieDetails!.title!,
                      movieTime: widget.movieDetails!.year!,
                    ),
                    SizedBox(height: height * 0.016),
                    CustomElevatedButton(
                      onPressedButton2: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MovieWebView(
                                url: widget.movieDetails!.url!,
                              );
                            },
                          ),
                        );
                      },
                      title: AppLocalizations.of(context)!.watch,
                      style: AppStyles.bold24White,
                      bgColor: isDark
                          ? AppColors.redColor
                          : AppColors.lightRedColor,
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
                          style: Theme.of(context).textTheme.headlineLarge,
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

  void showTrailer() {
    final videoId = YoutubePlayerController.convertUrlToId(
      'https://www.youtube.com/watch?v=${widget.movieDetails!.ytTrailerCode}',
    );
    if (videoId == null || videoId.isEmpty) return;

    _playerController = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: true,
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.transparentColor,
          child: YoutubePlayer(controller: _playerController),
        );
      },
    ).then((value) {
      _playerController.close();
    });
  }
}
