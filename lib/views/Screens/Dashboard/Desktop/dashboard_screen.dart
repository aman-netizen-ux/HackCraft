import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/Desktop/dashboard_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          )),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: scaleWidth(context, 53), top: scaleHeight(context, 56)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Dashboard",
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 24),
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal),
              ),
              Padding(
                padding: EdgeInsets.only(top: scaleHeight(context, 6)),
                child: Text(
                  "Lorem Ipsum",
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 18),
                      fontWeight: FontWeight.w500,
                      color: darkCharcoal),
                ),
              ),
              SizedBox(
                height: scaleHeight(context, 38),
              ),
              Text(
                "Live",
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 18),
                    fontWeight: FontWeight.w500,
                    color: slateGray),
              ),
              SizedBox(
                height: scaleHeight(context, 16),
              ),
              Wrap(
                runSpacing: scaleHeight(context, 10), 
                spacing: scaleWidth(context, 10),
                children: List.generate(2, (index) => DashboardCard()).toList(),
              ),
              SizedBox(height: scaleHeight(context, 35)),
              Text(
                "Open",
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 18),
                    fontWeight: FontWeight.w500,
                    color: slateGray),
              ),
              SizedBox(
                height: scaleHeight(context, 16),
              ),
              Wrap(
                runSpacing: scaleHeight(context, 10),
                spacing: scaleWidth(context, 10),
                children: List.generate(4, (index) => DashboardCard()).toList(),
              ),
              SizedBox(
                height: scaleHeight(context, 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
