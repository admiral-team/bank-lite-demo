import 'package:bank_lite/components/primary_button.dart';
import 'package:bank_lite/components/status_widget.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;

    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          child: Assets.lib.assets.images.icBack.svg(
            height: 40.0,
            color: colors.elementsAccent.color(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Container(
        color: colors.backgroundBasic.color(),
        child: Column(
          children: [
            const Spacer(),
            StatusWidget(
              model: StatusWidgetModel(
                title: AppLocalizations.of(context).requestDenied,
                description:
                    AppLocalizations.of(context).requestDeniedDescription,
                image: Assets.lib.assets.images.luckStatus.svg(
                  color: colors.elementsAccent.color(),
                  width: 65,
                  height: 53,
                ),
                imageContainer: BoundingBox(width: 100.0, height: 100.0),
                titleContainerHeight: 64,
              ),
            ),
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
              child: PrimaryButtonWidget(
                title: AppLocalizations.of(context).understandablyButton,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
