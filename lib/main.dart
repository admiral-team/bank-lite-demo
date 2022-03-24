import 'package:bank_lite/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'screens/root_screen.dart';
import 'generated/assets.gen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid = const AndroidInitializationSettings('');

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
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: Scaffold(body: RootScreen(), resizeToAvoidBottomInset: false),
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
