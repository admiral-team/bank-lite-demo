import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _moscowPosition = CameraPosition(
    target: LatLng(55.7520, 37.6175),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _moscowPosition,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        padding: const EdgeInsets.only(bottom: 80.0),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Reset'),
        icon: const Icon(Icons.my_location),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_moscowPosition));
  }
}
