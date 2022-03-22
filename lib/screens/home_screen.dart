import 'package:bank_lite/components/addnew.dart';
import 'package:bank_lite/components/appbar_main.dart';
import 'package:bank_lite/components/suggestions.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/material.dart';

import '../components/card_cell.dart';

abstract class HomeScreenModel {
  //
}

class BannerScreenModel extends HomeScreenModel {
  int index;

  BannerScreenModel({required this.index});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<HomeScreenModel> _items = [
    BannerScreenModel(index: 0),
    BannerScreenModel(index: 1),
    BannerScreenModel(index: 2),
    BannerScreenModel(index: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xFF1D2128),
      child: Column(children: [
        AppBarMain(onPressedLeftButton: () {
          print("onPressedLeftButton");
        }, onPressedRightButton: () {
          print("onPressedRightButton");
        }),
        Expanded(
          child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: _items.length,
              itemBuilder: (ctx, index) {
                final item = _items[index];
                if (item is BannerScreenModel) {
                  switch (item.index) {
                    case 0:
                      return AddNewWidget(onPressed: () {
                        print("TAP");
                      });
                    case 1:
                      return CardCellWidget(
                          title: "Цифровая Мультикарта",
                          balance: "2 000 ₽",
                          cardNumber: "• 2104",
                          icon: Assets.lib.assets.images.card,
                          addPressed: () {
                            print("TAP add Pressed");
                          },
                          sendPressed: () {
                            print("TAP send Pressed");
                          });
                    case 2:
                      return SuggestionWidget();
                    case 3:
                      return Container(
                          height: 50.0,
                          width: double.infinity,
                          color: Colors.blue);
                  }
                  return Container();
                } else {
                  return Container();
                }
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(height: 8);
              }),
        ),
      ]),
    );
  }
}

class SuggestionWidget extends StatefulWidget {
  const SuggestionWidget({Key? key}) : super(key: key);

  @override
  State<SuggestionWidget> createState() {
    return _SuggestionsState();
  }
}

class _SuggestionsState extends State<SuggestionWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = [
      SuggestionItem(
          title: "Пригласить друга",
          content: Assets.lib.assets.images.serviceLike),
      SuggestionItem(
          title: "Оплатить сотовую связь",
          content: Assets.lib.assets.images.serviceDone),
      SuggestionItem(
          title: "Перевести деньги",
          content: Assets.lib.assets.images.serviceNext),
      SuggestionItem(
          title: "Оплатить услуги ЖКХ",
          content: Assets.lib.assets.images.serviceHome),
    ];

    return Suggestions(
      items: items,
      selectedIndex: _selectedIndex,
      onPressed: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
