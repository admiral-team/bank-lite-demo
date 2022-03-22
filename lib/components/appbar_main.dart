import 'package:bank_lite/generated/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarMain extends StatefulWidget {
  SvgGenImage get title => Assets.lib.assets.images.vtbTitle;
  SvgGenImage get leftBarButton => Assets.lib.assets.images.profile;
  SvgGenImage get rightBarButton => Assets.lib.assets.images.alert;

  final Function()? onPressedLeftButton;
  final Function()? onPressedRightButton;

  const AppBarMain(
      {Key? key, this.onPressedLeftButton, this.onPressedRightButton})
      : super(key: key);

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF1D2128),
        height: 48.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(padding: EdgeInsets.only(left: 8)),
          CupertinoButton(
            minSize: 0,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.bottomRight,
            pressedOpacity: 1.0,
            child: widget.leftBarButton
                .svg(height: 32, color: const Color(0xFF3A83F1)),
            onPressed: widget.onPressedRightButton,
          ),
          Spacer(),
          widget.title.svg(height: 20),
          Spacer(),
          CupertinoButton(
            minSize: 0,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.bottomRight,
            pressedOpacity: 1.0,
            child:
                widget.rightBarButton.svg(height: 32, color: Color(0xFF3A83F1)),
            onPressed: widget.onPressedRightButton,
          ),
          Padding(padding: EdgeInsets.only(right: 8)),
        ]));
  }
}
