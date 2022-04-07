
import 'package:bank_lite/theme/app_theme.dart';
import 'web_theme_mob.dart'
  if (dart.library.js) 'web_theme_net.dart';

void changeWebTheme(AppTheme theme) {
  WebThemeImpl().changeWebTheme(theme);
}