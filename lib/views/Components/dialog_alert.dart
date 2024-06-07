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
            SizedBox(
              height: scaleHeight(context, 16),
            ),
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

Future<bool> askUserDialog(BuildContext context, String text, String title, {bool cancel=true}) async{
  return await showDialog(
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
                  color: red,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              height: scaleHeight(context, 16),
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  fontFamily2,
                  fontSize: scaleWidth(context, 16),
                  color: black1,
                  fontWeight: FontWeight.w400,
                )),
                SizedBox(
              height: scaleHeight(context, 16),
            ),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: cancel? () {
                      Navigator.pop(context, false);
                    }:null,
                    child: Text("Cancel",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          fontFamily2,
                          fontSize: scaleWidth(context, 16),
                          color: black1.withOpacity(cancel?0.7:0),
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                       Navigator.pop(context, true);
                    },
                    child: Text("OK",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          fontFamily2,
                          fontSize: scaleWidth(context, 16),
                          color: red,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ));
    },
  );
}
