import 'package:bank_lite/components/map/map.dart';
import 'package:bank_lite/components/map/models/map_point.dart';
import 'package:bank_lite/components/map/models/mock_points.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

MapWidget getMapWidget() => const MapScreenMobile();

class MapScreenMobile extends MapWidget {
  const MapScreenMobile({Key? key}) : super(key: key);

  @override
  noSuchMethod(Invocation invocation) => _MapScreenMobileState(mockPoints);
}

class _MapScreenMobileState extends MapWidgetState<MapScreenMobile> {
  List<MapObject> _mapObjects = [];
  late YandexMapController _controller;

  final _animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 0.2);

  _MapScreenMobileState(List<MapPoint> points) : super(points);

  Future<bool> get locationPermissionIsGranted async =>
      (await Permission.location.request().isGranted);

  @override
  void initState() {
    super.initState();

    List<MapObject> placeMarks = [];
    for (var i = 0; i < points.length; i++) {
      placeMarks.add(
        Placemark(
          opacity: 1,
          mapId: MapObjectId('place_mark_$i'),
          point: Point(
            latitude: points[i].position.latitude,
            longitude: points[i].position.longitude,
          ),
          onTap: (Placemark self, Point point) {
            if (points[i].info != null) {
              widget.showMessage(context, points[i].info!);
            }
          },
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                Assets.lib.assets.images.atm.path,
              ),
            ),
          ),
        ),
      );
    }
    setState(() {
      _mapObjects = placeMarks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            AppThemeProvider.of(context).colors.backgroundBasic.color(),
        appBar: AppBar(
          title: const Text("Банкоматы"),
          titleTextStyle: TextStyle(
            color: AppThemeProvider.of(context).colors.textPrimary.color(),
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.sfProText,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppThemeProvider.of(context).colors.elementsAccent.color(),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor:
              AppThemeProvider.of(context).colors.backgroundBasic.color(),
        ),
        body: Stack(children: [
          YandexMap(
            logoAlignment: const MapAlignment(
              horizontal: HorizontalAlignment.left,
              vertical: VerticalAlignment.bottom,
            ),
            mapObjects: _mapObjects,
            onMapCreated: (YandexMapController yandexMapController) async {
              _controller = yandexMapController;

              await _controller.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: Point(
                      latitude: initialPosition.latitude,
                      longitude: initialPosition.longitude,
                    ),
                  ),
                ),
              );

              showCurrentLocation();
            },
          ),
          Row(
            children: [
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton.small(
                    child: Icon(
                      Icons.add,
                      color: AppThemeProvider.of(context)
                          .colors
                          .elementsAccent
                          .color(),
                    ),
                    backgroundColor: AppThemeProvider.of(context)
                        .colors
                        .elementsStaticWhite
                        .color(),
                    onPressed: () async {
                      await _controller.moveCamera(
                        CameraUpdate.zoomIn(),
                        animation: _animation,
                      );
                    },
                  ),
                  FloatingActionButton.small(
                    child: Icon(
                      Icons.remove,
                      color: AppThemeProvider.of(context)
                          .colors
                          .elementsAccent
                          .color(),
                    ),
                    backgroundColor: AppThemeProvider.of(context)
                        .colors
                        .elementsStaticWhite
                        .color(),
                    onPressed: () async {
                      await _controller.moveCamera(
                        CameraUpdate.zoomOut(),
                        animation: _animation,
                      );
                    },
                  ),
                  const SizedBox(height: 180.0),
                  FloatingActionButton.small(
                    child: Icon(
                      Icons.gps_fixed,
                      color: AppThemeProvider.of(context)
                          .colors
                          .elementsAccent
                          .color(),
                    ),
                    backgroundColor: AppThemeProvider.of(context)
                        .colors
                        .elementsStaticWhite
                        .color(),
                    onPressed: () async {
                      await showCurrentLocation();
                    },
                  ),
                  const SizedBox(height: 130.0)
                ],
              ),
              const SizedBox(width: 16.0)
            ],
          ),
        ]));
  }

  Future<void> showCurrentLocation() async {
    if (await locationPermissionIsGranted) {
      _controller.toggleUserLayer(visible: true);

      final CameraPosition? userPosition = await Future.delayed(
        const Duration(seconds: 2),
        () => _controller.getUserCameraPosition(),
      );

      if (userPosition != null) {
        await _controller.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: userPosition.target,
            ),
          ),
        );
      }
    } else {
      widget.showMessage(context, "Location permission was NOT granted");
    }
  }
}
