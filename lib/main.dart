import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'generated/assets.gen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: Scaffold(
          body: Container(
            alignment: Alignment.center,
            color: Colors.white, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.lib.assets.images.alert.svg(color: Colors.red),
                Assets.lib.assets.images.arrowUp.svg(color: Colors.grey),
                Assets.lib.assets.images.appbarMain.svg(color: Colors.blue),
                Assets.lib.assets.images.vtbTitle.svg(color: Colors.black)
            ])
          ),
          resizeToAvoidBottomInset: false),
    );
  }
}

