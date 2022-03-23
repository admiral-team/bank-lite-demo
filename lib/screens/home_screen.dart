import 'dart:ffi';

import 'package:bank_lite/components/addnew.dart';
import 'package:bank_lite/components/banner.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/material.dart';

import '../components/card_cell.dart';
import '../components/cards.dart';

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

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Expanded(
          child: AnimatedList(
            key: _key,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
            initialItemCount: _items.length,
            itemBuilder: (ctx, index, animation) {      
              return Container(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: _buildItem(_items[index], index, animation),
              );
            },
          ),
        ),);
  }

  Widget _buildItem(HomeScreenModel item, int index, Animation<double> animation) {
    if (item is BannerScreenModel) {
      switch (item.index) {
        case 0:
          return SizeTransition(
            sizeFactor: animation,
            child: AddNewWidget(
              onPressed: () {
                print("TAP");
              },
            ),
          );
        case 1:
           return SizeTransition(
            sizeFactor: animation,
            child: CardCellWidget(
              title: "Цифровая Мультикарта",
              balance: "2 000 ₽",
              cardNumber: "• 2104",
              icon: Assets.lib.assets.images.card,
              addPressed: () {
                print("TAP add Pressed");
              },
              sendPressed: () {
                print("TAP send Pressed");
              },
            ),
          );
        case 2:
          return SizeTransition(
            sizeFactor: animation,
            child: BannerWidget(
              onClosePressed: () {
                setState(() {
                  _removeItem(index);
                });
              },
            ),
          );
        case 3:
          return SizeTransition(
            sizeFactor: animation,
            child: const CardsWidget(),
          );
      }
      return Container();
    } else {
      return Container();
    }
  }

  void _removeItem(int index) {
    HomeScreenModel item = _items.removeAt(index);
    // ignore: prefer_function_declarations_over_variables
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(item, index, animation);
    };
    _key.currentState?.removeItem(index, builder);
  }

}
