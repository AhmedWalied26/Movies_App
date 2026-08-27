import 'package:flutter/material.dart';
import 'package:movies_app/api/dio_manager.dart';
import 'package:movies_app/utils/size_utils.dart';
import '../../../../../widgets/movie_card_item.dart';
import '../../../widgets/main_error_widget.dart';
import '../../../widgets/main_loading_widget.dart';

class HomeTabWidget extends StatefulWidget {
  final String? genre;
  const HomeTabWidget({super.key , this.genre});

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return FutureBuilder(
        future: DioManager.getMoviesByGenre(widget.genre!),
        builder: (context, snapshot) {
          //todo : Loading ;
          if(snapshot.connectionState == ConnectionState.waiting){
            return MainLoadingwidget();
          }
          else if (snapshot.hasError){
            return MainErrorWidget(
                errorMessage: "Something went wrong",
                onPressed: (){
                  DioManager.getMoviesByGenre("Drama");
                  setState(() {

                  });
                }
            );
          }
          else if (snapshot.data!.status != "ok"){
            return MainErrorWidget(
                errorMessage: snapshot.data!.message!,
                onPressed: (){
                  DioManager.getMoviesByGenre("Drama");
                  setState(() {

                  });
                }
            );
          }
          else {
            var moviesList = snapshot.data?.data?.movies ?? [];
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              scrollDirection: Axis.horizontal,
              itemCount: moviesList.length,
              separatorBuilder: (context, index) => SizedBox(width: width * 0.035),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: width * 0.33,
                  child: MovieCardItem(
                    movie: moviesList[index],
                  ),
                );
              },
            );
          }
        },);
  }
}
