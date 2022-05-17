import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/theme/font_wrapper.dart';
import 'package:flutter/widgets.dart';

class FontPalette {
  final FontWrapper largeTitle1;
  final FontWrapper largeTitle2;
  final FontWrapper title1;
  final FontWrapper title2;
  final FontWrapper subtitle1;
  final FontWrapper subtitle2;
  final FontWrapper subtitle3;
  final FontWrapper headline;
  final FontWrapper body1;
  final FontWrapper body2;
  final FontWrapper subhead1;
  final FontWrapper subhead2;
  final FontWrapper subhead3;
  final FontWrapper subhead4;
  final FontWrapper caption1;
  final FontWrapper caption2;
  final FontWrapper caption3;
  final FontWrapper navbar;

  const FontPalette({
    required this.largeTitle1,
    required this.largeTitle2,
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.headline,
    required this.body1,
    required this.body2,
    required this.subhead1,
    required this.subhead2,
    required this.subhead3,
    required this.subhead4,
    required this.caption1,
    required this.caption2,
    required this.caption3,
    required this.navbar,
  });
}

const defaultFontPalette = FontPalette(
  largeTitle1: FontWrapper(
    fontSize: 32,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w700,
  ),
  largeTitle2: FontWrapper(
    fontSize: 28,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w700,
  ),
  title1: FontWrapper(
    fontSize: 22,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w700,
  ),
  title2: FontWrapper(
    fontSize: 22,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w500,
  ),
  subtitle1: FontWrapper(
    fontSize: 18,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w700,
  ),
  subtitle2: FontWrapper(
    fontSize: 18,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w600,
  ),
  subtitle3: FontWrapper(
    fontSize: 18,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w400,
  ),
  headline: FontWrapper(
    fontSize: 16,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w600,
  ),
  body1: FontWrapper(
    fontSize: 16,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w500,
  ),
  body2: FontWrapper(
    fontSize: 16,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w400,
  ),
  subhead1: FontWrapper(
    fontSize: 14,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w700,
  ),
  subhead2: FontWrapper(
    fontSize: 14,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w600,
  ),
  subhead3: FontWrapper(
    fontSize: 14,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w500,
  ),
  subhead4: FontWrapper(
    fontSize: 14,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w400,
  ),
  caption1: FontWrapper(
    fontSize: 12,
    fontFamily: FontFamily.sfProText,
    fontWeight: FontWeight.w500,
  ),
  caption2: FontWrapper(
    fontSize: 10,
    fontFamily: FontFamily.sfProText,
    fontWeight: FontWeight.w500,
  ),
  caption3: FontWrapper(
    fontSize: 12,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w700,
  ),
  navbar: FontWrapper(
    fontSize: 17,
    fontFamily: FontFamily.sfProDisplay,
    fontWeight: FontWeight.w600,
  ),
);
