
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

class AddNewWidget extends StatelessWidget {

  final SvgGenImage image = Assets.lib.assets.images.plus;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        // ignore: prefer_const_literals_to_create_immutables
        child: Row(children: [
            // ignore: prefer_const_constructors
            Container(
              child: image.svg(color: Colors.white, height: 12.0, width: 12.0),
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              decoration: BoxDecoration(
              color: const Color(0xFF3A83F1),
              borderRadius: BorderRadius.circular(4.0)
              )
            ),
            const SizedBox(width: 14),
            const Text(
              "Открыть новый продукт",   
              style: TextStyle(
                color: Color(0xFFE4E8EE),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.sfProText
                )
              )
        ],
         mainAxisSize: MainAxisSize.min,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: const Color(0xFF272C35),
          borderRadius: BorderRadius.circular(0.0)
        )
      ),
    );
  }
}