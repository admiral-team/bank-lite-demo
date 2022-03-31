import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNewWidget extends StatefulWidget {
  final VoidCallback? onPressed;

  const AddNewWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  State<AddNewWidget> createState() => _AddNewWidgetState();
}

class _AddNewWidgetState extends State<AddNewWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    final SvgGenImage image = Assets.lib.assets.images.plus;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Container(
        width: double.infinity,
        height: 74.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: 28.0,
              height: 22.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppThemeProvider.of(context)
                    .colors
                    .elementsAccent
                    .color(opacity: _opacity),
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: image.svg(
                color: AppThemeProvider.of(context)
                    .colors
                    .elementsStaticWhite
                    .color(opacity: _opacity),
              ),
            ),
            const SizedBox(width: 14.0),
            Text(
              AppLocalizations.of(context).addNewProductButton,
              style: TextStyle(
                  color: AppThemeProvider.of(context)
                      .colors
                      .textPrimary
                      .color(opacity: _opacity),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.sfProText),
            )
          ],
          mainAxisSize: MainAxisSize.min,
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
