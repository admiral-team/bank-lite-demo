import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/assets.gen.dart';

// TODO: Open / close widget

class CardsWidget extends StatefulWidget {
  const CardsWidget({Key? key}) : super(key: key);

  // TODO: add isExapndded property
  // TODO: add list of cards instead of mock

  @override
  State<StatefulWidget> createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> {
  @override
  Widget build(BuildContext context) {
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
            Row(
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
                Assets.lib.assets.images.arrowUp24.svg(
                  color: const Color(0xFF99A0AB),
                  height: 24.0,
                  width: 24.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            CardWidget(
              title: "Сбербанк",
              lastNummbers: "• 3267",
              image: Assets.lib.assets.images.cardVisa,
            ),
            CardWidget(
              title: "Добавить карту другого банка",
              image: Assets.lib.assets.images.cardAdd,
            ),
          ],
        ));
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String? lastNummbers;
  final SvgGenImage image;
  final VoidCallback? onPressed;

  const CardWidget({
    Key? key,
    required this.title,
    required this.image,
    this.lastNummbers,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      image.svg(),
      const SizedBox(width: 16),
      Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.sfProText),
      ),
    ];

    if (lastNummbers != null) {
      widgets.addAll([
        const Spacer(),
        Text(
          lastNummbers!,
          style: const TextStyle(
              color: Color(0xFF99A0AB),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.sfProText),
        ),
      ]);
    }

    return CupertinoButton(
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF272C35),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            height: 64,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: widgets,
            ),),
        onPressed: () => onPressed?.call(),
    );
  }
}
