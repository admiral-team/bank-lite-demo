import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../model/home_model.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeItemsResponse {
  List<HomeScreenModel> items;

  HomeItemsResponse({required this.items});
}

class HomeService {
  static final shared = HomeService();

  Future<HomeItemsResponse> homeItems(BuildContext context) async {
    var itemsJSON = await readJson();
    var response = HomeItemsResponse(items: []);
    for (var item in itemsJSON) {
      switch (item["type"]) {
        case "Banner":
          response.items.add(BannerScreenModel(onClosePressed: () {}));
          break;
        case "Card":
          response.items.add(CardCellModel(
              title: AppLocalizations.of(context).digitalMulticard,
              balance: "2 000 ₽",
              cardNumber: "• 2104",
              icon: Assets.lib.assets.images.card,
              addPressed: () {
                // ignore: avoid_print
                print("TAP add Pressed");
              },
              sendPressed: () {
                // ignore: avoid_print
                print("TAP send Pressed");
              }));
          break;
        case "Cards":
          response.items.add(CardsWidgetModel());
          break;
        case "Suggestions":
          response.items.add(SuggestionsCellModel());
          break;
        case "AddNew":
          response.items.add(AddNewModel(onPressed: () {}));
          break;
      }
    }
    return response;
  }

  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString('lib/assets/json/items.json');
    return compute(parseItems, response);
  }

  List<dynamic> parseItems(String responseBody) {
    final data = json.decode(responseBody);
    return data["items"];
  }
}