import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/main_error.dart';
import '../../../../../widgets/movie_card_item.dart';
import '../../../../../widgets/main_loading_widget.dart';

class HomeTabWidget extends StatefulWidget {
  final String? genre;
  const HomeTabWidget({super.key, this.genre});

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return FutureBuilder(
      future: ApiManager.getMoviesByGenre(widget.genre!),
      builder: (context, snapshot) {
        //todo : Loading ;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoadingwidget();
        } else if (snapshot.hasError) {
          return MainError(
            errorMessage: "Something went wrong",
            onTap: () {
              ApiManager.getMoviesByGenre("Drama");
              setState(() {});
            },
          );
        } else if (snapshot.data!.status != "ok") {
          return MainError(
            errorMessage: snapshot.data!.message!,
            onTap: () {
              ApiManager.getMoviesByGenre("Drama");
              setState(() {});
            },
          );
        } else {
          var moviesList = snapshot.data?.data?.movies ?? [];
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: width * 0.035),
            scrollDirection: Axis.horizontal,
            itemCount: moviesList.length,
            separatorBuilder: (context, index) =>
                SizedBox(width: width * 0.035),
            itemBuilder: (context, index) {
              return SizedBox(
                width: width * 0.33,
                child: MovieCardItem(movie: moviesList[index] as dynamic),
              );
            },
          );
        }
      },
    );
  }
}
