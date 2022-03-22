import 'package:bank_lite/components/addnew.dart';
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
      alignment: Alignment.center,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
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
                  return Container(
                      height: 50.0, width: double.infinity, color: Colors.red);
                case 3:
                  return Container(
                      height: 50.0, width: double.infinity, color: Colors.blue);
              }
              return Container();
            } else {
              return Container();
            }
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(height: 8);
          }),
    );
  }
}
