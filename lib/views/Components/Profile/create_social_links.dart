import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

Widget createSocialLinks(
    String label,
    String hint,
    BuildContext context,
    TextEditingController controller,
    TextInputType widgetKeyBoardType,
    FormFieldValidator<String>? validator) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          flex: 3,
          child: Container(
              height: scaleHeight(context, 56),
              padding: EdgeInsets.only(left: scaleHeight(context, 15)),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(label,
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleWidth(context, 14),
                      color: const Color(0xff1a202c),
                      height: lineHeight(19.2, 14),
                      fontWeight: FontWeight.w400)))),
      SizedBox(width: scaleWidth(context, 20)),
      Expanded(
        flex: 7,
        child: SizedBox(
            // decoration: const BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            enabled: true,
            hintText: hint,
            labelStyle: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleWidth(context, 14),
                color: const Color(0xff1a202c).withOpacity(0.8),
                height: lineHeight(19.2, 14),
                fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.only(left: scaleWidth(context, 20)),
            hintStyle: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleWidth(context, 14),
                color: const Color(0xff1a202c).withOpacity(0.8),
                height: lineHeight(19.2, 14),
                fontWeight: FontWeight.w400),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff484848)),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xfff05656)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: validator,
        )),
      )
    ],
  );
}