
import 'package:bank_lite/components/addnew.dart';
import 'package:flutter/material.dart';

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
      child: ListView.builder(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                return Container(height: 50.0, width: double.infinity, color: Colors.green);
              case 2:
                return Container(height: 50.0, width: double.infinity, color: Colors.red);
              case 3:
                return Container(height: 50.0, width: double.infinity, color: Colors.blue);
            }
            return Container();
          } else {
            return Container();
          }
        }
      )
    );
  }
}