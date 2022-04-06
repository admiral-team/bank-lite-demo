import 'package:bank_lite/components/map/map.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/screens/estimate_app.dart';
import 'package:bank_lite/screens/settings_screen.dart';
import 'package:bank_lite/screens/status_screen.dart';
import 'package:bank_lite/screens/theme_settings_screen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/Cells/leading_cell.dart';
import 'in_progress.dart';

enum _MultiCardActionType {
  map,
  estimate,
  addRequest,
  transactions,
  themeSettings,
  changeLanguage
}

class MultiCardScreen extends StatefulWidget {
  const MultiCardScreen({Key? key}) : super(key: key);

  @override
  State<MultiCardScreen> createState() => _MultiCardScreenState();
}

class _ListCellModel {
  final String title;
  final _MultiCardActionType type;

  _ListCellModel({required this.title, required this.type});
}

class _MultiCardScreenState extends State<MultiCardScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    List<_ListCellModel> items = [
      _ListCellModel(
        title: AppLocalizations.of(context).atmsOnTheMap,
        type: _MultiCardActionType.map,
      ),
      _ListCellModel(
        title: AppLocalizations.of(context).rateTheApp,
        type: _MultiCardActionType.estimate,
      ),
      _ListCellModel(
        title: AppLocalizations.of(context).submitRequest,
        type: _MultiCardActionType.addRequest,
      ),
      _ListCellModel(
        title: AppLocalizations.of(context).transferMoney,
        type: _MultiCardActionType.transactions,
      ),
      _ListCellModel(
        title: AppLocalizations.of(context).customizeAppTheme,
        type: _MultiCardActionType.themeSettings,
      ),
      _ListCellModel(
        title: AppLocalizations.of(context).changeLanguage,
        type: _MultiCardActionType.changeLanguage,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).multicard),
        titleTextStyle: fonts.navbar.toTextStyle(colors.textPrimary.color()),
        centerTitle: true,
        leading: CupertinoButton(
          child: Assets.lib.assets.images.icBack.svg(
            height: 40,
            color: colors.elementsAccent.color(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: colors.backgroundBasic.color(),
        padding: const EdgeInsets.only(top: 20.0),
        alignment: Alignment.center,
        child: Expanded(
          child: ListView.separated(
            shrinkWrap: false,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              return _buildView(ctx, index, items);
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(height: 8);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildView(BuildContext ctx, int index, List<_ListCellModel> items) {
    _ListCellModel _model = items[index];
    switch (_model.type) {
      case _MultiCardActionType.map:
        return LeadingCellWidget(
            title: _model.title,
            onPressed: () {
              _pushScreen(MapWidget.instance);
            });

      case _MultiCardActionType.estimate:
        return LeadingCellWidget(
            title: _model.title,
            onPressed: () {
              _pushScreen(const EstimateApp());
            });

      case _MultiCardActionType.addRequest:
        return LeadingCellWidget(
            title: _model.title,
            onPressed: () {
              _pushScreen(const StatusScreen());
            });
      case _MultiCardActionType.transactions:
        return LeadingCellWidget(
            title: _model.title,
            onPressed: () {
              _pushScreen(const InProgress());
            });
      case _MultiCardActionType.themeSettings:
        return LeadingCellWidget(
            title: _model.title,
            onPressed: () {
              _pushScreen(const ThemeSettingsScreen());
            });
      case _MultiCardActionType.changeLanguage:
        return LeadingCellWidget(
            title: _model.title,
            onPressed: () {
              _pushScreen(const LanguageSettingsScreen());
            });
    }
  }

  void _pushScreen(Widget widget) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => widget),
    );
  }
}
