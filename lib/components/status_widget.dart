import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoundingBox {
  double width;
  double height;

  BoundingBox({required this.width, required this.height});
}

class StatusWidgetModel {
  final String title;
  final String description;
  final SvgPicture image;
  final BoundingBox imageContainer;
  final double titleContainerHeight;

  StatusWidgetModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.imageContainer,
      required this.titleContainerHeight});
}

class StatusWidget extends StatefulWidget {
  final StatusWidgetModel model;

  const StatusWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.model.imageContainer.width,
          height: widget.model.imageContainer.height,
          alignment: Alignment.center,
          child: widget.model.image,
        ),
        SizedBox(
          height: widget.model.titleContainerHeight,
          child: Text(
            widget.model.title,
            textAlign: TextAlign.center,
            style: fonts.title1.toTextStyle(colors.textPrimary.color()),
          ),
        ),
        if (widget.model.description != "") ...[
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              widget.model.description,
              style: fonts.body2.toTextStyle(colors.textPrimary.color()),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }
}
