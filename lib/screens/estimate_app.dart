import 'package:bank_lite/components/status_widget.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/components/action_window.dart';
import 'package:flutter/material.dart';

class EstimateApp extends StatelessWidget {
  const EstimateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3A83F1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xFF1C2026),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF1C2026),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ActionWindowWidget(
            onClosePressed: () {
              Navigator.of(context).pop();
            },
            statuswidgetModel: StatusWidgetModel(
              title: "Оценить приложение",
              description:
                  "Мы постоянно развиваем наше приложение, будем рады получить от вас оценку в AppStore",
              image: Assets.lib.assets.images.heart.svg(color: const Color(0xFF28B5FF)),
              imageContainer: BoundingBox(width: 120.0, height: 120.0),
              titleContainerHeight: 64,
            ),
          ),
        ),
      ),
    );
  }
  
}
