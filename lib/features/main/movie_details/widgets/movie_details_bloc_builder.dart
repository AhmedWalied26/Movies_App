import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main/movie_details/cubit/movie_details_state.dart';
import 'package:movies_app/features/main/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies_app/features/main/movie_details/movie_details_screen.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/widgets/main_error.dart';

class MovieDetailsBlocBuilder extends StatefulWidget {
  const MovieDetailsBlocBuilder({super.key});

  @override
  State<MovieDetailsBlocBuilder> createState() =>
      _MovieDetailsBlocBuilderState();
}

class _MovieDetailsBlocBuilderState extends State<MovieDetailsBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsViewModel>().getMovieDetails(16);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else if (state is MovieDetailsErrorState) {
          return MainError(onTap: () {});
        } else if (state is MovieDetailsSuccessState) {
          var data = state.moviesList;
          return MovieDetailsScreen(movieDetails: data!);
        }
        return Container();
      },
    );
  }
}
