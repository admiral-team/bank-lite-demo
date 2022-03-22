import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/cupertino.dart';

class AppBarMain extends StatefulWidget {
  final VoidCallback? onPressedLeftButton;
  final VoidCallback? onPressedRightButton;

  const AppBarMain(
      {Key? key, this.onPressedLeftButton, this.onPressedRightButton})
      : super(key: key);

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarMain> {
  SvgGenImage get _title => Assets.lib.assets.images.vtbTitle;
  SvgGenImage get _leftBarButton => Assets.lib.assets.images.profile;
  SvgGenImage get _rightBarButton => Assets.lib.assets.images.alert;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:  MediaQuery.of(context).padding.top),
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
              height: 32,
              color: const Color(0xFF3A83F1),
            ),
            onPressed: widget.onPressedLeftButton,
          ),
          const Spacer(),
          _title.svg(height: 20),
          const Spacer(),
          CupertinoButton(
            minSize: 0,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.bottomRight,
            pressedOpacity: 0.6,
            child: _rightBarButton.svg(
              height: 32,
              color: const Color(0xFF3A83F1),
            ),
            onPressed: widget.onPressedRightButton,
          ),
          const SizedBox(width: 8)
        ]),
      ),
    );
  }
}
