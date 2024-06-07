import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/DashboardModel/registration_model.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

SizedBox memberDetails(BuildContext context, List<Member> memberDetail) {
  int length = memberDetail.length;
  return SizedBox(
    child: Column(
      children: [
        ...List.generate(length, (index) {
          return SizedBox(
            height: scaleHeight(context, 40),
            child: Row(
              children: [
                Container(
                  width: scaleWidth(context,450),
                  alignment: Alignment.center,
                  child: Text(
                    '${memberDetail[index].firstName} ${memberDetail[index].lastName}',
                    style: GoogleFonts.getFont(
                      fontFamily2,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff686a6e),
                      fontSize: scaleHeight(context, 16),
                    ),
                  ),
                ),
                ...memberDetail[index].submittedDetails.values.map((value) {
                  return Row(
                    children: [
                      Container(
                        width: 1,
                        height: scaleHeight(context, 40),
                        color: const Color(0xff858d9a),
                      ),
                      Container(
                        width: scaleWidth(context, 160),
                        alignment: Alignment.center,
                        child: Text(
                          value.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff686a6e),
                            fontSize: scaleHeight(context, 16),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        }),
      ],
    ),
  );
}
