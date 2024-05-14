import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

SizedBox registrationDetailHeader(context) {
  return SizedBox(
    height: scaleHeight(context, 70),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 349,
          child: Center(
            child: Text(
              'Team Name',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: GoogleFonts.getFont(
                fontFamily2,
                fontWeight: FontWeight.w500,
                color: const Color(0xff686A6E),
              fontSize: scaleHeight(context, 16),
              ),
            ),
          ),
        ),       
        Expanded(
          flex: 93,
          child: Center(
            child: Text(
              'Team Count',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
                style: GoogleFonts.getFont(
                fontFamily2,
                fontWeight: FontWeight.w500,
                color: const Color(0xff686A6E),
               fontSize: scaleHeight(context, 16),
              ),
            ),
          ),
        ), 
        Expanded(
          flex: 140,
          child: Text(
            'Registration Date',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
             style: GoogleFonts.getFont(
                fontFamily2,
                fontWeight: FontWeight.w500,
                color:const Color(0xff686A6E),
              fontSize: scaleHeight(context, 16),
              ),
          ),
        ),
        Expanded(
          flex: 158,
          child: Center(
            child: Text(
              'Registration Status',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
               style: GoogleFonts.getFont(
                fontFamily2,
                fontWeight: FontWeight.w500,
                color: const Color(0xff686A6E),
               fontSize: scaleHeight(context, 16),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 260,
          child: Center(
            child: Text(
              'Team Leader Name',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
                style: GoogleFonts.getFont(
                fontFamily2,
                fontWeight: FontWeight.w500,
                color:const Color(0xff686A6E),
                fontSize: scaleHeight(context, 16),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
