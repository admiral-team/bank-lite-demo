import 'package:bank_lite/components/map/map.dart';
import 'package:bank_lite/components/map/models/map_point.dart';
import 'package:bank_lite/components/map/models/mock_points.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

MapWidget getMapWidget() => const MapScreenMobile();

class MapScreenMobile extends MapWidget {
  const MapScreenMobile({
    Key? key
  }) : super(key: key);

  @override
  noSuchMethod(Invocation invocation) => _MapScreenMobileState(mockPoints);
}

class _MapScreenMobileState extends MapWidgetState<MapScreenMobile> {
  List<MapObject> _mapObjects = [];
  late YandexMapController _controller;

  final _animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 0.2);

  _MapScreenMobileState(List<MapPoint> points) : super(points);

  Future<bool> get locationPermissionNotGranted async =>
      !(await Permission.location.request().isGranted);

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
              widget.showMessage(points[i].info!);
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
    AndroidYandexMap.useAndroidViewSurface = false;
    return Stack(children: [
      YandexMap(
        logoAlignment: const MapAlignment(
          horizontal: HorizontalAlignment.left,
          vertical: VerticalAlignment.top,
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
                child: const Icon(
                  Icons.add,
                  color: Color(0xFF3F7DFE),
                ),
                backgroundColor: Colors.white,
                onPressed: () async {
                  await _controller.moveCamera(
                    CameraUpdate.zoomIn(),
                    animation: _animation,
                  );
                },
              ),
              FloatingActionButton.small(
                child: const Icon(
                  Icons.remove,
                  color: Color(0xFF3F7DFE),
                ),
                backgroundColor: Colors.white,
                onPressed: () async {
                  await _controller.moveCamera(
                    CameraUpdate.zoomOut(),
                    animation: _animation,
                  );
                },
              ),
              const SizedBox(height: 180.0),
              FloatingActionButton.small(
                child: const Icon(
                  Icons.gps_fixed,
                  color: Color(0xFF3F7DFE),
                ),
                backgroundColor: Colors.white,
                onPressed: () async {
                  if (await locationPermissionNotGranted) {
                    widget.showMessage("Location permission was NOT granted");
                    return;
                  }

                  final CameraPosition? userPosition =
                      await _controller.getUserCameraPosition();

                  if (userPosition != null) {
                    await _controller.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: userPosition.target,
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 130.0)
            ],
          ),
          const SizedBox(width: 16.0)
        ],
      ),
    ]);
  }
}
