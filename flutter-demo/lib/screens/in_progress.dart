import 'package:bank_lite/components/status_widget.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/helpers/router.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InProgress extends StatelessWidget {
  final bool appBarHidden;

  const InProgress({Key? key, this.appBarHidden = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    const router = BaseRouter();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarHidden
          ? null
          : AppBar(
              leading: CupertinoButton(
                child: const Icon(Icons.arrow_back_ios),
                onPressed: () => router.popScreen(context),
              ),
              bottomOpacity: 0.0,
              elevation: 0.0,
              backgroundColor: colors.backgroundBasic.color(),
            ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: colors.backgroundBasic.color(),
          padding: const EdgeInsets.all(16.0),
          child: StatusWidget(
            model: StatusWidgetModel(
              title: AppLocalizations.of(context).sectionIsUnderDevelopment,
              description: "",
              image: Assets.lib.assets.images.luckStatus.svg(
                color: colors.elementsAccent.color(),
                width: 65,
                height: 53,
              ),
              imageContainer: BoundingBox(width: 100.0, height: 120.0),
              titleContainerHeight: 64,
            ),
          ),
        ),
      ),
    );
  }
}
