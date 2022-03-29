import 'dart:async';

import 'package:bank_lite/components/addnew.dart';
import 'package:bank_lite/components/appbar_main.dart';
import 'package:bank_lite/components/banner.dart';
import 'package:bank_lite/components/suggestions.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/screens/in_progress.dart';
import 'package:bank_lite/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/card_cell.dart';
import '../components/card_widget.dart';
import '../components/cards_widget.dart';
import '../components/expanded_cell.dart';
import '../model/home_model.dart';
import '../services/notification_service.dart';
import 'multi_card.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<HomeScreenModel>> Function() request;

  const HomeScreen({Key? key, required this.request}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeScreenModel> _items = [];
  bool _expanded = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _loading();
    });
  }

  @override
  void dispose() {
    super.dispose();
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
                  _pushScreen(const InProgress());
              },
              onPressedRightButton: () {
                _pushScreen(const InProgress());
              },
              onPressedSettings: () {
                _pushScreen(const SettingsScreen());
              },
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: false,
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
      return ExpandedCell(
        expanded: _expanded,
        completion: () {
          if (_expanded == false) {
            _items.removeAt(index);
          }
        },
        child: BannerWidget(
          onTap: () {
            _pushScreen(const MultiCardScreen());
          },
          onClosePressed: () {
            setState(
              () {
                _expanded = !_expanded;
              },
            );
          },
        ),
      );
    } else if (item is AddNewModel) {
      return AddNewWidget(onPressed: () {
        _pushScreen(const InProgress());
      });
    } else if (item is CardCellModel) {
      return CardCellWidget(
          title: item.title,
          balance: item.balance,
          cardNumber: item.cardNumber,
          icon: item.icon,
          addPressed: () {
            _pushScreen(const InProgress());
          },
          sendPressed: () {
            _pushScreen(const InProgress());
          });
    } else if (item is CardsWidgetModel) {
      return CardsWidget(
        collapsed: true,
        cards: [
          CardModel(
            title: AppLocalizations.of(context).sberBankTitle,
            lastNumbers: "• 3267",
            image: Assets.lib.assets.images.cardVisa,
          )
        ],
        onAddNewCardPressed: () {
          Future.delayed(const Duration(seconds: 3), () {
            NotificationService.showNotification(title: 'Успешно!', body: 'Ваша карты выпущена');
          });
        },
        onCardPressed: (cardModel) {
          _pushScreen(const InProgress());
        },
      );
    } else if (item is SuggestionsCellModel) {
      return const SuggestionWidget();
    }
    return Container();
  }

  void _pushScreen(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
