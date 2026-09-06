import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/utils/translated_text.dart';

class MovieSummary extends StatelessWidget {
  final Movie movieDetails;
  const MovieSummary({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.summary,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
        TranslatedText(
          text: movieDetails.descriptionFull!,
          // style: AppStyles.regular16White,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
