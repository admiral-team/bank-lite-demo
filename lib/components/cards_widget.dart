import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:collapsible/collapsible.dart';
import '../generated/assets.gen.dart';
import '../screens/home_screen.dart';
import 'card_widget.dart';

class CardsWidgetModel extends HomeScreenModel {}

class CardsWidget extends StatefulWidget {
  final bool collapsed;
  final List<CardModel> cards;
  final VoidCallback onAddNewCardPressed;
  final void Function(CardModel) onCardPressed;

  const CardsWidget({
    Key? key,
    required this.collapsed,
    required this.cards,
    required this.onAddNewCardPressed,
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
          title: "Добавить карту другого банка",
          image: Assets.lib.assets.images.cardAdd,
        ),
        onPressed: widget.onAddNewCardPressed,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF272C35),
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
            child: Opacity(
              opacity: _opacity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  const Text(
                    "Привязанные карты",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.sfProText),
                  ),
                  const SizedBox(width: 6),
                  (_collapsed ? arrowDown : arrowUp).svg(
                    color: const Color(0xFF99A0AB),
                    height: 24.0,
                    width: 24.0,
                  ),
                ],
              ),
            ),
          ),
          Collapsible(
            collapsed: _collapsed,
            axis: CollapsibleAxis.vertical,
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
              // [
              //   const SizedBox(height: 8),
              //   ListView.builder(
              //     itemCount: _cards.length,
              //     itemBuilder: (context, index) {
              //       return CardWidget(
              //         model: _cards[index],
              //       );
              //     },
              //   ),
              //   CardWidget(
              //     model: CardModel(
              //       title: "Добавить карту другого банка",
              //       image: Assets.lib.assets.images.cardAdd,
              //     ),
              //   ),
              // ],
            ),
          ),
        ],
      ),
    );

    // Column(
    //   mainAxisSize: MainAxisSize.min,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     const SizedBox(height: 8),
    //     CardWidget(
    //       title: "Сбербанк",
    //       lastNumbers: "• 3267",
    //       image: Assets.lib.assets.images.cardVisa,
    //     ),
    //     CardWidget(
    //       title: "Добавить карту другого банка",
    //       image: Assets.lib.assets.images.cardAdd,
    //     ),
    //   ],
    // ),
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _opacity = highlighted ? 0.7 : 1.0;
    });
  }
}
