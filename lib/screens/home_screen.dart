import 'dart:async';

import 'package:bank_lite/components/addnew.dart';
import 'package:bank_lite/components/appbar_main.dart';
import 'package:bank_lite/components/banner.dart';
import 'package:bank_lite/components/suggestions.dart';
import 'package:bank_lite/generated/assets.gen.dart';
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
  bool _isLoading = false;

  final GlobalKey<AnimatedListState> _key = GlobalKey();

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
                  print("onPressedLeftButton");
                },
                onPressedRightButton: () {
                  print("onPressedRightButton");
                }),
            Expanded(
              child: ListView.builder(
                key: _key,
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: _items.length,
                itemBuilder: (ctx, index) {
                  print("itemBuilder");
                  return Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: _buildItem(_items[index], index),
                  );
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

  Widget _buildItem(
      HomeScreenModel item, int index) {
    if (item is AddNewModel) {
      return AddNewWidget(onPressed: item.onPressed);
    } else if (item is CardCellModel) {
      return CardCellWidget(
            title: item.title,
            balance: item.balance,
            cardNumber: item.cardNumber,
            icon: item.icon,
            addPressed: item.addPressed,
            sendPressed: item.sendPressed);
    } else if (item is BannerScreenModel) {
      return BannerWidget(
          onClosePressed: () {
            setState(() {
              _removeItem(index);
            });
          },
        );
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
            });
    } else if (item is SuggestionsCellModel) {
      return SuggestionWidget();
    }
    return Container();
  }

  void _removeItem(int index) {
    HomeScreenModel item = _items.removeAt(index);
    // ignore: prefer_function_declarations_over_variables
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(item, index);
    };
    _key.currentState?.removeItem(index, builder);
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
