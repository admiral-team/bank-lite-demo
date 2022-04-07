import 'dart:async';

import 'package:bank_lite/components/addnew.dart';
import 'package:bank_lite/components/appbar_main.dart';
import 'package:bank_lite/components/banner.dart';
import 'package:bank_lite/components/suggestions.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/screens/in_progress.dart';
import 'package:bank_lite/screens/multi_card.dart';
import 'package:bank_lite/screens/theme_settings_screen.dart';
import 'package:bank_lite/service/settings.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/card_cell.dart';
import '../components/card_widget.dart';
import '../components/cards_widget.dart';
import '../components/expanded_cell.dart';
import '../model/home_model.dart';
import '../services/notification_service.dart';
import '../helpers/router.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<HomeScreenModel>> Function() request;

  const HomeScreen({Key? key, required this.request}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeScreenModel> _items = [];
  bool _expanded = true;
  bool get _isReleased => Settings.release;
  final _router = const BaseRouter();

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
    final theme = AppThemeProvider.of(context);

    return RefreshIndicator(
      edgeOffset: 40.0,
      notificationPredicate: _isReleased ? (_) => false : (_) => true,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: theme.colors.backgroundBasic.color(),
        alignment: Alignment.center,
        child: Column(
          children: [
            AppBarMain(
              count: 6,
              onPressedLeftButton: () {
                _router.pushScreen(context, (_) => const ThemeSettingsScreen());
              },
              onPressedRightButton: () {
                _router.pushScreen(context, (_) => const InProgress());
              },
              onPressedSettings: () {
                _router.pushScreen(context, (_) => const MultiCardScreen());
              },
            ),
            Expanded(
              child: ListView.separated(
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                shrinkWrap: false,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: _items.length + 1,
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
      onRefresh: () async {
        return await _pullRefresh();
      },
    );
  }

  Widget _buildView(BuildContext ctx, int index) {
    final item = index == _items.length ? null : _items[index];
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
            _router.pushScreen(context,  (_) => const InProgress());
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
        Future.delayed(const Duration(seconds: 3), () {
          NotificationService.showNotification(
            title: 'Успешно!', body: 'Ваша карта выпущена'
          );
        });
      });
    } else if (item is CardCellModel) {
      return CardCellWidget(
          title: item.title,
          balance: item.balance,
          cardNumber: item.cardNumber,
          icon: item.icon,
          addPressed: () {
            _router.pushScreen(context, (_) => const InProgress());
          },
          sendPressed: () {
            _router.pushScreen(context, (_) => const InProgress());
          });
    } else if (item is CardsWidgetModel) {
      return CardsWidget(
        collapsed: true,
        cards: [
          CardModel(
            title: AppLocalizations.of(context).bankTitle,
            lastNumbers: "• 3267",
            image: Assets.lib.assets.images.cardVisa,
          )
        ],
        onRecommendPressed: () {
          _router.pushScreen(context, (_) => const InProgress());
        },
        onCardPressed: (cardModel) {
          _router.pushScreen(context, (_) => const InProgress());
        },
      );
    } else if (item is SuggestionsCellModel) {
      return const SuggestionWidget();
    } else if (item == null) {
      return const SizedBox(
        width: double.infinity,
        height: 115,
      );
    }
    return Container();
  }
}
