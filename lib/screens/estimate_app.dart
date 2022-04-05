import 'package:bank_lite/components/action_window.dart';
import 'package:bank_lite/components/status_widget.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EstimateApp extends StatelessWidget {
  const EstimateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Assets.lib.assets.images.icBack.svg(
              height: 30.0, width: 30.0, color: colors.elementsAccent.color()),
          onPressed: () => Navigator.of(context).pop(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundAdditional.color(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: colors.backgroundAdditional.color(),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ActionWindowWidget(
            onClosePressed: () {
              Navigator.of(context).pop();
            },
            statusWidgetModel: StatusWidgetModel(
              title: AppLocalizations.of(context).rateTheApp,
              description: AppLocalizations.of(context).rateTheAppDescription,
              image: Assets.lib.assets.images.heart.svg(
                color: colors.elementsAccent.color(),
              ),
              imageContainer: BoundingBox(width: 120.0, height: 120.0),
              titleContainerHeight: 64,
            ),
          ),
        ),
      ),
    );
  }
}
