import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BaseRouter {
  const BaseRouter();

  void pushScreen(BuildContext context, WidgetBuilder builder) async {
    final screen = await _builder(context, builder);
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) {
        return screen;
      })
    );
  }

  void popScreen(BuildContext context) {
    Navigator.maybePop(context);
  }

  Future<Widget> _builder(BuildContext context, WidgetBuilder builder) async {
     return Future.microtask(() {
        return builder(context);
    });
  }
}

class CustomCupertinoPageRoute extends CupertinoPageRoute {
  @override
  bool get hasScopedWillPopCallback {
    // Magic to disable swipe gesture on web and enable on mobile
    return kIsWeb;
  }
  CustomCupertinoPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}
