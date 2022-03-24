import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'screens/root_screen.dart';

Future<void> main() async {
  runApp(const Application());

  const storage = FlutterSecureStorage();
  storage.delete(key: "e");
  storage.delete(key: "p");

  const email = "email";
  const password = "1234";

  await storage.write(key: "e", value: email);
  await storage.write(key: "p", value: password);

  final mail = await storage.read(key: "e");
  final pass = await storage.read(key: "p");

  if (kDebugMode) {
    print("mail = $mail, pass = $pass");
  }
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
