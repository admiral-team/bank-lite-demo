import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
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

  StatusWidgetModel({
    required this.title,
    required this.description,
    required this.image,
    required this.imageContainer,
    required this.titleContainerHeight
  });
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
            style: const TextStyle(
              color: Color(0xFFE4E8EE),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: FontFamily.sfProText,
            ),
          ),
        ),
        if (widget.model.description != "") ...[
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              widget.model.description,
              style: const TextStyle(
                color: Color(0xFFA5ACB6),
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                fontFamily: FontFamily.sfProDisplay,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }
}
