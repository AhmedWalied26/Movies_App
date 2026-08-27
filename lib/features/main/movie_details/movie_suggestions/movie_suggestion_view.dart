import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_suggestions_response/movie_suggestion.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/movie_card_item.dart';

class MovieSuggestionView extends StatelessWidget {
  final List<MovieSuggestion>? movieSuggestion;
  const MovieSuggestionView({super.key, required this.movieSuggestion});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: movieSuggestion!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 189 / 279,
        mainAxisSpacing: height * 0.016,
        crossAxisSpacing: width * 0.04,
      ),
      itemBuilder: (context, index) {
        return MovieCardItem(
          movieImage: movieSuggestion![index].mediumCoverImage,
          movieRate: movieSuggestion![index].rating!,
        );
      },
    );
  }
}
