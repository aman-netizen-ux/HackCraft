import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(context, 670),
      width: scaleWidth(context, 315),
      color: lightGrey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: scaleHeight(context, 9)),
            color: Color(0xffeaeaea),
            height: scaleHeight(context, 86),
            width: scaleWidth(context, 305),
            child: Column(
              children: [
                Text(
                  "Mutiple choice",
                  style: GoogleFonts.firaSans(
                      fontSize: scaleHeight(context, 18),
                      color: darkCharcoal,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: scaleHeight(context, 32),
                  width: scaleWidth(context, 289),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD9D9D9),
                    ),
                    child: Text(
                      "Save",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400,
                        color: darkCharcoal,
                        fontSize: scaleHeight(context, 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: scaleHeight(context, 9)),
            color: Color(0xffeaeaea),
            height: scaleHeight(context, 243),
            width: scaleWidth(context, 305),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Question",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w500,
                        color: darkCharcoal,
                        fontSize: scaleHeight(context, 14),
                      ),
                    ),
                    SizedBox(
                        height: scaleHeight(context, 90),
                        width: scaleWidth(context, 289),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: black1,
                                width: 1,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Hint",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w500,
                        color: darkCharcoal,
                        fontSize: scaleHeight(context, 14),
                      ),
                    ),
                    SizedBox(
                        height: scaleHeight(context, 70),
                        width: scaleWidth(context, 289),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: black1,
                                width: 1,
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
