import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main/tabs/search/cubit/search_state.dart';
import '../../../../../api/api_manager.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  void getInitialMovies() async {
    emit(SearchLoadingState());
    try {
      var result = await ApiManager.getMoviesByGenre("");
      emit(SearchSuccessState(result.data?.movies ?? []));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }

  void searchMovies(String query) async {
    if (query.trim().isEmpty) {
      getInitialMovies();
      return;
    }
    emit(SearchLoadingState());
    try {
      var result = await ApiManager.searchMovies(query);
      emit(SearchSuccessState(result.data?.movies ?? []));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}