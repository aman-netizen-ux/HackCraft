import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class RoundCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String enddate;
  final String startDate;
  const RoundCard({super.key, required this.title, required this.enddate, required this.startDate, this.onTap});

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      hoverColor: Colors.white,
      onTap: onTap,
      child: Container(
          height: scaleHeight(context, 67),
          width: double.infinity,
          margin : EdgeInsets.only(bottom : scaleHeight(context, 36), left : scaleWidth(context, 47), right : scaleWidth(context, 52), top : scaleHeight(context, 10)),
          decoration: BoxDecoration(
            color : Colors.white,
              borderRadius: BorderRadius.circular(rad5_3),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: scaleWidth(context, 25), top: scaleHeight(context, 15)),
                child: Text(title,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 20),
                        color: black1,
                        height: lineHeight(22.4, 20),
                        fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: scaleWidth(context, 25),
                    bottom: scaleHeight(context, 6)),
                child: Text('$startDate - $enddate',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 18),
                        color: black1,
                        height: lineHeight(22.4, 20),
                        fontWeight: FontWeight.w400)),
              )
            ],
          )),
    );
  }
}
