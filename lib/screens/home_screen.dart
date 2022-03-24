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
    print("Loading");
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final items = await widget.request();

    print("Finish Loading");
    setState(() {
      _items = items;
      print("Update");
      _isLoading = false;
    });
  }

  Future<void> _pullRefresh() async {
    if (_isLoading) {
      return;
    }

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
              child: AnimatedList(
                key: _key,
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                initialItemCount: _items.length,
                itemBuilder: (ctx, index, animation) {
                  print("itemBuilder");
                  return Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: _buildItem(_items[index], index, animation),
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
      HomeScreenModel item, int index, Animation<double> animation) {
    if (item is AddNewModel) {
      return SizeTransition(
        sizeFactor: animation,
        child: AddNewWidget(onPressed: item.onPressed),
      );
    } else if (item is CardCellModel) {
      return SizeTransition(
        sizeFactor: animation,
        child: CardCellWidget(
            title: item.title,
            balance: item.balance,
            cardNumber: item.cardNumber,
            icon: item.icon,
            addPressed: item.addPressed,
            sendPressed: item.sendPressed),
      );
    } else if (item is BannerScreenModel) {
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
    } else if (item is CardsWidgetModel) {
      return SizeTransition(
        sizeFactor: animation,
        child: CardsWidget(
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
            }),
      );
    } else if (item is SuggestionsCellModel) {
      return SizeTransition(
        sizeFactor: animation,
        child: const SuggestionWidget(),
      );
    }
    return Container();
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
