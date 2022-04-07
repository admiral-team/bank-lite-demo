import 'package:bank_lite/screens/home_screen.dart';
import 'package:bank_lite/service/home_service.dart';
import 'package:bank_lite/storage/locale_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/airbar.dart';
import '../generated/assets.gen.dart';
import 'in_progress.dart';
import '../l10n/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
    _configureLanguage();

    final items = [
      AirbarItem(
          title: AppLocalizations.of(context).main,
          content: Assets.lib.assets.images.appbarMain),
      AirbarItem(
          title: AppLocalizations.of(context).payments,
          content: Assets.lib.assets.images.appbarPayments),
      AirbarItem(
          title: AppLocalizations.of(context).services,
          content: Assets.lib.assets.images.appbarServices),
      AirbarItem(
          title: AppLocalizations.of(context).chat,
          content: Assets.lib.assets.images.appbarChat),
    ];

    return Stack(children: [
      _currentScreen(context),
      SafeArea(
          child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 8),
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

  Widget _currentScreen(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen(
            request: () =>
                _service.homeItems(context).then((value) => value.items));
      case 1:
        return const InProgress(appBarHidden: true);
      case 2:
        return const InProgress(appBarHidden: true);
      case 3:
        return const InProgress(appBarHidden: true);
      case 4:
        return const InProgress(appBarHidden: true);
    }

    throw Exception('Screen not found');
  }

  void _configureLanguage() {
    if (kIsWeb) {
      return;
    }
    final futureLanguage = LanguageStorage().getLocaleFromStorage();
    futureLanguage.then((value) {
        if (value != null) {
          context.read<LocaleProvider>().setLocaleByString(value);
        }
      },
    );
  }
}
