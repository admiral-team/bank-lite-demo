import 'package:bank_lite/components/map/models/map_position.dart';

class MapPoint {
  final MapPosition position;
  final String? info;

  const MapPoint({
    required this.position,
    this.info,
  });
}