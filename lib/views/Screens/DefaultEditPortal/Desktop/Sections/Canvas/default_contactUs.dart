import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:provider/provider.dart';

class DefaultEditContactUsAndFooterSection extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditContactUsAndFooterSection(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  State<DefaultEditContactUsAndFooterSection> createState() =>
      _DefaultEditContactUsAndFooterSectionState();
}

class _DefaultEditContactUsAndFooterSectionState
    extends State<DefaultEditContactUsAndFooterSection> {
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
    final contactMemberName1Controller = TextEditingController();
    final contactMemberName2Controller = TextEditingController();
    final contactMemberNumber1Controller = TextEditingController();
    final contactMemberNumber2Controller = TextEditingController();
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);
    if (hackathonDetailsProvider.contact1Name.isNotEmpty) {
      contactMemberName1Controller.text = hackathonDetailsProvider.contact1Name;
    }

    if (hackathonDetailsProvider.contact1Number.isNotEmpty) {
      contactMemberNumber1Controller.text =
          hackathonDetailsProvider.contact1Number;
    }

    if (hackathonDetailsProvider.contact2Name.isNotEmpty) {
      contactMemberName2Controller.text = hackathonDetailsProvider.contact2Name;
    }

    if (hackathonDetailsProvider.contact2Number.isNotEmpty) {
      contactMemberNumber1Controller.text =
          hackathonDetailsProvider.contact2Number;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: defaultEditScaleHeight(widget.containerHeight, 25),
            left: defaultEditScaleWidth(widget.containerWidth, 81),
            right: defaultEditScaleWidth(widget.containerWidth, 81),
          ),
          child: Text('Contact Us',
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: defaultEditScaleHeight(widget.containerHeight, 48),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  height: lineHeight(22.4, 48))),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: defaultEditScaleHeight(widget.containerHeight, 43),
            left: defaultEditScaleWidth(widget.containerWidth, 81),
            right: defaultEditScaleWidth(widget.containerWidth, 81),
          ),
          child: SizedBox(
            // height: defaultEditScaleHeight(widget.containerHeight, 173),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: defaultEditScaleWidth(
                                widget.containerWidth, 40),
                            width: defaultEditScaleWidth(
                                widget.containerWidth, 40),
                            decoration: BoxDecoration(
                                color: lavender,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: defaultEditScaleWidth(
                                widget.containerWidth, 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: defaultEditScaleWidth(
                                    widget.containerWidth, 300),
                                child: TextFormField(
                                  controller: contactMemberName1Controller,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: 'Contact Member Name',
                                    hintStyle: GoogleFonts.getFont(fontFamily2,
                                        fontSize: defaultEditScaleHeight(
                                            widget.containerHeight, 18),
                                        color: black1,
                                        fontWeight: FontWeight.w400,
                                        height: lineHeight(29, 18)), //22.4
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    counterText: "",
                                  ),
                                  maxLength: 30,
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: defaultEditScaleHeight(
                                          widget.containerHeight, 18),
                                      color: black1,
                                      fontWeight: FontWeight.w400,
                                      height: lineHeight(29, 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    hackathonDetailsProvider.contact1Name =
                                        value.toString();
                                  },
                                ),
                              ),
                              // Text('Contact Member Name ',
                              //     style: GoogleFonts.getFont(fontFamily2,
                              //         fontSize: defaultEditScaleHeight(widget.containerHeight, 18),
                              //         color: black1,
                              //         fontWeight: FontWeight.w400,
                              //         height: lineHeight(29, 18))),
                              SizedBox(
                                height: defaultEditScaleHeight(
                                    widget.containerHeight, 5),
                              ),

                              SizedBox(
                                height: 30,
                                width: defaultEditScaleWidth(
                                    widget.containerWidth, 300),
                                child: TextFormField(
                                  controller: contactMemberNumber1Controller,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: 'Contact Number',
                                    hintStyle: GoogleFonts.getFont(fontFamily2,
                                        fontSize: defaultEditScaleHeight(
                                            widget.containerHeight, 16),
                                        color: black5,
                                        fontWeight: FontWeight.w400,
                                        height: lineHeight(10, 16)), //22.4
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    counterText: "",
                                  ),
                                  maxLength: 30,
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: defaultEditScaleHeight(
                                          widget.containerHeight, 16),
                                      color: black5,
                                      fontWeight: FontWeight.w400,
                                      height: lineHeight(5, 16)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    hackathonDetailsProvider.contact1Number =
                                        value.toString();
                                  },
                                ),
                              ),
                              // Text('Contact Number',
                              //     style: GoogleFonts.getFont(fontFamily2,
                              //         fontSize: defaultEditScaleHeight(
                              //             widget.containerHeight, 16),
                              //         color: black5,
                              //         fontWeight: FontWeight.w400,
                              //         height: lineHeight(5, 16))),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            defaultEditScaleHeight(widget.containerHeight, 27),
                      ),
                      Row(
                        children: [
                          Container(
                            height: defaultEditScaleWidth(
                                widget.containerWidth, 40),
                            width: defaultEditScaleWidth(
                                widget.containerWidth, 40),
                            decoration: BoxDecoration(
                                color: lavender,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: defaultEditScaleWidth(
                                widget.containerWidth, 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: defaultEditScaleWidth(
                                    widget.containerWidth, 300),
                                child: TextFormField(
                                  controller: contactMemberName2Controller,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: 'Contact Member Name',
                                    hintStyle: GoogleFonts.getFont(fontFamily2,
                                        fontSize: defaultEditScaleHeight(
                                            widget.containerHeight, 18),
                                        color: black1,
                                        fontWeight: FontWeight.w400,
                                        height: lineHeight(29, 18)), //22.4
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    counterText: "",
                                  ),
                                  maxLength: 30,
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: defaultEditScaleHeight(
                                          widget.containerHeight, 18),
                                      color: black1,
                                      fontWeight: FontWeight.w400,
                                      height: lineHeight(29, 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    hackathonDetailsProvider.contact2Name =
                                        value.toString();
                                  },
                                ),
                              ),
                              // Text('Contact Member Name ',
                              //     style: GoogleFonts.getFont(fontFamily2,
                              //         fontSize: defaultEditScaleHeight(
                              //             widget.containerHeight, 18),
                              //         color: black1,
                              //         fontWeight: FontWeight.w400,
                              //         height: lineHeight(29, 18))),
                              SizedBox(
                                height: defaultEditScaleHeight(
                                    widget.containerHeight, 5),
                              ),

                              SizedBox(
                                height: 30,
                                width: defaultEditScaleWidth(
                                    widget.containerWidth, 300),
                                child: TextFormField(
                                  controller: contactMemberNumber2Controller,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: 'Contact Number',
                                    hintStyle: GoogleFonts.getFont(fontFamily2,
                                        fontSize: defaultEditScaleHeight(
                                            widget.containerHeight, 16),
                                        color: black1,
                                        fontWeight: FontWeight.w400,
                                        height: lineHeight(10, 16)), //22.4
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    counterText: "",
                                  ),
                                  maxLength: 30,
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: defaultEditScaleHeight(
                                          widget.containerHeight, 16),
                                      color: black1,
                                      fontWeight: FontWeight.w400,
                                      height: lineHeight(10, 16)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    hackathonDetailsProvider.contact2Number =
                                        value.toString();
                                  },
                                ),
                              ),
                              // Text('Contact Number',
                              //     style: GoogleFonts.getFont(fontFamily2,
                              //         fontSize: defaultEditScaleHeight(
                              //             widget.containerHeight, 16),
                              //         color: black5,
                              //         fontWeight: FontWeight.w400,
                              //         height: lineHeight(5, 16))),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(flex: 6, child: Container())
              ],
            ),
          ),
        ),
      ],
    );
  }
}
