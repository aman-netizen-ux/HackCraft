import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class HomeLanding extends StatelessWidget {
  final VoidCallback onExploreTap;
  const HomeLanding({super.key, required this.onExploreTap});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          margin: EdgeInsets.only(
              left: scaleWidth(context, 50), right: scaleWidth(context, 50)),
          height: scaleHeight(context, 500),
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)), color: blue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: scaleHeight(context, 40),
                width: scaleWidth(context, 400),
                margin: EdgeInsets.only(
                    top: scaleHeight(context, 100),
                    left: scaleWidth(context, 50)),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Text(
                    'Simplify, Customize, Organize: Hackathons, Perfected',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 20),
                        color: blue,
                        height: lineHeight(22.4, 20),
                        fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: scaleHeight(context, 50),
                    left: scaleWidth(context, 50)),
                child: Text('Participate and \nConduct Hackathons',
                    maxLines: 2,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 54),
                        color: Colors.white,
                        height: lineHeight(60, 54),
                        fontWeight: FontWeight.w500)),
              ),
              InkWell(
                onTap: onExploreTap,
                child: Container(
                  width : scaleWidth(context, 200),
                  height : scaleHeight(context, 50),
                  margin: EdgeInsets.only(
                      top: scaleHeight(context, 50),
                      left: scaleWidth(context, 50)),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: mustard),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Explore Hackathons ',
                          maxLines: 2,
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 20),
                              color: Colors.white,
                              height: lineHeight(22.4, 20),
                              fontWeight: FontWeight.w500)),
                      const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
      Positioned(
          bottom: -scaleHeight(context, 200),
          right: scaleWidth(context, 90),
          child: Transform.flip(
            flipX: true,
            child: SvgPicture.asset('assets/images/home/Onlinegamesaddiction-amico.svg',
                height: scaleHeight(context, 800)),
          ))
    ]);
  }
}
