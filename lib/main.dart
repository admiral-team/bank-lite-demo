import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  FirebasePerformance performance = FirebasePerformance.instance;
  bool isEnabled = await performance.isPerformanceCollectionEnabled();
  if (kDebugMode) {
    print("is performance enabled = $isEnabled");
  }

  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleProvider>(
      create: (context) => LocaleProvider(),
      child: Builder(
        builder: (context) => CupertinoApp(
          locale: Provider.of<LocaleProvider>(context, listen: true).locale,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: const CupertinoThemeData(brightness: Brightness.light),
          home: const Scaffold(
              body: RootScreen(), resizeToAvoidBottomInset: false),
        ),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return CupertinoApp(
//     debugShowCheckedModeBanner: false,
//     localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
//       DefaultMaterialLocalizations.delegate,
//       DefaultWidgetsLocalizations.delegate,
//       DefaultCupertinoLocalizations.delegate,
//     ],
//     theme: const CupertinoThemeData(brightness: Brightness.light),
//     home: Scaffold(
//         body: Container(
//           alignment: Alignment.center,
//           color: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Assets.lib.assets.images.alert.svg(color: Colors.red),
//               Assets.lib.assets.images.arrowUp.svg(color: Colors.grey),
//               Assets.lib.assets.images.appbarMain.svg(color: Colors.blue),
//               Assets.lib.assets.images.vtbTitle.svg(color: Colors.black)
//           ])
//         ),
//         resizeToAvoidBottomInset: false),
//   );
// }
}
