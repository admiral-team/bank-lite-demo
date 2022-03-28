import 'package:bank_lite/screens/home_screen.dart';
import 'package:bank_lite/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/airbar.dart';
import '../generated/assets.gen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  final _service = HomeService.shared;

  @override
  Widget build(BuildContext context) {
    final items = [
      AirbarItem(
          title: AppLocalizations.of(context).main,
          content: Assets.lib.assets.images.appbarMain),
      AirbarItem(
          title: AppLocalizations.of(context).payments, content: Assets.lib.assets.images.appbarPayments),
      AirbarItem(
          title: AppLocalizations.of(context).services, content: Assets.lib.assets.images.appbarServices),
      AirbarItem(title: AppLocalizations.of(context).chat, content: Assets.lib.assets.images.appbarChat),
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
        return HomeScreen(request: () => _service.homeItems().then((value) => value.items));
      case 1:
        return Container(color: Colors.blueGrey);
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
