import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarMain extends StatefulWidget {
  final int? count;
  final VoidCallback? onPressedLeftButton;
  final VoidCallback? onPressedRightButton;
  final VoidCallback? onPressedSettings;

  const AppBarMain(
      {Key? key,
      this.onPressedLeftButton,
      this.onPressedRightButton,
      this.onPressedSettings,
      this.count})
      : super(key: key);

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarMain> {
  SvgGenImage get _leftBarButton => Assets.lib.assets.images.profile;

  SvgGenImage get _settingsBarButton => Assets.lib.assets.images.appbarSettings;

  SvgGenImage get _rightBarButton => Assets.lib.assets.images.alert;

  @override
  Widget build(BuildContext context) {
    const isRelease = true;
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    List<Widget> widgets = [
      _rightBarButton.svg(
        height: 40,
        color: colors.elementsAccent.color(),
      )
    ];

    if (widget.count != null) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 18),
        child: _NotificationBage(count: widget.count!),
      ));
    }

    var appBarItems = [
      const SizedBox(width: 8),
      CupertinoButton(
        minSize: 0,
        padding: const EdgeInsets.all(0),
        alignment: Alignment.bottomRight,
        pressedOpacity: 0.6,
        child: _leftBarButton.svg(
          height: 40,
          color: colors.elementsAccent.color(),
        ),
        onPressed: widget.onPressedLeftButton,
      ),
      const Spacer(),
      Text(
        AppLocalizations.of(context).appTitle,
        style: fonts.largeTitle2.toTextStyle(
          colors.textPrimary.color(),
        ),
        //  letterSpacing: 0.2,
      ),
      const Spacer(),
      CupertinoButton(
        minSize: 0,
        padding: const EdgeInsets.all(0),
        alignment: Alignment.bottomRight,
        pressedOpacity: 0.6,
        child: Stack(
          children: widgets,
        ),
        onPressed: widget.onPressedRightButton,
      ),
    ];
    if (!isRelease) {
      appBarItems.add(
        CupertinoButton(
          minSize: 0,
          padding: const EdgeInsets.all(0),
          alignment: Alignment.bottomRight,
          pressedOpacity: 0.6,
          child: _settingsBarButton.svg(
            height: 30,
            color: colors.elementsAccent.color(),
          ),
          onPressed: widget.onPressedSettings,
        ),
      );
    }

    appBarItems.add(const SizedBox(width: 8));

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: colors.backgroundBasic.color(),
      child: SizedBox(
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: appBarItems,
        ),
      ),
    );
  }
}

class _NotificationBage extends StatelessWidget {
  final int count;

  const _NotificationBage({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    return Container(
      height: 20.0,
      width: 20.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.elementsError.color(),
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 2, color: colors.backgroundBasic.color()),
      ),
      child: Text(
        '$count',
        // style: fonts.largeTitle2.toTextStyle(
        //   colors.textStaticWhite.color(),
        // ),
        style: fonts.caption3.toTextStyle(
          colors.textStaticWhite.color(),
        ),
      ),
    );
  }
}
