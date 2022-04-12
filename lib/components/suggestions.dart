import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuggestionWidget extends StatefulWidget {
  const SuggestionWidget({Key? key}) : super(key: key);

  @override
  State<SuggestionWidget> createState() {
    return _SuggestionsWrapperState();
  }
}

class _SuggestionsWrapperState extends State<SuggestionWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = [
      SuggestionItem(
          title: AppLocalizations.of(context).inviteFriend,
          content: Assets.lib.assets.images.serviceLike),
      SuggestionItem(
          title: AppLocalizations.of(context).payCellular,
          content: Assets.lib.assets.images.serviceDone),
      SuggestionItem(
          title: AppLocalizations.of(context).transferMoney,
          content: Assets.lib.assets.images.serviceNext),
      SuggestionItem(
          title: AppLocalizations.of(context).payHousingCommunalServices,
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
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var _items = _itemsWidgets();

    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundAdditional.color(),
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
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
      child: Text(
        AppLocalizations.of(context).recommend,
        style: fonts.subtitle1.toTextStyle(colors.textPrimary.color()),
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

class _SuggestionsItemWidgetState extends State<SuggestionsItemWidget> with TickerProviderStateMixin {
  bool _highlighted = false;
  static const _animationDuration = 200;
  
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeProvider.of(context);
    final colors = theme.colors;
    final fonts = theme.fonts;
 
    final textColor = _highlighted ? colors.textStaticWhite.color() : colors.textPrimary.color();
    final backgroundColor = _highlighted ? colors.elementsAccent.color() : colors.backgroundBasic.color();

    return GestureDetector(
      child: SizedBox(
        width: 104.0,
        height: 120.0,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: _animationDuration),
            curve: Curves.easeInOut,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor
            ),
            child: Container(
              color: backgroundColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.content.svg(height: 40.0, width: 40.0),
                  const Spacer(),
                  Text(
                    widget.title,
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: fonts.subhead3.toTextStyle(textColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTapUp: (_) => _setHighlighted(false),
      onTapDown: (_) => _setHighlighted(true),
      onTapCancel: () => _setHighlighted(false),
      onTap: () {
        //setHighlighted(false);
        // ignore: avoid_print
        print("tapped");
      },
    );
  }

  _setHighlighted(bool highlighted) {
    if (highlighted) {
      setState(() {
        _highlighted = true;
      }); 
    } else {
      Future.delayed(const Duration(milliseconds: _animationDuration)).then((_) {
        setState(() {
          _highlighted = false;
        });
      });
    }
  }
}
