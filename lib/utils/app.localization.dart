import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    final String jsonString = await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
    final Map<String, dynamic> jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String get currentLanguage => locale.languageCode;

  // This method will be called from every widget which needs a localized text
  String translate(String key, {String? replacement, String defaultText = "N/A"}) {
    if (_localizedStrings?.containsKey(key) == false) {
      if(defaultText!="N/A") {
        return defaultText;
      }
      return "$defaultText $key";
    }
    if (replacement != null) {
      final String? localizedStrings = _localizedStrings![key];
      // ignore: unnecessary_raw_strings
      return localizedStrings?.replaceAll(RegExp(r'%s'), replacement)??defaultText;
    } else {
      return _localizedStrings![key]??defaultText;
    }
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    final AppLocalizations localizations =  AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => true;
}
