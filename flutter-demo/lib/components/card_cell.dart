import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO: Opacity animation on buttons: spacing between buttons
class CardCellWidget extends StatelessWidget {
  final String title;
  final String balance;
  final String cardNumber;
  final SvgGenImage icon;
  final VoidCallback? addPressed;
  final VoidCallback? sendPressed;

  const CardCellWidget({
    Key? key,
    required this.title,
    required this.balance,
    required this.cardNumber,
    required this.icon,
    this.addPressed,
    this.sendPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;

    List<Widget> widgets = [];
    widgets = [
      _CarInfoWidget(
          title: title,
          balance: balance,
          cardNumber: cardNumber,
          icon: icon,
          addPressed: addPressed,
          sendPressed: sendPressed),
      // const SizedBox(height: 16.0),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, top: 12, bottom: 16),
      decoration: BoxDecoration(
        color: colors.backgroundAdditional.color(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: widgets),
    );
  }
}

class _CarInfoWidget extends StatelessWidget {
  final String title;
  final String balance;
  final String cardNumber;
  final SvgGenImage icon;
  final VoidCallback? addPressed;
  final VoidCallback? sendPressed;

  const _CarInfoWidget({
    Key? key,
    required this.title,
    required this.balance,
    required this.cardNumber,
    required this.icon,
    required this.addPressed,
    required this.sendPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 6),
          child: icon.svg(height: 28.0, width: 38.0),
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: fonts.headline.toTextStyle(colors.textPrimary.color()),
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  cardNumber,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style:
                      fonts.subhead3.toTextStyle(colors.textSecondary.color()),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              balance,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: fonts.subtitle2.toTextStyle(colors.textAccent.color()),
            ),
            const SizedBox(height: 12.0),
            _CardButtons(
              addPressed: () => addPressed?.call(),
              sendPressed: () => sendPressed?.call(),
            ),
          ],
        ),
      ],
    );
  }
}

class _CardButtons extends StatelessWidget {
  final VoidCallback addPressed;
  final VoidCallback sendPressed;

  const _CardButtons(
      {Key? key, required this.addPressed, required this.sendPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // const SizedBox(width: 72.0),
      CardButtonWidget(
          title: AppLocalizations.of(context).deposit,
          icon: Assets.lib.assets.images.add,
          onPressed: addPressed),
      const SizedBox(width: 16.0),
      CardButtonWidget(
          title: AppLocalizations.of(context).pay,
          icon: Assets.lib.assets.images.send,
          onPressed: sendPressed),
    ]);
  }
}

class CardButtonWidget extends StatefulWidget {
  final String title;
  final SvgGenImage icon;
  final VoidCallback? onPressed;

  const CardButtonWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  State<CardButtonWidget> createState() => _CardButtonWidgetState();
}

class _CardButtonWidgetState extends State<CardButtonWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Container(
        padding: const EdgeInsets.only(
            left: 12.0, top: 10.0, right: 12.0, bottom: 10.0),
        height: 36.0,
        decoration: BoxDecoration(
          color: colors.backgroundSelected.color(),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
            opacity: _opacity,
            child: widget.icon.svg(height: 16.0, width: 16.0),
          ),
          const SizedBox(width: 8.0),
          Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: fonts.subhead3
                .toTextStyle(colors.elementsAccent.color(opacity: _opacity)),
          ),
        ]),
      ),
    );
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _opacity = highlighted ? 0.6 : 1.0;
    });
  }
}
