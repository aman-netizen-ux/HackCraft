import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/DashboardProvider/dashboardProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    return InkWell(
      onTap: () {
        dashboardProvider.setSelectedIndex(1);
      },
      child: Card(
        margin: EdgeInsets.only(right: scaleWidth(context, 20)),
        color: const Color(0xffE8EDF1),
        child: Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
          padding: EdgeInsets.all(scaleHeight(context, 19)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: scaleHeight(context, 24),
                    width: scaleHeight(context, 24),
                    decoration: BoxDecoration(
                        color: lightSilverGrey,
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  Container(
                    height: scaleHeight(context, 16),
                    width: scaleWidth(context, 48),
                    decoration: BoxDecoration(
                        color: lightSilverGrey,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              SizedBox(
                height: scaleHeight(context, 39),
              ),
              Text(
                'Ctrl Freaks',
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 14),
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal),
              ),
              Text(
                'Debug There',
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 24),
                    fontWeight: FontWeight.w600,
                    color: darkCharcoal),
              ),
              SizedBox(height: scaleHeight(context, 21)),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: scaleWidth(context, 25)),
                    child: Column(
                      children: [
                        Text(
                          'Start Date',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 12),
                              fontWeight: FontWeight.w400,
                              color: darkCharcoal.withOpacity(0.8)),
                        ),
                        Text(
                          '22/04/24',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 14),
                              fontWeight: FontWeight.w500,
                              color: darkCharcoal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: scaleWidth(context, 25)),
                    child: Column(
                      children: [
                        Text(
                          'Start Date',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 12),
                              fontWeight: FontWeight.w400,
                              color: darkCharcoal.withOpacity(0.8)),
                        ),
                        Text('22/04/24',
                            style: GoogleFonts.getFont(fontFamily2,
                                fontSize: scaleHeight(context, 14),
                                fontWeight: FontWeight.w500,
                                color: darkCharcoal)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Other Num',
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleHeight(context, 12),
                            fontWeight: FontWeight.w400,
                            color: darkCharcoal.withOpacity(0.8)),
                      ),
                      Text('220',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 14),
                              fontWeight: FontWeight.w500,
                              color: darkCharcoal)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: scaleHeight(context, 50),
              ),
              Container(
                height: scaleHeight(context, 24),
                width: scaleHeight(context, 24),
                decoration: BoxDecoration(
                    color: lightSilverGrey,
                    borderRadius: BorderRadius.circular(24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
