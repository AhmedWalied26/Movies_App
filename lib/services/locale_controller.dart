import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends ChangeNotifier {
  LocaleController({Locale? initialLocale})
    : _locale = initialLocale ?? const Locale('en');

  Locale _locale;

  Locale get locale => _locale;

  Future<void> setLanguage(String languageCode) async {
    if (_locale.languageCode == languageCode) return;

    _locale = Locale(languageCode);
    notifyListeners();
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('language_code', languageCode);
  }
}