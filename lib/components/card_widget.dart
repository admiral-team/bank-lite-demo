import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import '../generated/assets.gen.dart';

class CardModel {
  final String title;
  final String? lastNumbers;
  final SvgGenImage image;

  const CardModel({
    required this.title,
    required this.image,
    this.lastNumbers,
  });
}

class CardWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final CardModel model;

  const CardWidget({
    Key? key,
    required this.model,
    this.onPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    List<Widget> widgets = [
      widget.model.image.svg(),
      const SizedBox(width: 16),
      Text(
        widget.model.title,
        overflow: TextOverflow.ellipsis,
        style: fonts.headline.toTextStyle(colors.textPrimary.color()),
      ),
    ];

    if (widget.model.lastNumbers != null) {
      widgets.addAll([
        const Spacer(),
        Text(
          widget.model.lastNumbers!,
          style: fonts.subhead3.toTextStyle(colors.textSecondary.color()),
        )
      ]);
    }

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Opacity(
        opacity: _opacity,
        child: Container(
          decoration: BoxDecoration(
            color: colors.backgroundAdditional.color(),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          height: 64,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: widgets,
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
