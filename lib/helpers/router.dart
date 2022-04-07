import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BaseRouter {
  const BaseRouter();

  void pushScreen(BuildContext context, WidgetBuilder builder) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: builder)
    );
  }

  void popScreen(BuildContext context) {
    Navigator.maybePop(context);
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
