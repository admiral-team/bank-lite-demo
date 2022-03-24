import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  final List<Point> points;

  const MapScreen({
    Key? key,
    required this.points,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<MapObject> _mapObjects = [];
  late YandexMapController _controller;

  final _initialPosition = const Point(latitude: 55.7520, longitude: 37.3175);

  final _animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 0.2);

  Future<bool> get locationPermissionNotGranted async =>
      !(await Permission.location.request().isGranted);

  void _showMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF343C48),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    List<MapObject> placeMarks = [];
    for (var i = 0; i < widget.points.length; i++) {
      placeMarks.add(
        Placemark(
          mapId: MapObjectId('place_mark_$i'),
          point: widget.points[i],
          onTap: (Placemark self, Point point) {
            _showMessage("Point clicked:\n$point");
          },
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                Assets.lib.assets.images.place.path,
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
                target: _initialPosition,
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
                    _showMessage("Location permission was NOT granted");
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
