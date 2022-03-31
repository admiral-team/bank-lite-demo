import 'package:flutter/material.dart';

class ColorWrapper {
  final int value;
  const ColorWrapper(this.value);

  Color color() {
    return Color(value);
  }
}