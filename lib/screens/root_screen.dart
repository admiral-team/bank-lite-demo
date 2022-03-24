import 'package:bank_lite/screens/home_screen.dart';
import 'package:bank_lite/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../components/airbar.dart';
import '../generated/assets.gen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = [
      AirbarItem(
          title: "Главный", content: Assets.lib.assets.images.appbarMain),
      AirbarItem(
          title: "Платежи", content: Assets.lib.assets.images.appbarPayments),
      AirbarItem(
          title: "Услуги", content: Assets.lib.assets.images.appbarServices),
      AirbarItem(title: "Чат", content: Assets.lib.assets.images.appbarChat),
    ];

    return Stack(children: [
      _currentScreen(),
      SafeArea(
          child: Container(
        alignment: Alignment.bottomCenter,
        child: Airbar(
            selectedIndex: _selectedIndex,
            items: items,
            onPressed: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
        ),
      ))
    ]);
  }

  Widget _currentScreen() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return Container(color: Colors.blueGrey);
      case 2:
        return const MapScreen(points: [
          Point(latitude: 55.7520, longitude: 37.3175),
          Point(latitude: 53.8520, longitude: 37.8175),
          Point(latitude: 56.9520, longitude: 37.5175),
          Point(latitude: 57.0520, longitude: 37.6175),
          Point(latitude: 59.1520, longitude: 38.7175),
          Point(latitude: 59.2520, longitude: 34.8175),
          Point(latitude: 57.3520, longitude: 37.9175),
          Point(latitude: 57.6520, longitude: 37.6175),
          Point(latitude: 57.8520, longitude: 37.2175),
          Point(latitude: 52.9520, longitude: 37.8175),
        ],);
      case 3:
        return Container(color: Colors.red);
      case 4:
        return Container(color: Colors.blue);
    }

    throw Exception('Screen not found');
  }
}
