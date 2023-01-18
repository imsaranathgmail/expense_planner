// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:expense_planner/core/language/languages_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;
  Map<String, String> localizedString = {};
  AppLocalization({
    required this.locale,
  });
  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

  static AppLocalization of(context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;

  Future<bool> load() async {
    final jsonString = await rootBundle.loadString('assets/lanuages/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    localizedString = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String? translate(String key) {
    return localizedString[key];
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return LanguagesList.languages.map((e) => e.code).toList().contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale: locale);
    await appLocalization.load();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
