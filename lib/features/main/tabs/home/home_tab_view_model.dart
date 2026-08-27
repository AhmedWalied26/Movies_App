import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/dio_manager.dart';
import 'package:movies_app/api/model/Movies.dart';


class HomeTabViewModel extends ChangeNotifier {
  // todo : hold data // handle logic ;
  List<Movies>? moviesList ;
  String? errorMessage ;
  bool? isLoading = false ;

  void getMoviesByGenre (String genre)async{
    isLoading = true;
    notifyListeners();
    try{
      var movieResponse = await DioManager.getMoviesByGenre(genre);
      if(movieResponse.status == "error"){
        errorMessage = movieResponse.message;
        isLoading = false ;
      }else{
        moviesList = movieResponse.data!.movies;
        isLoading = false;
      }
    }catch(e){
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}