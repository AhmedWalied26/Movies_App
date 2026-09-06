import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main/tabs/browse/cubit/browse_state.dart';
import 'package:movies_app/features/main/tabs/browse/cubit/browse_view_model.dart';
import 'package:movies_app/features/main/tabs/browse/widgets/tab_bar_widget.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/skeleton/movie_grid_skeleton.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return BlocProvider(
      create: (context) => BrowseViewModel()..getAllMoviesAndGenres(),
      child: BlocBuilder<BrowseViewModel, BrowseState>(
        builder: (context, state) {
          var viewModel = BlocProvider.of<BrowseViewModel>(context);
          if (state is BrowseLoadingState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              child: MovieGridSkeleton(),
            );
          } else if (state is BrowseErrorState) {
            return Center(child: Text(state.statusMessage ?? 'Unknown Error'));
          }
          return TabBarWidget(
            genres: viewModel.genresList,
            movies: viewModel.filteredMovies,
            selectedGenre: viewModel.selectedGenre,
            onGenreSelected: (genre) {
              viewModel.filterMoviesByGenre(genre);
            },
          );
        },
      ),
    );
  }
}
