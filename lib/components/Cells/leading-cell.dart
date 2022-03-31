import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

class LeadingCellWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final String title;
  const LeadingCellWidget({Key? key, this.onPressed, required this.title})
      : super(key: key);

  @override
  State<LeadingCellWidget> createState() => _LeadingCellWidgetState();
}

class _LeadingCellWidgetState extends State<LeadingCellWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Container(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, bottom: 16.0, top: 16.0),
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: AppThemeProvider.of(context)
              .colors
              .backgroundAdditional
              .color(opacity: _opacity),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          widget.title,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: AppThemeProvider.of(context)
                  .colors
                  .textPrimary
                  .color(opacity: _opacity),
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