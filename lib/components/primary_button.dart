import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final String title;
  const PrimaryButtonWidget({Key? key, this.onPressed, required this.title})
      : super(key: key);

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(85, 148, 241, _opacity),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Text(
          widget.title,
          style: TextStyle(
              color: Color.fromRGBO(228, 232, 238, _opacity),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.sfProText),
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
