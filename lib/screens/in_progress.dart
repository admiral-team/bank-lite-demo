import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/components/status_widget.dart';
import 'package:flutter/material.dart';

class InProgress extends StatelessWidget {
  final bool appBarHidden;

  const InProgress({Key? key, this.appBarHidden = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarHidden
          ? null
          : AppBar(
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
        child: StatusWidget(
          model: StatusWidgetModel(
            title: "Раздел находится в разработке",
            description: "\n\n",
            image: Assets.lib.assets.images.luckStatus
                .svg(color: const Color(0xFF28B5FF), width: 65, height: 53),
            imageContainer: BoundingBox(width: 100.0, height: 100.0),
            titleContainerHeight: 64,
          ),
        ),
      ),
    );
  }
}
