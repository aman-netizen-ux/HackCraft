import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class RoundsDescription extends StatelessWidget {
  final String description;
  const RoundsDescription({super.key, required this.description});

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
                  padding: EdgeInsets.only(top : scaleHeight(context, 21), left : scaleWidth(context, 31), right : scaleWidth(context, 19), bottom : scaleHeight(context, 66)),
                  decoration: ShapeDecoration(
                      color: lavender,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      ),
                  child: Text('Welcome to the electrifying first round of Velocity Vista - the "UX Face-Off!" Here, we separate design champions from budding creators as they embark on a quest to showcase their UI/UX design skills. Your mission: craft a dazzling UI/UX design for a website or app, and this is your moment to shine. The submission window is open from October 21st, 2023, at 12:00 AM to October 23rd, 2023, at midnight. Brace yourself; it''s an elimination round, so bring your absolute best! The submission form awaits, with the label "Submit Your Design" and PDF as the only accepted format',
                  textAlign: TextAlign.center,
                   style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleWidth(context, 15),
                  color: greyish1,
                  fontWeight: FontWeight.w400,
                  height: lineHeight(27, 18))))),
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
