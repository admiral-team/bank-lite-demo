import 'dart:async';

import 'package:bank_lite/components/addnew.dart';
import 'package:bank_lite/components/appbar_main.dart';
import 'package:bank_lite/components/banner.dart';
import 'package:bank_lite/components/suggestions.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/screens/estimate_app.dart';
import 'package:bank_lite/screens/status_screen.dart';
import 'package:flutter/material.dart';

import '../components/card_cell.dart';
import '../components/card_widget.dart';
import '../components/cards_widget.dart';
import '../model/home_model.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<HomeScreenModel>> Function() request;

  const HomeScreen({Key? key, required this.request}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<HomeScreenModel> _items = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _loading();
    });
  }

  Future<void> _loading() async {
    final items = await widget.request();
    setState(() {
      _items = items;
    });
  }

  Future<void> _pullRefresh() async {
    setState(() {
      _items = [];
    });

    final items = await widget.request();

    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: 40.0,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF1D2128),
        alignment: Alignment.center,
        child: Column(
          children: [
            AppBarMain(
              count: 6,
              onPressedLeftButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EstimateApp()),
                );
              },
              onPressedRightButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatusScreen()),
                );
              },
            ),
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: _items.length,
                itemBuilder: (ctx, index) {
                  return _buildView(ctx, index);
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(height: 8);
                },
              ),
            ),
          ],
        ),
      ),
      onRefresh: () {
        return _pullRefresh();
      },
    );
  }

  Widget _buildView(BuildContext ctx, int index) {
    final item = _items[index];
    if (item is BannerScreenModel) {
      return BannerWidget(
        onClosePressed: () {
          setState(() {
            _items.removeAt(index);
          });
        },
      );
    } else if (item is AddNewModel) {
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
        },
      );
    } else if (item is SuggestionsCellModel) {
      return const SuggestionWidget();
    }
    return Container();
  }
}
