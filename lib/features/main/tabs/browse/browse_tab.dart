import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main/movie_details/cubit/browse_state.dart';
import 'package:movies_app/features/main/movie_details/cubit/browse_view_model.dart';
import 'package:movies_app/features/main/tabs/browse/widgets/tab_bar_widget.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseViewModel()..getAllMoviesAndGenres(),
      child: BlocBuilder<BrowseViewModel, BrowseState>(
        builder: (context, state) {
          var viewModel = BlocProvider.of<BrowseViewModel>(context);

          if (state is BrowseLoadingState) {
            return const Center(child: CircularProgressIndicator());
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