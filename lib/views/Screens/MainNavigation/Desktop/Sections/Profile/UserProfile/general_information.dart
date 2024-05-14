import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/ProfileModel/getUserProfileModel.dart';
import 'package:major_project__widget_testing/state/profile-provider/profile_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralInfo extends StatefulWidget {
  final User user;
  const GeneralInfo({super.key, required this.user});

  @override
  State<GeneralInfo> createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  @override
  Widget build(BuildContext context) {  
    final profileProvider = Provider.of<ProfileProvider>(context);
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
              widget.user.dateOfBirth ?? "Add your date of birth",
              context,
              widget.user.dateOfBirth == null),
              
        widget.user.phone==" " ?  InkWell(
          onTap: () {
            profileProvider.setSelectedIndex(3);
          },
          child: Container(
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
        ) : buildContainer('Mobile No.', widget.user.phone.toString(), context, widget.user.phone!.isEmpty),
         widget.user.socialLinks.behance == " " &&
         widget.user.socialLinks.codepen == " "&&
          widget.user.socialLinks.dribble == " "&&
           widget.user.socialLinks.X == " "&&
            widget.user.socialLinks.facebook == " "&&
             widget.user.socialLinks.figma == " "&&
              widget.user.socialLinks.github == " "&&
               widget.user.socialLinks.instagram == " "&&
                widget.user.socialLinks.linkedin == " "&&
             widget.user.socialLinks.medium == " "&&
              widget.user.socialLinks.reddit == " "&&
               widget.user.socialLinks.slack == " "

               ? InkWell(
          onTap: () {
            profileProvider.setSelectedIndex(3);
          },
          child: Container(
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
                    Text('Add Your Social Links',
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 12),
                            color: const Color(0xff1a202c),
                            height: lineHeight(16.8, 12),
                            fontWeight: FontWeight.w400)),
                  ],
                )),
        ):
         
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
                      widget.user.socialLinks.behance != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.behance)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.codepen != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.codepen)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.dribble != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.dribble)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.facebook != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.facebook)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.figma != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.figma)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.github != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.github)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.instagram != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.instagram)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.linkedin != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.linkedin)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.medium != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.medium)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.reddit != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.reddit)
                          : const SizedBox.shrink(),
                      widget.user.socialLinks.slack != " "
                          ? socialLinks(
                              'assets/icons/defaultEditPortal/add.svg',
                              widget.user.socialLinks.slack)
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

  Widget socialLinks(String path, String urlString) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(urlString);

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          // Can't launch the URL, handle the error
          debugPrint('Could not launch $urlString');
        }
      },
      child: Container(
          height: scaleHeight(context, 32),
          width: scaleWidth(context, 32),
          decoration: const BoxDecoration(
              color: Color(0xff44a6bb), shape: BoxShape.circle),
          child: SvgPicture.asset(path)),
    );
  }

  Widget buildContainer(
      String key, String value, BuildContext context, bool empty) {      
    final profileProvider = Provider.of<ProfileProvider>(context);
    return empty
        ? InkWell(
          onTap: () {
            profileProvider.setSelectedIndex(3);
          },
          child: Container(
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
              )),
        )
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
