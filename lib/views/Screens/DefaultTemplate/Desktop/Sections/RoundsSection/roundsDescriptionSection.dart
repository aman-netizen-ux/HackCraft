import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_text.dart';

class RoundsDescription extends StatelessWidget {
  final String description;
  final TextFieldProperties decriptionProperties;
  const RoundsDescription(
      {super.key,
      required this.description,
      required this.decriptionProperties});

  @override
  Widget build(BuildContext context) {
   
    return Container(
        width: scaleWidth(context, 550),
        height: scaleHeight(context, 453),
        child: Stack(children: [
          Positioned(
            left: scaleWidth(context, 31),
            top: scaleHeight(context, 0),
            child: Container(
              width: scaleWidth(context, 486),
              height: scaleHeight(context, 318),
              decoration: ShapeDecoration(
                  color: black1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                        blurRadius: 3,
                        offset: Offset(0, -4),
                        spreadRadius: 0,
                        color: Colors.black)
                  ]),
            ),
          ),
          Positioned(
              left: 0,
              top: 33,
              child: Container(
                width: scaleWidth(context, 550),
                height: scaleHeight(context, 360),
                padding: EdgeInsets.only(
                    top: scaleHeight(context, 21),
                    left: scaleWidth(context, 31),
                    right: scaleWidth(context, 19),
                    bottom: scaleHeight(context, 66)),
                decoration: ShapeDecoration(
                  color: lavender,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: DefaultTemplateText(
                  name: description,
                  textProperties: decriptionProperties,
                  height: 22.4,
                ),
              )),
          Positioned(
              left: scaleWidth(context, 229),
              top: scaleHeight(context, 339),
              child: Container(
                width: scaleWidth(context, 114),
                height: scaleHeight(context, 114),
                decoration:
                    const ShapeDecoration(color: black1, shape: CircleBorder()),
              ))
        ]));
  }
}
