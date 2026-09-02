import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'browse_state.dart';

class BrowseViewModel extends Cubit<BrowseState> {
  BrowseViewModel() : super(BrowseInitialState());

  List<Movie> allMovies = [];
  Set<String> uniqueGenres = {'All'};
  List<String> genresList = [];
  String selectedGenre = 'All';
  List<Movie> filteredMovies = [];

  void getAllMoviesAndGenres() async {
    emit(BrowseLoadingState());
    try {
      var response = await ApiManager.getAllMovies();

      var rawList = response.data?.movies ?? [];

      allMovies = (rawList as List<dynamic>?)
          ?.map((e) => e is Movie ? e : Movie.fromJson(e.toJson()))
          .toList() ?? [];

      uniqueGenres = {'All'};
      for (var movie in allMovies) {
        if (movie.genres != null) {
          for (var genre in movie.genres!) {
            uniqueGenres.add(genre);
          }
        }
      }

      genresList = uniqueGenres.toList();
      filteredMovies = allMovies;

      emit(BrowseSuccessState());
    } catch (e) {
      emit(BrowseErrorState(statusMessage: e.toString()));
    }
  }

  void filterMoviesByGenre(String genre) {
    selectedGenre = genre;
    if (genre == 'All') {
      filteredMovies = allMovies;
    } else {
      filteredMovies = allMovies.where((movie) {
        return movie.genres != null && movie.genres!.contains(genre);
      }).toList();
    }
    emit(BrowseFilterChangedState());
  }
}