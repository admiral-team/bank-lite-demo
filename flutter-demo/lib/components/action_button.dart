import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    final Color textColor;
    switch (widget.style) {
      case ActionButtonStyle.regular:
        textColor = colors.textAccent.color(opacity: _opacity);
        break;
      case ActionButtonStyle.textError:
        textColor = colors.textError.color(opacity: _opacity);
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
          color: colors.backgroundSelected.color(opacity: _opacity),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          AppLocalizations.of(context).actionButton,
          style: fonts.headline.toTextStyle(textColor),
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
