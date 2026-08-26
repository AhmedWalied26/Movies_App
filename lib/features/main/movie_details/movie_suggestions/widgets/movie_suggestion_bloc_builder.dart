import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main/movie_details/movie_suggestions/cubit/movie_suggestion_state.dart';
import 'package:movies_app/features/main/movie_details/movie_suggestions/cubit/movie_suggestion_view_model.dart';
import 'package:movies_app/features/main/movie_details/movie_suggestions/movie_suggestion_view.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/widgets/main_error.dart';

class MovieSuggestionBlocBuilder extends StatefulWidget {
  final int movieId;
  const MovieSuggestionBlocBuilder({super.key, required this.movieId});

  @override
  State<MovieSuggestionBlocBuilder> createState() =>
      _MovieSuggestionBlocBuilderState();
}

class _MovieSuggestionBlocBuilderState
    extends State<MovieSuggestionBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSuggestionViewModel, MovieSuggestionState>(
      builder: (context, state) {
        if (state is MovieSuggestionLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else if (state is MovieSuggestionErrorState) {
          return MainError(
            onTap: () {
              context.read<MovieSuggestionViewModel>().getMovieSuggestions(
                widget.movieId,
              );
            },
          );
        } else if (state is MovieSuggestionSuccessState) {
          var data = state.moviesSuggestionList;
          return MovieSuggestionView(movieSuggestion: data);
        }
        return Container();
      },
    );
  }
}
