import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';

class GenreLocalizer {
  GenreLocalizer._();

  static String localize(BuildContext context, String genre) {
    final loc = AppLocalizations.of(context)!;

    switch (genre.trim().toLowerCase()) {
      case 'all':
        return loc.all;
      case 'action':
        return loc.action;
      case 'horror':
        return loc.horror;
      case 'comedy':
        return loc.comedy;
      case 'drama':
        return loc.drama;
      case 'sci-fi':
      case 'science fiction':
        return loc.sci_fi;
      case 'fantasy':
        return loc.fantasy;
      case 'romance':
        return loc.romance;
      case 'crime':
        return loc.crime;
      case 'adventure':
        return loc.adventure;
      case 'animation':
        return loc.animation;
      case 'biography':
        return loc.biography;
      case 'documentary':
        return loc.documentary;
      case 'family':
        return loc.family;
      case 'history':
        return loc.history;
      case 'music':
        return loc.music;
      case 'musical':
        return loc.musical;
      case 'mystery':
        return loc.mystery;
      case 'sport':
        return loc.sport;
      case 'thriller':
        return loc.thriller;
      case 'war':
        return loc.war;
      case 'film-noir':
        return loc.film_noir;
      default:
        return genre;
    }
  }
}