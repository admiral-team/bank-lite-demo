import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
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
        textColor = AppThemeProvider.of(context).colors.textAccent.color();
        break;
      case ActionButtonStyle.textError:
        textColor = AppThemeProvider.of(context).colors.textError.color();
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
            color:
                AppThemeProvider.of(context).colors.backgroundSelected.color(),
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
