import 'package:bank_lite/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../components/airbar.dart';
import '../components/appbar_main.dart';
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
        return const AppBarMain();
      case 2:
        return Container(color: Colors.green);
      case 3:
        return Container(color: Colors.red);
      case 4:
        return Container(color: Colors.blue);
    }

    throw Exception('Screen not found');
  }
}
