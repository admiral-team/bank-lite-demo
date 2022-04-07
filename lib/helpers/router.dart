import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;

class BaseRouter {
  const BaseRouter();

  void pushScreen(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) {
        return widget;
      })
    );
  }

  void popScreen(BuildContext context) {
    Navigator.pop(context);
  }
}

class _BoxWidget extends StatelessWidget {
  final Widget child;
  const _BoxWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: child,
        onWillPop: () async {
          print("_BoxWidget Widget 123");
          return false;
        });
  }
}

// class CustomCupertinoPageRoute extends CupertinoPageRoute {
//   @override
//   bool get hasScopedWillPopCallback {
//     return true;
//   }
//   CustomCupertinoPageRoute({
//     required WidgetBuilder builder,
//     RouteSettings? settings,
//     bool maintainState = true,
//     bool fullscreenDialog = false,
//   }) : super(
//           builder: builder,
//           settings: settings,
//           maintainState: maintainState,
//           fullscreenDialog: fullscreenDialog,
//         );
// }
