import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/compose_email.dart';

class CommunicateShare extends StatefulWidget {
  final String url;
  const CommunicateShare({super.key, required this.url});

  @override
  State<CommunicateShare> createState() => _CommunicateShareState();
}

class _CommunicateShareState extends State<CommunicateShare> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: pastelBlueGray,
      child: Column(
        children: [
          Container(
            height: scaleHeight(context, 296),
            margin: EdgeInsets.symmetric(
                vertical: scaleHeight(context, 24),
                horizontal: scaleWidth(context, 33)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: const Color(0xffBDBDBD).withOpacity(0.8))),
            child: Column(
              children: [
                SizedBox(
                  height: scaleHeight(context, 13),
                ),
                SvgPicture.asset(
                  "assets/icons/Dashboard/sendIcon.svg",
                  height: scaleHeight(context, 110),
                ),
                Text(
                  "Communicate with Participants",
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 18),
                      fontWeight: FontWeight.w400,
                      color: darkCharcoal),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Send updates or announcements easily to all attendees. Click below to compose your message.",
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 14),
                      fontWeight: FontWeight.w400,
                      color: darkCharcoal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: scaleHeight(context, 17),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                      builder: (BuildContext context) {
                        return const ComposeEmail();
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        horizontal: scaleWidth(context, 15)),
                    height: scaleHeight(context, 53),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color(0xffBDBDBD).withOpacity(0.8))),
                    child: const Center(child: Text("Compose Email")),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: scaleHeight(context, 163),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: scaleWidth(context, 33)),
            padding: EdgeInsets.all(scaleHeight(context, 15)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: const Color(0xffBDBDBD).withOpacity(0.8))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: scaleHeight(context, 4)),
                  child: Text(
                    "Share it on",
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 18),
                        fontWeight: FontWeight.w400,
                        color: darkCharcoal),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Dashboard/whatsappIcon.svg',
                        width: scaleHeight(context, 34),
                        height: scaleHeight(context, 34)),
                    SvgPicture.asset(
                        'assets/icons/Dashboard/instagramSvgIcon.svg',
                        width: scaleHeight(context, 34),
                        height: scaleHeight(context, 34)),
                    SvgPicture.asset(
                        'assets/icons/Dashboard/facebookSvgIcon.svg',
                        width: scaleHeight(context, 34),
                        height: scaleHeight(context, 34)),
                    SvgPicture.asset('assets/icons/Dashboard/redditIcon.svg',
                        width: scaleHeight(context, 34),
                        height: scaleHeight(context, 34)),
                    SvgPicture.asset('assets/icons/Dashboard/twitter.svg',
                        width: scaleHeight(context, 34),
                        height: scaleHeight(context, 34)),
                  ],
                ),
                Container(
                    height: scaleHeight(context, 44),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xffBDBDBD))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: scaleWidth(context, 10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.url,
                            style: GoogleFonts.getFont(fontFamily2,
                                fontSize: scaleHeight(context, 16),
                                fontWeight: FontWeight.w400,
                                color: darkCharcoal),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffBDBDBD))),
                            height: scaleHeight(context, 30),
                            width: scaleWidth(context, 20),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: scaleHeight(context, 265),
            margin: EdgeInsets.symmetric(
                vertical: scaleHeight(context, 24),
                horizontal: scaleWidth(context, 33)),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: const Color(0xffBDBDBD).withOpacity(0.8))),
            padding: EdgeInsets.all(scaleHeight(context, 15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "More Feature ",
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleHeight(context, 18),
                          fontWeight: FontWeight.w400,
                          color: darkCharcoal),
                    ),
                  ],
                ),
                Container(
                  color: lightSilverGrey,
                  width: scaleHeight(context, 65),
                  height: scaleHeight(context, 65),
                ),
                Text(
                  "Enable Payments ",
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 21),
                      fontWeight: FontWeight.w500,
                      color: darkCharcoal),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 16),
                      fontWeight: FontWeight.w400,
                      color: darkCharcoal),
                ),
                SizedBox(
                  height: scaleHeight(context, 5),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: lightSilverGrey,
                        borderRadius: BorderRadius.circular(15)),
                    width: double.infinity,
                    height: scaleHeight(context, 45),
                    child: Center(
                      child: Text(
                        "Enable",
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleHeight(context, 16),
                            fontWeight: FontWeight.w400,
                            color: darkCharcoal),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: scaleHeight(context, 11),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
