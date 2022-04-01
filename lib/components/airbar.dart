import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

class AirbarItem {
  final String title;
  final SvgGenImage content;

  const AirbarItem({required this.title, required this.content});
}

class Airbar extends StatefulWidget {
  final List<AirbarItem> items;
  final int selectedIndex;
  final Function(int)? onPressed;

  const Airbar(
      {Key? key,
      required this.items,
      required this.selectedIndex,
      this.onPressed})
      : super(key: key);

  @override
  State<Airbar> createState() => _AirbarState();
}

class _AirbarState extends State<Airbar> {
  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;

    List<Widget> widgets = [const SizedBox(height: 56.0)];
    widgets.addAll(_itemsWidgets());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      decoration: BoxDecoration(
          color: colors.airBarMain.color(),
          borderRadius: BorderRadius.circular(20.0)),
      child: Row(mainAxisSize: MainAxisSize.min, children: widgets),
    );
  }

  List<Widget> _itemsWidgets() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.items.length; i++) {
      final item = widget.items[i];
      final selected = i == widget.selectedIndex;
      widgets.add(
        AirbarItemWidget(
          title: item.title,
          content: item.content,
          selected: selected,
          onPressed: () => widget.onPressed?.call(i),
        ),
      );
      widgets.add(const SizedBox(width: 8.0));
    }
    widgets.removeLast();
    return widgets;
  }
}

class AirbarItemWidget extends StatefulWidget {
  final String title;
  final SvgGenImage content;
  final bool selected;
  final VoidCallback? onPressed;

  const AirbarItemWidget({
    Key? key,
    required this.title,
    required this.content,
    this.selected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  State<AirbarItemWidget> createState() => _AirbarItemWidgetState();
}

class _AirbarItemWidgetState extends State<AirbarItemWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    final accentColor = widget.selected
        ? colors.elementsAccent.color(opacity: _opacity)
        : colors.elementsStaticWhite.color(opacity: _opacity);
    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Container(
        constraints:
            const BoxConstraints(minHeight: 56, maxWidth: 56, minWidth: 56),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.content.svg(color: accentColor, height: 40.0, width: 40.0),
            Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: fonts.caption2.toTextStyle(
                colors.textStaticWhite.color(opacity: _opacity),
              ),
            ),
            const SizedBox(height: 4.0)
          ],
        ),
      ),
    );
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _opacity = highlighted ? 0.7 : 1.0;
    });
  }
}

// class AirbarItemWidget extends StatelessWidget {
//   final String title;
//   final SvgGenImage content;
//   final bool selected;
//   final VoidCallback? onPressed;

//   const AirbarItemWidget({
//     Key? key,
//     required this.title,
//     required this.content,
//     this.selected = false,
//     this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final accentColor = selected ? const Color(0xFF3A83F1) : Colors.white;
//     return CupertinoButton(
//         minSize: 0,
//         padding: const EdgeInsets.all(0),
//         child: SizedBox(
//           width: 56.0,
//           height: 56.0,
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             content.svg(color: accentColor, height: 40.0, width: 40.0),
//             Text(
//               title,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 10.0,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: FontFamily.sfProText),
//             ),
//             const SizedBox(height: 4.0)
//           ]),
//         ),
//         onPressed: () => onPressed?.call());
//   }
// }
