import 'package:bank_lite/theme/color_palette.dart';
import 'package:bank_lite/theme/font_palette.dart';
import 'package:flutter/services.dart';

class AppTheme {
  final ColorPalette colors;
  final FontPalette fonts;
  final bool dark;
  Brightness get brightness => dark ? Brightness.light : Brightness.dark;
  SystemUiOverlayStyle get overlayStyle => dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

  const AppTheme({
    required this.colors,
    required this.fonts,
    required this.dark
  });

  static const defaultTheme = darkTheme;
}

const lightTheme = AppTheme(
  colors: lightPalette,
  fonts: defaultFontPalette,
  dark: false
);

const darkTheme = AppTheme(
  colors: darkPalette,
  fonts: defaultFontPalette,
  dark: true
);
