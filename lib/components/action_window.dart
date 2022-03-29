import 'package:bank_lite/components/action_button.dart';
import 'package:bank_lite/components/status_widget.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class ActionWindowWidget extends StatefulWidget {
  final VoidCallback? onClosePressed;
  final StatusWidgetModel statuswidgetModel;
  const ActionWindowWidget({
    Key? key, 
    this.onClosePressed, 
    required this.statuswidgetModel,
  }) : super(key: key);

  @override
  State<ActionWindowWidget> createState() => _ActionWindowWidgetState();
}

class _ActionWindowWidgetState extends State<ActionWindowWidget> {
  final SvgGenImage closeIcon = Assets.lib.assets.images.close;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 352,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0F1116),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    icon: closeIcon.svg(color: const Color(0xFF5594F1)),
                    onPressed: widget.onClosePressed,
                  ),
                ),
              ],
            ),
          ),
          StatusWidget(
            model: StatusWidgetModel(
              description: widget.statuswidgetModel.description,
              title: widget.statuswidgetModel.title,
              image: widget.statuswidgetModel.image,
              imageContainer: widget.statuswidgetModel.imageContainer,
              titleContainerHeight: 28.0
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ActionButtonWidget(
                style: ActionButtonStyle.regular,
                title: "Действие",
              ),
              SizedBox(width: 8),
              ActionButtonWidget(
                style: ActionButtonStyle.textError,
                title: "Действие",
              ),
            ],
          )
        ],
      ),
    );
  }
}