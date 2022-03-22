import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

// TODO: Opacity animation on buttons: spacing between buttons
class CardCellWidget extends StatelessWidget {
  final String title;
  final String balance;
  final String cardNumber;
  final SvgGenImage icon;
  final VoidCallback? addPressed;
  final VoidCallback? sendPressed;

  const CardCellWidget(
      {Key? key,
      required this.title,
      required this.balance,
      required this.cardNumber,
      required this.icon,
      this.addPressed,
      this.sendPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets = [
      _CarInfoWidget(
          title: title, balance: balance, cardNumber: cardNumber, icon: icon),
      const SizedBox(height: 8.0),
      _CardButtons(
          addPressed: () => addPressed?.call(),
          sendPressed: () => sendPressed?.call())
    ];

    return Container(
      padding:
          const EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 24.0),
      decoration: BoxDecoration(
        color: const Color(0xFF272C35),
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

  const _CarInfoWidget(
      {Key? key,
      required this.title,
      required this.balance,
      required this.cardNumber,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      icon.svg(height: 40.0, width: 40.0),
      const SizedBox(width: 16.0),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.sfProDisplay),
        ),
        const SizedBox(height: 4.0),
        Text(
          balance,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color(0xFF3A83F1),
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.sfProDisplay),
        ),
      ]),
      const Spacer(),
      Text(
        cardNumber,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.right,
        style: const TextStyle(
            color: Color(0xFF99A0AB),
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.sfProDisplay),
      )
    ]);
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
      const SizedBox(width: 72.0),
      SizedBox(
          height: 36.0,
          child: TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                  color: Color(0xFF3A83F1),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.sfProDisplay),
              backgroundColor: const Color(0xFF343C48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: addPressed,
            icon: Assets.lib.assets.images.add.svg(height: 16.0, width: 16.0),
            label: const Text('Пополнить'),
          )),
      const SizedBox(width: 16.0),
      SizedBox(
          height: 36.0,
          child: TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                  color: Color(0xFF3A83F1),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.sfProDisplay),
              backgroundColor: const Color(0xFF343C48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: sendPressed,
            icon: Assets.lib.assets.images.send.svg(height: 16.0, width: 16.0),
            label: const Text('Оплатить'),
          )),
    ]);
  }
}
