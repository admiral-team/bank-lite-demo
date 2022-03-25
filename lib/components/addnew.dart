import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class AddNewModel extends HomeScreenModel {
  VoidCallback? onPressed;

  AddNewModel({required this.onPressed});
}

class AddNewWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  const AddNewWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  State<AddNewWidget> createState() => _AddNewWidgetState();
}

class _AddNewWidgetState extends State<AddNewWidget> {
  // TODO: - Add setHighlighted as airbar
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    final SvgGenImage image = Assets.lib.assets.images.plus;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Opacity(
        opacity: _opacity,
        child: Container(
          width: double.infinity,
          height: 74.0,
          alignment: Alignment.center,
          color: const Color(0xFF1D2128),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 28.0,
                height: 22.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF3A83F1),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: image.svg(color: Colors.white),
              ),
              const SizedBox(width: 14.0),
              const Text(
                "Открыть новый продукт",
                style: TextStyle(
                    color: Color(0xFFE4E8EE),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.sfProText),
              )
            ],
            mainAxisSize: MainAxisSize.min,
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
