import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

SizedBox memberTableHeader(context, List allFields) {
  int length = allFields.length;
  return SizedBox(
    height: scaleHeight(context, 40),
    child: Row(
      children: [
        SizedBox(
          width: scaleWidth(context, 450),
        ),
        ...List.generate(length, (index) {
          return Row(
            children: [
              Container(
                width: 1,
                height: scaleHeight(context, 40),
                color: const Color(0xff858d9a),
              ),
              Container(
                width: scaleWidth(context, 160),
                alignment: Alignment.center,
                child: Text(
                  allFields[index],
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal,
                    fontSize: scaleHeight(context, 16),
                  ),
                ),
              ),
            ],
          );
        }),
        SizedBox(
          height: scaleHeight(context, 20),
        ),
      ],
    ),
  );
}
