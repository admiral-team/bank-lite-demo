
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/card_cell.dart';
import '../generated/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
        CardCellWidget(
          title: "Цифровая Мультикарта",
           balance: "2 000 ₽", 
           cardNumber: "• 2104", 
           cardContent: Assets.lib.assets.images.card,
           sendPressed: (){},
           addPressed: (){})
      ]
    );
  }
}