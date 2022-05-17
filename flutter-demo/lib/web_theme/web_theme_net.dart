// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:bank_lite/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WebThemeImpl {
  void changeWebTheme(AppTheme theme) {
    _setMetaThemeColor(theme.colors.backgroundBasic.color());
  }

  void _setMetaThemeColor(Color color) {
    if (kIsWeb) {
      js.context.callMethod("setMetaThemeColor", [color.toHexString()]);
    }
  }
}

extension _ColorString on Color {
  String toHexString() {
    return '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }
}