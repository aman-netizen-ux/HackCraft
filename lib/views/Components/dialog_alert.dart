import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

void aletDialog(BuildContext context, String text, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          child: Container(
        width: scaleWidth(context, 250),
        height: scaleHeight(context, 250),
        padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 30)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Text(title,
                style: GoogleFonts.getFont(
                  fontFamily2,
                  fontSize: scaleWidth(context, 21),
                  color: indicatorblue,
                  fontWeight: FontWeight.w500,
                )),

                SizedBox(height: scaleHeight(context, 16),),
            Text(text,
            textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  fontFamily2,
                  fontSize: scaleWidth(context, 16),
                  color: black1,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ));
    },
  );
}
