import 'package:bank_lite/components/addnew.dart';
import 'package:bank_lite/components/appbar_main.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/material.dart';

import '../components/card_cell.dart';
import '../components/card_widget.dart';
import '../components/cards_widget.dart';

abstract class HomeScreenModel {
  //
}

class BannerScreenModel extends HomeScreenModel {
  VoidCallback? onPressed;
  BannerScreenModel({required this.onPressed});
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<HomeScreenModel> _items = [
    BannerScreenModel(onPressed: () {}),
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
    CardsWidgetModel()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xFF1D2128),
      child: Column(children: [
        AppBarMain(
          onPressedLeftButton: () {
            print("onPressedLeftButton");
          }, onPressedRightButton: () {
            print("onPressedRightButton");
        }),
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: _items.length,
              itemBuilder: (ctx, index) {
                final item = _items[index];
                if (item is BannerScreenModel) {
                  return AddNewWidget(onPressed: item.onPressed);
                } else if (item is CardCellModel) {
                  return CardCellWidget(
                          title: item.title,
                          balance: item.balance,
                          cardNumber: item.cardNumber,
                          icon: item.icon,
                          addPressed: item.addPressed,
                          sendPressed: item.sendPressed);
                } else if (item is CardsWidgetModel) {
                  return CardsWidget(
                      collapsed: true,
                      cards: [
                        CardModel(
                          title: "Сбербанк",
                          lastNumbers: "• 3267",
                          image: Assets.lib.assets.images.cardVisa,
                        )
                      ],
                      onAddNewCardPressed: () {
                        print("onAddNewCardPressed pressed");
                      },
                      onCardPressed: (cardModel) {
                        print("onCardPressed pressed ${cardModel.title}");
                      }
                  );
                }
                return Container();
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(height: 8);
              }),
        ),
      ]),
    );
  }
}
