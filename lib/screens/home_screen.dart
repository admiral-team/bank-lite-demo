import 'package:bank_lite/components/suggestions.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF222222),
        child: Column(
          children: [const SizedBox(height: 70), SuggestionWidget()],
        ));
  }
}

class SuggestionWidget extends StatefulWidget {
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Suggestions(
        items: items,
        selectedIndex: _selectedIndex,
        onPressed: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
