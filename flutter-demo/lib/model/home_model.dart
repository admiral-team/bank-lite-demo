import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/material.dart';

abstract class HomeScreenModel {
  //
}

class AddNewModel extends HomeScreenModel {
  VoidCallback? onPressed;

  AddNewModel({required this.onPressed});
}

class BannerScreenModel extends HomeScreenModel {
  VoidCallback? onClosePressed;

  BannerScreenModel({required this.onClosePressed});
}

class CardCellModel extends HomeScreenModel {
  final String title;
  final String balance;
  final String cardNumber;
  final SvgGenImage icon;
  final VoidCallback? addPressed;
  final VoidCallback? sendPressed;

  CardCellModel(
      {Key? key,
      required this.title,
      required this.balance,
      required this.cardNumber,
      required this.icon,
      this.addPressed,
      this.sendPressed});
}

class CardsWidgetModel extends HomeScreenModel {}

class SuggestionsCellModel extends HomeScreenModel {}