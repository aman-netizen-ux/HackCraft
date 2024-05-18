import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/ProfileModel/getUserProfileModel.dart';
import 'package:major_project__widget_testing/state/profile-provider/profile_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class Educational extends StatefulWidget {
  final User user;
  const Educational({super.key, required this.user});

  @override
  State<Educational> createState() => _EducationalState();
}

class _EducationalState extends State<Educational> {
  List<Color> chipColors = [
    const Color(0xffffe2f7),
    const Color(0xffd9e6ff),
    const Color(0xffe7d3ff),
    const Color(0xffffddd2),
    const Color(0xffe2ebe5)
  ];

  List<Color> chipBorderColors = [
    const Color(0xffe1319b),
    const Color(0xff518afa),
    const Color(0xff7537c5),
    const Color(0xffff7e55),
    const Color(0xff3e7e60)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.only(top: scaleHeight(context, 24)),
        width: double.infinity,
        child: Wrap(
          spacing: scaleWidth(context, 25),
          runSpacing: scaleHeight(context, 18),
          children: [
            buildContainer(
                'Qualification',
                widget.user.educationQualification.trim().isEmpty
                    ? "Add your educational qualification"
                    : widget.user.educationQualification.toString(),
                context,
                widget.user.educationQualification.trim().isEmpty),
            buildContainer(
                'Percentage',
                widget.user.percentage! > -1
                    ? widget.user.percentage.toString()
                    : "Add your percentage",
                context,
                widget.user.percentage! <= -1),
            if (!(widget.user.educationQualification == "Senior Secondary" ||
                widget.user.educationQualification == "Secondary")) ...[
              buildContainer(
                  'Specialization',
                  widget.user.specialization!.trim().isEmpty
                      ? "Add your specialization"
                      : widget.user.specialization.toString(),
                  context,
                  widget.user.specialization!.trim().isEmpty),
              buildContainer(
                  'Degree',
                  widget.user.degree!.trim().isEmpty &&
                          widget.user.courseEndYear < 0
                      ? 'Add your course name and year'
                      : '${widget.user.degree} | ${widget.user.courseEndYear}',
                  context,
                  widget.user.degree!.trim().isEmpty &&
                      widget.user.courseEndYear <= 0),
            ],
           buildInterestChips('Interest', widget.user.interest, widget.user.interest.isEmpty(), "Add your Interest"),
            buildChips('Skills', widget.user.skills, widget.user.skills.isEmpty, "Add your skills"),
            SizedBox(height: scaleHeight(context, 8))
          ],
        ),
      ),
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

  Widget buildChips(String key, List<String> value, bool isEmpty, String title) {
      final profileProvider = Provider.of<ProfileProvider>(context);
    return isEmpty? InkWell(
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
                    Text(title,
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 12),
                            color: const Color(0xff1a202c),
                            height: lineHeight(16.8, 12),
                            fontWeight: FontWeight.w400)),
                  ],
                )),
          ):SizedBox(
      width: scaleWidth(context, 311),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(key,
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleWidth(context, 14),
                  color: const Color(0xff1a202c),
                  height: lineHeight(19.2, 14),
                  fontWeight: FontWeight.w300)),
          SizedBox(height: scaleHeight(context, 10)),
          Wrap(
            spacing: scaleWidth(context, 9),
            runSpacing: scaleHeight(context, 12),
            children: [
              for (int i = 0; i < value.length; i++)
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: scaleWidth(context, 35),
                      vertical: scaleHeight(context, 6)),
                  decoration: BoxDecoration(
                      color: chipColors[i % chipColors.length],
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                          color:
                              chipBorderColors[i % chipBorderColors.length])),
                  child: Text(value[i],
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleWidth(context, 12),
                          color: const Color(0xff1a202c),
                          height: lineHeight(16.8, 12),
                          fontWeight: FontWeight.w400)),
                )
            ],
          )
        ],
      ),
    );
  }

  Widget buildInterestChips(String key, Interest value, bool isEmpty, String title) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return isEmpty
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
                    Text(title,
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 12),
                            color: const Color(0xff1a202c),
                            height: lineHeight(16.8, 12),
                            fontWeight: FontWeight.w400)),
                  ],
                )),
          )
        : SizedBox(
            width: scaleWidth(context, 311),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(key,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleWidth(context, 14),
                        color: const Color(0xff1a202c),
                        height: lineHeight(19.2, 14),
                        fontWeight: FontWeight.w300)),
                SizedBox(height: scaleHeight(context, 10)),
                Wrap(
                  spacing: scaleWidth(context, 9),
                  runSpacing: scaleHeight(context, 12),
                  children: [
                    for (int i = 0; i < value.key.length; i++)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: scaleWidth(context, 35),
                            vertical: scaleHeight(context, 6)),
                        decoration: BoxDecoration(
                            color: chipColors[i % chipColors.length],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                                color: chipBorderColors[
                                    i % chipBorderColors.length])),
                        child: Text(value.key[i],
                            style: GoogleFonts.getFont(fontFamily2,
                                fontSize: scaleWidth(context, 12),
                                color: const Color(0xff1a202c),
                                height: lineHeight(16.8, 12),
                                fontWeight: FontWeight.w400)),
                      )
                  ],
                )
              ],
            ),
          );
  }
}
