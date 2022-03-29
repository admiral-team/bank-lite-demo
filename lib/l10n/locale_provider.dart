import 'package:bank_lite/storage/locale_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'locale.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale(locales[0]);

  Locale get locale => _locale;

  static const locales = ["ru", "en", "zh"];

  var _curLocation = 0;

  void setLocale(Locale loc) {
    if (!L10n.support.contains(loc)) return;
    _locale = loc;
    LanguageStorage().setLocale(loc.languageCode);
    notifyListeners();
  }

  void setLocaleByString(String? loc) {
    var _loc = "ru";
    if (loc == null) {
      _loc = "ru";
    } else {
      _loc = loc;
    }
    var locale = Locale(_loc);
    setLocale(locale);
  }

  void setNextLocale() {
    var index = ++_curLocation % 3;
    var locale = Locale(locales[index]);

    setLocale(locale);
  }
}
