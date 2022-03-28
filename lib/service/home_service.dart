import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/home_model.dart';
import 'package:bank_lite/generated/assets.gen.dart';

class HomeItemsResponse {
  final List<HomeScreenModel> items;
  const HomeItemsResponse({ required this.items });
}

class HomeService {
  static final shared = HomeService();

  Future<HomeItemsResponse> homeItems() async {
    readJson();
    return Future<HomeItemsResponse>.delayed(const Duration(seconds: 2), () {
      return HomeItemsResponse(items: [
        BannerScreenModel(onClosePressed: () {}),
        CardCellModel(
            title: "Цифровая Мультикарта",
            balance: "2 000 ₽",
            cardNumber: "• 2104",
            icon: Assets.lib.assets.images.card,
            addPressed: () {
              print("TAP add Pressed");
            },
            sendPressed: () {
              print("TAP send Pressed");
            }),
        CardsWidgetModel(),
        SuggestionsCellModel(),
        AddNewModel(onPressed: () {})
      ]);
    });
  }

Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/assets/json/sample.json');
    final data = await json.decode(response);
    print(data["items"]);
  }

}