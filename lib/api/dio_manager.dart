import 'package:dio/dio.dart';

import 'model/Movies_list.dart';

class DioManager {
   static final Dio dio = Dio();

   static Future<MoviesList> getMoviesByGenre(String genre)async{
     try{
       var response = await dio.get('https://movies-api.accel.li/api/v2/list_movies.json',
       queryParameters: {
         "genre" : genre
       }
       );
       return MoviesList.fromJson(response.data);
     }catch(e){
       rethrow;
     }
   }
}