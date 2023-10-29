import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';

class HostDesktopBody extends StatelessWidget {
  const HostDesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainNavBar(),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 54),
                        color: black1,
                        fontWeight: FontWeight.w500,
                        height: lineHeight(70, 54))),
                SizedBox(
                  height: scaleHeight(context, 39),
                ),
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 18),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22, 18))),
                SizedBox(
                  height: scaleHeight(context, 44),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/templateSelection');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: scaleHeight(context, 5),
                              horizontal: scaleWidth(context, 39)),
                          backgroundColor: red,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(rad5_10),
                          )),
                      child: Text('Continue Hosting',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 14),
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              height: lineHeight(22, 14))),
                    ),
                    SizedBox(
                      width: scaleWidth(context, 28),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: scaleHeight(context, 5),
                              horizontal: scaleWidth(context, 39)),
                          backgroundColor: Colors.white,
                          elevation: 0,
                          side: BorderSide(color: red, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(rad5_10),
                          )),
                      child: Text('Contact Sponsors',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 14),
                              color: red,
                              fontWeight: FontWeight.w600,
                              height: lineHeight(22, 14))),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

//this navbar will get update acc to the main site
class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: scaleWidth(context, 81),
          left: scaleWidth(context, 81),
          top: scaleHeight(context, 39)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //container to be updated with image logic
              Container(
                height: scaleHeight(context, 44),
                width: scaleHeight(context, 44),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              SizedBox(
                width: scaleWidth(context, 6),
              ),
              Text('HackCraft',
                  style: GoogleFonts.getFont(fontFamily1,
                      fontSize: scaleHeight(context, 20),
                      color: black1,
                      fontWeight: FontWeight.w400,
                      height: lineHeight(22.4, 20))),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: scaleWidth(context, 40)),
                  child: Text('Home',
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleHeight(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(23, 14))),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: scaleHeight(context, 4),
                      horizontal: scaleWidth(context, 10)),
                  margin:
                      EdgeInsets.symmetric(horizontal: scaleWidth(context, 40)),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: red,
                    width: 2,
                  ))),
                  child: Text('Host',
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleHeight(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w500,
                          height: lineHeight(23, 14))),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: scaleWidth(context, 40),
                        right: scaleWidth(context, 16),
                      ),
                      child: Text('Profile',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 14),
                              color: black1,
                              fontWeight: FontWeight.w400,
                              height: lineHeight(23, 14))),
                    ),
                    Container(
                      height: scaleHeight(context, 44),
                      width: scaleHeight(context, 44),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
