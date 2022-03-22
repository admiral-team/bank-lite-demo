import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

class SuggestionItem {
  final String title;
  final SvgGenImage content;

  const SuggestionItem({required this.title, required this.content});
}

class Suggestions extends StatefulWidget {
  final List<SuggestionItem> items;
  final int selectedIndex;
  final Function(int)? onPressed;

  const Suggestions(
      {Key? key,
      required this.items,
      required this.selectedIndex,
      this.onPressed})
      : super(key: key);

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  @override
  Widget build(BuildContext context) {
    var _items = _itemsWidgets();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF272C35),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(),
          SizedBox(
            height: 152,
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return _items[index];
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _itemsWidgets() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.items.length; i++) {
      final item = widget.items[i];
      final selected = i == widget.selectedIndex;
      widgets.add(
        SuggestionsItemWidget(
          title: item.title,
          content: item.content,
          selected: selected,
          onPressed: () => widget.onPressed?.call(i),
        ),
      );
      widgets.add(const SizedBox(width: 10.0));
    }
    widgets.removeLast();
    return widgets;
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
      child: Text(
        "Рекомендуем",
        style: TextStyle(
            fontFamily: FontFamily.sfProDisplay,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE4E8EE)),
      ),
    );
  }
}

class SuggestionsItemWidget extends StatefulWidget {
  final String title;
  final SvgGenImage content;
  final bool selected;
  final VoidCallback? onPressed;

  const SuggestionsItemWidget({
    Key? key,
    required this.title,
    required this.content,
    this.selected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  State<SuggestionsItemWidget> createState() => _SuggestionsItemWidgetState();
}

class _SuggestionsItemWidgetState extends State<SuggestionsItemWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    final accentColor =
        widget.selected ? const Color(0xFF3A83F1) : const Color(0xFF1D2128);
    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Opacity(
        opacity: _opacity,
        child: SizedBox(
          width: 104.0,
          height: 120.0,
          child: Container(
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.content.svg(height: 40.0, width: 40.0),
                const Spacer(),
                Text(
                  widget.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.sfProText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setHighlighted(bool highlighted) {
    setState(
      () {
        _opacity = highlighted ? 0.7 : 1.0;
      },
    );
  }
}
