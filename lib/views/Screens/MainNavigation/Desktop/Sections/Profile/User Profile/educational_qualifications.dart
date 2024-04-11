import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class Educational extends StatefulWidget {
  final String eduType;
  const Educational({super.key, required this.eduType});

  @override
  State<Educational> createState() => _EducationalState();
}

class _EducationalState extends State<Educational> {
  List<String> interest = [
    'Dancing',
    'Music',
    'Skiing',
    'Boxing',
    'Calisthenics',
    'Singing',
    'Art'
  ];
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
            buildContainer('Qualification', 'Undergrad', context),
            buildContainer('Percentage', '89%', context),
            if (!(widget.eduType == "Senior Secondary" ||
                widget.eduType == "Secondary")) ...[
              buildContainer('Specialization', 'CSE', context),
              buildContainer('Degree', 'B.tech | 2024', context),
            ],
            buildChips('Interest', interest),
            buildChips('Skills', interest),
            SizedBox(height: scaleHeight(context, 8))
          ],
        ),
      ),
    );
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

  SizedBox buildChips(String key, List<String> value) {
    return SizedBox(
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
}
