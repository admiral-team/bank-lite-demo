import 'package:bank_lite/theme/color_palette.dart';

class AppTheme {
  final ColorPalette colors;

  const AppTheme({
    required this.colors,
  });

  static const defaultTheme = darkTheme;
}

const lightTheme = AppTheme(
  colors: lightPalette,
);

const darkTheme = AppTheme(
  colors: darkPalette,
);