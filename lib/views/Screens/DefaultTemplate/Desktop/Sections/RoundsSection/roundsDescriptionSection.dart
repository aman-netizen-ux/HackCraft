import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class RoundsDescription extends StatelessWidget {
  final String description;
  final TextFieldProperties decriptionProperties;
  const RoundsDescription(
      {super.key,
      required this.description,
      required this.decriptionProperties});

  @override
  Widget build(BuildContext context) {
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);
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
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    decriptionProperties.font, //fontFamily2,
                    fontSize: scaleHeight(
                        context, decriptionProperties.size.toDouble()), //15
                    decoration: decriptionProperties.underline
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    fontStyle: decriptionProperties.italics
                        ? FontStyle.italic
                        : FontStyle.normal,

                    color: defaultTemplateProvider.stringToColor(
                        decriptionProperties.textColor), //greyish1,
                    height: lineHeight(
                        22.4, decriptionProperties.size.toDouble()), //18
                    fontWeight: defaultTemplateProvider.fontWeightFromInt(
                        decriptionProperties.fontWeight), //w400
                  ),
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
