import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

Widget createFields(
    String label,
    String hint,
    BuildContext context,
    TextEditingController controller,
    TextInputType widgetKeyBoardType,
    bool isEnabled,
    bool isDate,
    bool isPhone,
    FormFieldValidator<String>? validator,
    {int flex = 1}) {
  return Expanded(
    flex: flex,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleWidth(context, 14),
                color: const Color(0xff1a202c),
                height: lineHeight(19.2, 14),
                fontWeight: FontWeight.w400)),
        SizedBox(height: scaleHeight(context, 9)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPhone) ...[
              Expanded(
                flex: 17,
                child: Container(
                  height: scaleHeight(context, 56),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text('+91',
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleWidth(context, 14),
                          color: const Color(0xff1a202c).withOpacity(0.8),
                          height: lineHeight(19.2, 14),
                          fontWeight: FontWeight.w400)),
                ),
              ),
              Expanded(flex: 3, child: Container()),
            ],
            Expanded(
              flex: isPhone ? 80 : 10,
              child: SizedBox(
                  child: TextFormField(
                      controller: controller,
                      inputFormatters: isDate
                          ? [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[\d-]')),
                              LengthLimitingTextInputFormatter(10)
                            ]
                          : [],
                      enabled: isEnabled,
                      decoration: InputDecoration(
                        enabled: true,
                        hintText: hint,
                        labelStyle: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 14),
                            color: const Color(0xff1a202c).withOpacity(0.8),
                            height: lineHeight(19.2, 14),
                            fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.only(left: scaleWidth(context, 20)),
                        hintStyle: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 14),
                            color: const Color(0xff1a202c).withOpacity(0.8),
                            height: lineHeight(19.2, 14),
                            fontWeight: FontWeight.w400),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none)),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff484848)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xfff05656)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: validator)),
            ),
          ],
        )
      ],
    ),
  );
}
