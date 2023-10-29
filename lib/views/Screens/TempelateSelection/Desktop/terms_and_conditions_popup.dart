import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/templateSelectionprovider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

void showTermsAndConditions(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
          final templateSelectionProvider = context.watch<TemplateSelectionProvider>();

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rad5_3),
        ),
        insetPadding: EdgeInsets.zero,
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            width: scaleWidth(context, 576),
            padding: EdgeInsets.only(
                top: scaleHeight(context, 48),
                bottom: scaleHeight(context, 39),
                left: scaleWidth(context, 35),
                right: scaleWidth(context, 35)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(rad5_3),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'HackCraft',
                  style: GoogleFonts.getFont(
                    fontFamily1,
                    fontSize: scaleHeight(context, 32),
                    color: black1,
                    fontWeight: FontWeight.w400,
                    height: lineHeight(40, 32),
                  ),
                ),
                SizedBox(
                  height: scaleHeight(context, 6),
                ),
                Text(
                  'Terms of Service',
                  style: GoogleFonts.getFont(
                    fontFamily1,
                    fontSize: scaleHeight(context, 28),
                    color: black7,
                    fontWeight: FontWeight.w600,
                    height: lineHeight(34, 28),
                  ),
                ),
                SizedBox(
                  height: scaleHeight(context, 37),
                ),
                Container(
                  color: grey1,
                  height: scaleHeight(context, 368),
                ),
                SizedBox(
                  height: scaleHeight(context, 51),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: scaleHeight(context, 48),
                      width: scaleWidth(context, 237),
                      child: ElevatedButton(
                        onPressed: () {
                          templateSelectionProvider.setTnC(true);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: templateSelectionProvider.isTnCChecked! ? green2 : grey2,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(rad5_2))),
                        child: Text(
                          'Accept',
                          style: GoogleFonts.getFont(
                            fontFamily1,
                            fontSize: scaleHeight(context, 21),
                            color: templateSelectionProvider.isTnCChecked! ? Colors.white: black8,
                            fontWeight: FontWeight.w500,
                            height: lineHeight(25, 21),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scaleHeight(context, 48),
                      width: scaleWidth(context, 237),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: red2,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(rad5_2))),
                        child: Text(
                          'Decline',
                          style: GoogleFonts.getFont(
                            fontFamily1,
                            fontSize: scaleHeight(context, 21),
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            height: lineHeight(25, 21),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
