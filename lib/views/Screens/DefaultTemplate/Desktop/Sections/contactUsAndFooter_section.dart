import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/views/Components/customGrid.dart';

class ContactUsAndFooterSection extends StatefulWidget {
  const ContactUsAndFooterSection({super.key});

  @override
  State<ContactUsAndFooterSection> createState() =>
      _ContactUsAndFooterSectionState();
}

class _ContactUsAndFooterSectionState extends State<ContactUsAndFooterSection> {
  List<String> footerLinks = [
    "Terms",
    "FAQ",
    "Privacy",
    "Careers",
    "How To",
    "Give Feedback"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      key: contactUs,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: scaleHeight(context, 25),
            left: scaleWidth(context, 81),
            right: scaleWidth(context, 81),
          ),
          child: Text('Contact Us',
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 48),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  height: lineHeight(22.4, 48))),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: scaleHeight(context, 43),
            left: scaleWidth(context, 81),
            right: scaleWidth(context, 81),
          ),
          child: SizedBox(
            height: scaleHeight(context, 173),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: scaleWidth(context, 40),
                            width: scaleWidth(context, 40),
                            decoration: BoxDecoration(
                                color: lavender,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: scaleWidth(context, 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Member Name ',
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: scaleHeight(context, 18),
                                      color: black1,
                                      fontWeight: FontWeight.w400,
                                      height: lineHeight(29, 18))),
                              SizedBox(
                                height: scaleHeight(context, 5),
                              ),
                              Text('Contact Number',
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: scaleHeight(context, 16),
                                      color: black5,
                                      fontWeight: FontWeight.w400,
                                      height: lineHeight(5, 16))),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: scaleHeight(context, 27),
                      ),
                      Row(
                        children: [
                          Container(
                            height: scaleWidth(context, 40),
                            width: scaleWidth(context, 40),
                            decoration: BoxDecoration(
                                color: lavender,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: scaleWidth(context, 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Member Name ',
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: scaleHeight(context, 18),
                                      color: black1,
                                      fontWeight: FontWeight.w400,
                                      height: lineHeight(29, 18))),
                              SizedBox(
                                height: scaleHeight(context, 5),
                              ),
                              Text('Contact Number',
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: scaleHeight(context, 16),
                                      color: black5,
                                      fontWeight: FontWeight.w400,
                                      height: lineHeight(5, 16))),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              Expanded(flex: 7, child: Container())
              ],
            ),
          ),
        ),
        SizedBox(
          height: scaleHeight(context, 117),
        ),
        footer(context)
      ],
    );
  }

  Container footer(BuildContext context) {
    return Container(
      height: scaleHeight(context, 355),
      width: double.infinity,
      padding: EdgeInsets.only(
          top: scaleHeight(context, 82),
          left: scaleHeight(context, 81),
          right: scaleHeight(context, 81),
          bottom: scaleHeight(context, 41)),
      color: black6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: scaleWidth(context, 59),
                    width: scaleWidth(context, 59),
                    decoration: BoxDecoration(
                        color: greyish2,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    width: scaleWidth(context, 21),
                  ),
                  Text('Major\nProject',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        fontFamily2,
                        fontSize: scaleHeight(context, 32),
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
              SizedBox(
                height: scaleHeight(context, 38),
              ),
              Text(
                'Lorem ipsum dolor sit amet,\nLorem ipsum dolor sit amet,',
                textAlign: TextAlign.left,
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 16),
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: lineHeight(25, 16)),
              ),
              const Spacer(),
              Text(
                'Lorem ipsum dolor sit amet,',
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 16),
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: lineHeight(25, 16)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  width: scaleWidth(context, 230),
                  margin: EdgeInsets.only(top : scaleHeight(context, 49)),
                  child: CustomGrid(
                      itemCount: footerLinks.length,
                      columnCount: 2,
                      menuList: footerLinks)),
              const Spacer(),
              Text(
                'Lorem ipsum dolor sit amet,',
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 16),
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: lineHeight(25, 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
