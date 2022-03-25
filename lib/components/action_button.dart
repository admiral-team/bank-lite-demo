import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

enum ActionButtonStyle {
  regular,
  textError,
}

class ActionButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final ActionButtonStyle style;
  final String title;
  const ActionButtonWidget(
      {Key? key, this.onPressed, required this.style, required this.title})
      : super(key: key);

  @override
  State<ActionButtonWidget> createState() => _ActionButtonWidgetWidgetState();
}

class _ActionButtonWidgetWidgetState extends State<ActionButtonWidget> {

  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    
    final Color textColor;
    switch (widget.style) {
    case ActionButtonStyle.regular:
      textColor = Color(0xFF5594F1);
      break;
    case ActionButtonStyle.textError:
      textColor = Color(0xFFEC5851);
      break;
    }

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Opacity(
        opacity: _opacity,
        child: Container(
          width: 147,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF363E49),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            "Понятно",
            style: TextStyle(
                color: textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                fontFamily: FontFamily.sfProDisplay),
          ),
        ),
      ),
    );
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _opacity = highlighted ? 0.7 : 1.0;
    });
  }
}