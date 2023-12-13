import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

// This file was created in order to create the card for the rounds section.
class DefaultRoundCard extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final String title;
  final int index;
  final void Function()? onTap;
  final String enddate;
  final String startDate;
  const DefaultRoundCard(
      {super.key,
      required this.title,
      required this.enddate,
      required this.startDate,
      this.onTap,
      required this.index,
      required this.containerHeight,
      required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    final rulesProvider = Provider.of<RulesProvider>(context);
    final roundNameController = TextEditingController();
    final roundTimelineController = TextEditingController();

    return InkWell(
      hoverColor: Colors.white,
      onTap: onTap,
      child: Container(
          height: defaultEditScaleHeight(containerHeight, 67),
          width: double.infinity,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(
            //bottom: defaultEditScaleHeight(containerHeight, 23),
            left: defaultEditScaleWidth(containerWidth, 47),
            right: defaultEditScaleWidth(containerWidth, 26),
            //top: defaultEditScaleHeight(containerHeight, 23)
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(rad5_3),
              border: Border.all(
                  color: rulesProvider.selectedIndex == index
                      ? black1
                      : Colors.transparent),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: defaultEditScaleWidth(containerWidth, 25),
                  ),
                  //Title of the round
                  child: Container(
                   height: defaultEditScaleHeight(containerHeight, 30),
                    alignment: Alignment.topLeft,
                   // color: Colors.amberAccent,
                    child: TextFormField(
                      //textAlignVertical: TextAlignVertical.top,
                      controller: roundNameController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        hintText: 'Round Name',
                        hintStyle: GoogleFonts.getFont(fontFamily2,
                            fontSize:
                                defaultEditScaleHeight(containerHeight, 20),
                            color: black1,
                            fontWeight: FontWeight.w400,
                            height: lineHeight(22.4, 20)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        counterText: "",
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: defaultEditScaleHeight(containerHeight, 20),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 20)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      // onSaved: (value) {
                      //   hackathonDetailsProvider.hackathonName = value.toString();
                      // },
                    ),
                  )
                  // Text(title,
                  //     style: GoogleFonts.getFont(fontFamily2,
                  //         fontSize: defaultEditScaleHeight(containerHeight, 20),
                  //         color: black1,
                  //         height: lineHeight(22.4, 20),
                  //         fontWeight: FontWeight.w400)),
                  ),
              //Timeline i.e Start date and End date of the round
              Padding(
                  padding: EdgeInsets.only(
                    left: defaultEditScaleWidth(containerWidth, 25),
                    // bottom: defaultEditScaleHeight(containerHeight, 6)
                  ),
                  child:
                      // Text('$startDate - $enddate',
                      //     style: GoogleFonts.getFont(fontFamily2,
                      //         fontSize: defaultEditScaleHeight(containerHeight, 18),
                      //         color: black1,
                      //         height: lineHeight(2.4, 20),
                      //         fontWeight: FontWeight.w400)),
                      Container(
                    height: defaultEditScaleHeight(containerHeight, 30),
                    //color: Colors.deepPurple,
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: roundTimelineController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        hintText: 'Timeline',
                        hintStyle: GoogleFonts.getFont(fontFamily2,
                            fontSize:
                                defaultEditScaleHeight(containerHeight, 20),
                            color: black1,
                            fontWeight: FontWeight.w400,
                            height: lineHeight(22.4, 20)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        counterText: "",
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: defaultEditScaleHeight(containerHeight, 20),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 20)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      // onSaved: (value) {
                      //   hackathonDetailsProvider.hackathonName = value.toString();
                      // },
                    ),
                  ))
            ],
          )),
    );
  }
}
