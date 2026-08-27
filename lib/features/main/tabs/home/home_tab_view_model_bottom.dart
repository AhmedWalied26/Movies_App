import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/dio_manager.dart';
import 'package:movies_app/api/model/Movies.dart';


class HomeTabViewModelBottom extends ChangeNotifier {
  // todo : hold data // handle logic ;
  List<Movies>? actionMoviesList ;
  String selectedGenre = "Action";
  String? errorMessage ;
  bool? isLoading = false ;

  void getMoviesByGenre (String genre)async{
    selectedGenre = genre ;
    isLoading = true;
    notifyListeners();
    try{
      var response = await DioManager.getMoviesByGenre(genre);
      if(response.status == "error"){
        errorMessage = response.message;
        isLoading = false ;
      }else{
        actionMoviesList = response.data!.movies;
        isLoading = false;
      }
    }catch(e){
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}