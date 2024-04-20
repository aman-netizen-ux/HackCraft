import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/ProfileModel/getUserProfileModel.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class GeneralInfo extends StatefulWidget {
  final User user;
  const GeneralInfo({super.key, required this.user});

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
          buildContainer('Gender', widget.user.gender, context, false),
          buildContainer('Email', widget.user.email, context, false),
          buildContainer('City', widget.user.city, context, false),
          buildContainer(
              'Date Of Birth',
              widget.user.dateOfBirth == null
                  ? "Add your date of birth"
                  : widget.user.dateOfBirth,
              context,
              widget.user.dateOfBirth == null),
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
              SizedBox(
                width: scaleWidth(context, 311),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      widget.user.socialLinks.behance.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.codepen.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.dribble.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.facebook.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.figma.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.github.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.instagram.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.linkedin.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.medium.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.reddit.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.slack.isNotEmpty
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg')
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
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

  Container buildContainer(
      String key, String value, BuildContext context, bool empty) {
    return empty
        ? Container(
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
                Text(value,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleWidth(context, 12),
                        color: const Color(0xff1a202c),
                        height: lineHeight(16.8, 12),
                        fontWeight: FontWeight.w400)),
              ],
            ))
        : Container(
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
