// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/api/api_manager.dart';
// import 'package:movies_app/api/model/movie_details_response/movie.dart';
// import 'browse_state.dart';

// class BrowseViewModel extends Cubit<BrowseState> {
//   BrowseViewModel() : super(BrowseInitialState());

//   List<Movie> filteredMovies = [];
//   Set<String> uniqueGenres = {'All'};
//   List<String> genresList = [];
//   String selectedGenre = 'All';

//   void getAllMoviesAndGenres() async {
//     emit(BrowseLoadingState());
//     try {
//       var response = await ApiManager.getAllMovie();
//       var rawList = response.data?.movies ?? [];

//       var allMovies = (rawList as List<dynamic>?)
//           ?.map((e) => e is Movie ? e : Movie.fromJson(e.toJson()))
//           .toList() ??
//           [];

//       uniqueGenres = {'All'};
//       for (var movie in allMovies) {
//         if (movie.genres != null) {
//           for (var genre in movie.genres!) {
//             uniqueGenres.add(genre);
//           }
//         }
//       }
//       genresList = uniqueGenres.toList();
//       filteredMovies = allMovies;

//       emit(BrowseSuccessState());
//     } catch (e) {
//       emit(BrowseErrorState(statusMessage: e.toString()));
//     }
//   }

//   void filterMoviesByGenre(String genre) async {
//     selectedGenre = genre;
//     emit(BrowseLoadingState());
//     try {
//       var response;
//       if (genre == 'All') {
//         response = await ApiManager.getAllMovie();
//       } else {
//         response = await ApiManager.getMoviesByGenre(genre);
//       }

//       var rawList = response.data?.movies ?? [];

//       filteredMovies = (rawList as List<dynamic>?)
//           ?.map((e) => e is Movie ? e : Movie.fromJson(e.toJson()))
//           .toList() ??
//           [];

//       emit(BrowseSuccessState());
//     } catch (e) {
//       emit(BrowseErrorState(statusMessage: e.toString()));
//     }
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'browse_state.dart';

class BrowseViewModel extends Cubit<BrowseState> {
  BrowseViewModel() : super(BrowseInitialState());

  List<Movie> filteredMovies = [];
  Set<String> uniqueGenres = {'All'};
  List<String> genresList = [];
  String selectedGenre = 'All';

  // أول ما الصفحة تفتح تجيب كل الأفلام وتستخرج التصنيفات ديناميكياً
  void getAllMoviesAndGenres() async {
    if (isClosed) return;
    emit(BrowseLoadingState());
    try {
      var response = await ApiManager.getAllMovie();
      var rawList = response.data?.movies ?? [];

      var allMovies = (rawList as List<dynamic>?)
          ?.map((e) => e is Movie ? e : Movie.fromJson(e.toJson()))
          .toList() ??
          [];

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

      if (isClosed) return;
      emit(BrowseSuccessState());
    } catch (e) {
      if (isClosed) return;
      emit(BrowseErrorState(statusMessage: e.toString()));
    }
  }

  void filterMoviesByGenre(String genre) async {
    selectedGenre = genre;
    if (isClosed) return;
    emit(BrowseLoadingState());
    try {
      var response;
      if (genre == 'All') {
        response = await ApiManager.getAllMovie();
      } else {
        response = await ApiManager.getMoviesByGenre(genre);
      }

      var rawList = response.data?.movies ?? [];

      filteredMovies = (rawList as List<dynamic>?)
          ?.map((e) => e is Movie ? e : Movie.fromJson(e.toJson()))
          .toList() ??
          [];

      if (isClosed) return;
      emit(BrowseSuccessState());
    } catch (e) {
      if (isClosed) return;
      emit(BrowseErrorState(statusMessage: e.toString()));
    }
  }
}