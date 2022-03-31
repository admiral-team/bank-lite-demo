import 'package:bank_lite/components/status_widget.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/components/primary_button.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppThemeProvider.of(context).colors.elementsAccent.color(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: AppThemeProvider.of(context).colors.backgroundBasic.color(),
      ),
      body: Container(
        color: AppThemeProvider.of(context).colors.backgroundBasic.color(),
        child: Column(
          children: [
            const Spacer(),
            StatusWidget(
              model: StatusWidgetModel(
                title: "Запрос отклонен",
                description:
                    "Текст с комментарием к статусу, здесь нужно дать более подробную расшифровку к статусу операции, можно несколько строк",
                image: Assets.lib.assets.images.luckStatus
                    .svg(color: AppThemeProvider.of(context).colors.elementsAccent.color(), width: 65, height: 53),
                imageContainer: BoundingBox(width: 100.0, height: 100.0),
                titleContainerHeight: 64,
              ),
            ),
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
              child: PrimaryButtonWidget(
                title: "Понятно",
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
