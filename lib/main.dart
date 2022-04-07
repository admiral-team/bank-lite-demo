import 'package:bank_lite/theme/app_theme.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:bank_lite/web_theme/web_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'l10n/locale_provider.dart';
import 'screens/root_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  var initializationSettingsIOS = const IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: ($payload) async {
    if ($payload != null) {
      debugPrint('notification payload: ' + $payload);
    }
  });

  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppThemeProviderWrapper(
      child: ChangeNotifierProvider<LocaleProvider>(
          create: (context) => LocaleProvider(),
          child: Builder(builder: (context) {
            final theme = AppThemeProvider.of(context);
            final colors = theme.colors;
            changeWebTheme(theme);
            return CupertinoApp(
              locale: Provider.of<LocaleProvider>(context, listen: true).locale,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: CupertinoThemeData(
                brightness: theme.brightness, 
                barBackgroundColor: colors.backgroundBasic.color(),
                scaffoldBackgroundColor: colors.backgroundBasic.color(),
              ),
              home: Scaffold(
                body: AnnotatedRegion<SystemUiOverlayStyle>(
                  child: const RootScreen(), 
                  value: theme.overlayStyle
                ),
                resizeToAvoidBottomInset: false,
              ),
            );
          })),
    );
  }
}

