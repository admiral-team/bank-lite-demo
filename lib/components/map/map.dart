import 'package:bank_lite/components/map/models/map_point.dart';
import 'package:bank_lite/components/map/models/map_position.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bank_lite/components/map/map_stub.dart'
    if (dart.library.html) 'package:bank_lite/components/map/map_web.dart'
    if (dart.library.io) 'package:bank_lite/components/map/map_mobile.dart';
import 'package:universal_html/js.dart';

abstract class MapWidget extends StatefulWidget {
  static MapWidget? _instance;

  static MapWidget get instance {
    _instance ??= getMapWidget();
    return _instance!;
  }

  const MapWidget({Key? key}) : super(key: key);

  void showMessage(BuildContext context, String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppThemeProvider.of(context).colors.backgroundAdditional.color(),
        textColor: AppThemeProvider.of(context).colors.textPrimary.color(),
        fontSize: 16.0);
  }
}

abstract class MapWidgetState<T extends MapWidget> extends State<T> {
  final initialPosition =
      const MapPosition(latitude: 55.7520, longitude: 37.3175);

  List<MapPoint> points = [];

  MapWidgetState(this.points);
}
