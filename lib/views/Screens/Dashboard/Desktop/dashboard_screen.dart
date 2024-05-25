import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/api/Dashboard/getDashboardHackathon.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/DashboardModel/hackathonModel.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/Desktop/dashboard_card.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<HackathonModel>? liveHackathons;
  List<HackathonModel>? openHackathons;
  List<HackathonModel>? closedHackathons;
  late Future<Map<String, List<HackathonModel>>> futureHackathons;

  @override
  void initState() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    super.initState();
    GetDashboardHackathon()
        .fetchHackathons(loginProvider.emailId)
        .then((hackathons) {
      setState(() {
        liveHackathons = hackathons['live'];
        openHackathons = hackathons['open'];
        closedHackathons = hackathons['close'];
      });
    }).catchError((error) {
      debugPrint('Error fetching hackathons: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: scaleHeight(context, 820),
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
              // Text(
              //   "Pending",
              //   style: GoogleFonts.getFont(fontFamily2,
              //       fontSize: scaleHeight(context, 18),
              //       fontWeight: FontWeight.w500,
              //       color: slateGray),
              // ),
              // SizedBox(
              //   height: scaleHeight(context, 16),
              // ),
              // Wrap(
              //   runSpacing: scaleHeight(context, 10),
              //   spacing: scaleWidth(context, 10),
              //   children: List.generate(2, (index) => DashboardCard()).toList(),
              // ),
              // SizedBox(
              //   height: scaleHeight(context, 38),
              // ),
              liveHackathons != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Live Hackathons',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 18),
                              fontWeight: FontWeight.w500,
                              color: slateGray),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: [
                            for (final hackathon in liveHackathons!)
                              DashboardCard(hackathon: hackathon),
                          ],
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(height: scaleHeight(context, 35)),
              openHackathons != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Open Hackathons',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 18),
                              fontWeight: FontWeight.w500,
                              color: slateGray),
                        ),
                        SizedBox(height: scaleHeight(context, 10)),
                        Wrap(
                          spacing: 10,
                          children: [
                            for (final hackathon in openHackathons!)
                              DashboardCard(hackathon: hackathon),
                          ],
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: scaleHeight(context, 16),
              ),
              closedHackathons != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Closed Hackathons',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 18),
                              fontWeight: FontWeight.w500,
                              color: slateGray),
                        ),
                        SizedBox(height: scaleHeight(context, 10)),
                        Wrap(
                          spacing: 10,
                          children: [
                            for (final hackathon in closedHackathons!)
                              DashboardCard(hackathon: hackathon),
                          ],
                        ),
                      ],
                    )
                  : Container(),
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
