import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class GeneralInfo extends StatefulWidget {
  const GeneralInfo({super.key});

  @override
  State<GeneralInfo> createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: scaleHeight(context, 24)),
      width: double.infinity,
      child: Wrap(
        spacing: scaleWidth(context, 25),
        runSpacing: scaleHeight(context, 18),
        children: [
          buildContainer('Gender', 'Female', context),
          buildContainer('Email', 'shanaya12@gmail.com', context),
          buildContainer('City', 'Jaipur', context),
          buildContainer('Date Of Birth', '18/03/2001', context),
          Container(
              height: scaleHeight(context, 44),
              width: scaleWidth(context, 311),
              padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(context, 12),
                  vertical: scaleHeight(context, 7)),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: const Color(0xffc0dde3)),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: scaleHeight(context, 30),
                      width: scaleWidth(context, 30),
                      decoration: const BoxDecoration(
                        color: Color(0xff44a6bb),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                          'assets/icons/defaultEditPortal/add.svg')),
                  SizedBox(width: scaleWidth(context, 12)),
                  Text('Add Your Mobile Number',
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleWidth(context, 12),
                          color: const Color(0xff1a202c),
                          height: lineHeight(16.8, 12),
                          fontWeight: FontWeight.w400)),
                ],
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Social Links',
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleWidth(context, 14),
                      color: const Color(0xff1a202c),
                      height: lineHeight(19.2, 14),
                      fontWeight: FontWeight.w300)),
              SizedBox(height: scaleHeight(context, 8)),
              Wrap(
                spacing: scaleWidth(context, 12),
                children: [
                  socialLinks('assets/icons/defaultEditPortal/add.svg'),
                  socialLinks('assets/icons/defaultEditPortal/add.svg'),
                  socialLinks('assets/icons/defaultEditPortal/add.svg'),
                  socialLinks('assets/icons/defaultEditPortal/add.svg'),
                  socialLinks('assets/icons/defaultEditPortal/add.svg'),
                ],
              )
            ],
          ),
          SizedBox(height: scaleHeight(context, 8))
        ],
      ),
    );
  }

  Container socialLinks(String path) {
    return Container(
        height: scaleHeight(context, 32),
        width: scaleWidth(context, 32),
        decoration: const BoxDecoration(
            color: Color(0xff44a6bb), shape: BoxShape.circle),
        child: SvgPicture.asset(path));
  }

  Container buildContainer(String key, String value, BuildContext context) {
    return Container(
        height: scaleHeight(context, 44),
        width: scaleWidth(context, 311),
        padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(context, 12),
            vertical: scaleHeight(context, 7)),
        decoration: const BoxDecoration(
            color: Color(0xffc0dde3),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: scaleHeight(context, 30),
              width: scaleWidth(context, 30),
              decoration: const BoxDecoration(
                  color: Color(0xff44a6bb), shape: BoxShape.circle),
            ),
            SizedBox(width: scaleWidth(context, 12)),
            Text(key,
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleWidth(context, 12),
                    color: const Color(0xff1a202c),
                    height: lineHeight(16.8, 12),
                    fontWeight: FontWeight.w400)),
            const Spacer(),
            Text(value,
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleWidth(context, 12),
                    color: const Color(0xff1a202c),
                    height: lineHeight(16.8, 12),
                    fontWeight: FontWeight.w500)),
          ],
        ));
  }
}
