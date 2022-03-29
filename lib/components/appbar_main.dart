import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../generated/fonts.gen.dart';

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
    List<Widget> widgets = [
      _rightBarButton.svg(
        height: 40,
        color: const Color(0xFF3A83F1),
      )
    ];

    if (widget.count != null) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 20),
        child: _NotificationBage(count: widget.count!),
      ));
    }

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: const Color(0xFF1D2128),
      child: SizedBox(
        height: 48.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(width: 8),
          CupertinoButton(
            minSize: 0,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.bottomRight,
            pressedOpacity: 0.6,
            child: _leftBarButton.svg(
              height: 40,
              color: const Color(0xFF3A83F1),
            ),
            onPressed: widget.onPressedLeftButton,
          ),
          const Spacer(),
          Text(
            AppLocalizations.of(context).appTitle,
            style: const TextStyle(
              color: Color(0xFFE4E8EE),
              fontSize: 28,
              fontFamily: FontFamily.sfProDisplay,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
              fontStyle: FontStyle.normal,
            ),
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
          CupertinoButton(
            minSize: 0,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.bottomRight,
            pressedOpacity: 0.6,
            child: _settingsBarButton.svg(
              height: 30,
              color: const Color(0xFF3A83F1),
            ),
            onPressed: widget.onPressedSettings,
          ),
          const SizedBox(width: 8)
        ]),
      ),
    );
  }
}

class _NotificationBage extends StatelessWidget {
  final int count;

  const _NotificationBage({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      height: 18.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 2, color: const Color(0xFF1D2128)),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.sfProText),
      ),
    );
  }
}
