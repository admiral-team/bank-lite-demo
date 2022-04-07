import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../generated/assets.gen.dart';
import 'card_widget.dart';

class CardsWidget extends StatefulWidget {
  final bool collapsed;
  final List<CardModel> cards;
  final VoidCallback onRecommendPressed;
  final void Function(CardModel) onCardPressed;

  const CardsWidget({
    Key? key,
    required this.collapsed,
    required this.cards,
    required this.onRecommendPressed,
    required this.onCardPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> {
  bool _collapsed = true;
  List<CardModel> _cards = [];
  double _opacity = 1.0;

  final SvgGenImage arrowUp = Assets.lib.assets.images.arrowUp24;
  final SvgGenImage arrowDown = Assets.lib.assets.images.arrowDown24;

  @override
  void initState() {
    super.initState();
    setState(() {
      _collapsed = widget.collapsed;
      _cards = widget.cards;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    List<Widget> widgets = [const SizedBox(height: 8)];
    for (var i = 0; i < _cards.length; i++) {
      widgets.add(
        CardWidget(
          model: _cards[i],
          onPressed: () {
            widget.onCardPressed(_cards[i]);
          },
        ),
      );
    }
    widgets.add(
      CardWidget(
        model: CardModel(
          title: AppLocalizations.of(context).addCard,
          image: Assets.lib.assets.images.cardAdd,
        ),
        onPressed: widget.onRecommendPressed,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundAdditional.color(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => {_collapsed = !_collapsed},
            onTapUp: (_) => setHighlighted(false),
            onTapDown: (_) => setHighlighted(true),
            onTapCancel: () => setHighlighted(false),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 16),
                Text(
                  AppLocalizations.of(context).linkedCards,
                  style: fonts.subtitle1.toTextStyle(
                    colors.textPrimary.color(opacity: _opacity),
                  ),
                ),
                const SizedBox(width: 6),
                (_collapsed ? arrowDown : arrowUp).svg(
                  color: colors.elementsSecondary.color(opacity: _opacity),
                  height: 24.0,
                  width: 24.0,
                ),
                const Spacer()
              ],
            ),
          ),
          Collapsible(
            collapsed: _collapsed,
            axis: CollapsibleAxis.vertical,
            clipBehavior: Clip.antiAlias,
            maintainState: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            ),
          ),
        ],
      ),
    );
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _opacity = highlighted ? 0.7 : 1.0;
    });
  }
}
