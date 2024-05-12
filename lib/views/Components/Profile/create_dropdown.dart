import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

Widget createDropDownFields(
    String label,
    String hint,
    List<String> list,
    BuildContext context,
    String? selectedValue,
    void Function(String?)? onChanged,
    {int flex = 1}) {
  final String? effectiveValue =
      list.contains(selectedValue) ? selectedValue : hint;
  return Expanded(
      flex: flex,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label,
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleWidth(context, 14),
                color: const Color(0xff1a202c),
                height: lineHeight(19.2, 14),
                fontWeight: FontWeight.w400)),
        SizedBox(height: scaleHeight(context, 9)),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              padding:
                  EdgeInsets.symmetric(horizontal: scaleWidth(context, 20)),
              hint: Text(hint,
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleWidth(context, 14),
                      color: const Color(0xff1a202c).withOpacity(0.8),
                      height: lineHeight(19.2, 14),
                      fontWeight: FontWeight.w400)),
              value: effectiveValue,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down, color: Color(0xff1a202c)),
              items: [
                if (selectedValue == null ||
                    selectedValue
                        .isEmpty) // Display hint if selectedValue is null or empty
                  DropdownMenuItem<String>(
                    value: hint,
                    child: Text(
                      hint,
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleWidth(context, 14),
                          color: const Color(0xff1a202c).withOpacity(0.8),
                          height: lineHeight(19.2, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ...list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleWidth(context, 14),
                          color: const Color(0xff1a202c).withOpacity(0.8),
                          height: lineHeight(19.2, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  );
                }),
              ],
              onChanged: (String? newValue) {
                // Prevent selection of the hint value
                if (newValue != hint) {
                  onChanged?.call(newValue);
                }
              },
            ),
          ),
        )
      ]));
}
