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
        textColor = Color.fromRGBO(85, 148, 241, _opacity);
        break;
      case ActionButtonStyle.textError:
        textColor = Color.fromRGBO(236, 88, 81, _opacity);
        break;
    }

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Container(
        width: 147,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(54, 62, 73, _opacity),
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
    );
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _opacity = highlighted ? 0.7 : 1.0;
    });
  }
}
