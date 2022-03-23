import 'package:bank_lite/components/addnew.dart';
import 'package:bank_lite/components/banner.dart';
import 'package:bank_lite/components/appbar_main.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import '../components/card_cell.dart';
import '../components/card_widget.dart';
import '../components/cards_widget.dart';


abstract class HomeScreenModel {
  //
}

class AddNewModel extends HomeScreenModel {
  VoidCallback? onPressed;
  AddNewModel({required this.onPressed});
}

class BannerScreenModel extends HomeScreenModel {
  VoidCallback? onClosePressed;
  BannerScreenModel({required this.onClosePressed});
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
    BannerScreenModel(onClosePressed: () {}),
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
    CardsWidgetModel(),
    AddNewModel(onPressed: () {}),
  ];

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF1D2128),
        alignment: Alignment.center,
        child: Column(
          children: [
            AppBarMain(
              onPressedLeftButton: () {
                print("onPressedLeftButton");
              }, onPressedRightButton: () {
                print("onPressedRightButton");
            }),
            Expanded(
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
            ),
          ],
        ),
    );
  }

  Widget _buildItem(HomeScreenModel item, int index, Animation<double> animation) {
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
              sendPressed: item.sendPressed
          ),
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
              }
          ),
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
