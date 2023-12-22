import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class HomeHackathon extends StatefulWidget {
  const HomeHackathon({super.key});

  @override
  State<HomeHackathon> createState() => _HomeHackathonState();
}

class _HomeHackathonState extends State<HomeHackathon> {
  bool _isHovering = false;
  late int _index;

  final List<Color> pastelColors = [
    const Color(0xFFD4A5A5),
    const Color(0xFFA5D3D3),
    const Color(0xFFC3C0DF),
    const Color(0xFFE3C6A4),
    const Color(0xFFF3E4A5),
    const Color(0xFFA5E3A5),
    const Color(0xFFA4A5E3),
    const Color(0xFFE3A5C0),
    const Color(0xFFC0E3E3),
  ];

  void _setHovering(int index , bool isHovering) {
    setState(() {
      _isHovering = isHovering;
      _index = index;
    });
  }

  Color getRandomPastelColor() {
    final random = Random();
    return pastelColors[random.nextInt(pastelColors.length)];
  }
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text('See New Opportunities Lined Up For You',
          maxLines: 2,
          style: GoogleFonts.getFont(fontFamily2,
              fontSize: scaleHeight(context, 45),
              color: blue,
              height: lineHeight(25, 45),
              fontWeight: FontWeight.w500)),
      SizedBox(
        height: 1000,
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(context, 60),
                vertical: scaleHeight(context, 25)),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisExtent: 230,
            ),
            itemBuilder: (BuildContext context, int index) {
              Color cardColor = getRandomPastelColor();
              return Card(
                  color: grey1,
                  shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(flex : 20,child: Container(color : cardColor)),
                      Expanded(
                        flex : 80,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: scaleWidth(context, 15),
                              top: scaleHeight(context, 20),
                              right: scaleWidth(context, 15)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Hackathon Name is there
                                Text('Hackathon ${index + 1}',
                                    style: GoogleFonts.getFont(fontFamily2,
                                        fontSize: scaleHeight(context, 30),
                                        color: black1,
                                        height: lineHeight(22.4, 30),
                                        fontWeight: FontWeight.w700)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Organization Name is there
                                    Text('Organization Name ${index + 1}',
                                        style: GoogleFonts.getFont(fontFamily2,
                                            fontSize: scaleHeight(context, 18),
                                            color: black1,
                                            height: lineHeight(22.4, 18),
                                            fontWeight: FontWeight.w500)),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        //Start Date is there
                                        Text('Start Date :',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w300)),
                                        Text('Start Date ${index + 1}',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                //Participation Fee is there
                                Text('Pricing ${index + 1}',
                                    style: GoogleFonts.getFont(fontFamily2,
                                        fontSize: scaleHeight(context, 32),
                                        color: mustard,
                                        height: lineHeight(25, 32),
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Team Size :',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w300)),
                                        Text('Team Size ${index + 1}',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Mode of Conduct :',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w300)),
                                        Text('Mode of Conduct ${index + 1}',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Venue :',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w300)),
                                        Text('Venue ${index + 1}',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height : 15),
                                MouseRegion(
                                  onEnter: (event) => _setHovering(index, true),
                                  onExit: (event) => _setHovering(index, false),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Center(
                                      child: Container(
                                        width: double.infinity,
                                        height: scaleHeight(context, 50),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(Radius.circular(25)),
                                            color: _isHovering && (index == _index) ? darkBlue : Colors.white,
                                            border: Border.all(color: darkBlue),
                                            ),
                                    
                                        child: Text('See more details',
                                            style: GoogleFonts.getFont(fontFamily2,
                                                fontSize: scaleHeight(context, 20),
                                                color: _isHovering && (index == _index) ? Colors.white : darkBlue,
                                                height: lineHeight(22.4, 20),
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ));
            }),
      )
    ]);
  }
}
