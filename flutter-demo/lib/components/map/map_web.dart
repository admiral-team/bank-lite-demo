import 'dart:ui' as ui;

import 'package:bank_lite/components/map/map.dart';
import 'package:bank_lite/components/map/models/map_point.dart';
import 'package:bank_lite/components/map/models/mock_points.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/helpers/router.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps/google_maps.dart' as gmaps;
import 'package:universal_html/html.dart' as html;

MapWidget getMapWidget() => const MapScreenWeb();

class MapScreenWeb extends MapWidget {
  const MapScreenWeb({
    Key? key,
  }) : super(key: key);

  @override
  noSuchMethod(Invocation invocation) => _MapScreenWebState(mockPoints);
}

class _MapScreenWebState extends MapWidgetState<MapScreenWeb> {
  _MapScreenWebState(List<MapPoint> points) : super(points);

  @override
  Widget build(BuildContext context) {
    const String htmlId = "map";
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;
    const router = BaseRouter();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final mapOptions = gmaps.MapOptions()
        ..zoom = 15.0
        ..center =
            gmaps.LatLng(initialPosition.latitude, initialPosition.longitude);

      final elem = html.DivElement()..id = htmlId;
      final map = gmaps.GMap(elem, mapOptions);

      final _icon = gmaps.Icon()
        ..scaledSize = gmaps.Size(40, 40)
        ..url = Uri.file(Assets.lib.assets.images.atmWeb.path).toString();

      for (var i = 0; i < points.length; i++) {
        gmaps.Marker(
          gmaps.MarkerOptions()
            ..icon = _icon
            ..position = gmaps.LatLng(
              points[i].position.latitude,
              points[i].position.longitude,
            )
            ..map = map
            ..title = htmlId,
        );
      }

      return elem;
    });

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).atms),
        titleTextStyle: fonts.navbar.toTextStyle(colors.textPrimary.color()),
        centerTitle: true,
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => router.popScreen(context),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: const HtmlElementView(viewType: htmlId),
    );
  }
}
