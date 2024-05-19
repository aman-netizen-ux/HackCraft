import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/DashboardModel/statisticModel.dart';
import 'package:major_project__widget_testing/state/DashboardProvider/dashboardProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/barChart.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/doughnutChart.dart';
import 'package:provider/provider.dart';

class Statistic extends StatefulWidget {
  final StatisticModel statistic;
  const Statistic({super.key, required this.statistic});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: scaleHeight(context, 40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${dashboardProvider.name} Performance Matrix",
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleHeight(context, 24),
                fontWeight: FontWeight.w500,
                color: darkCharcoal),
          ),
          SizedBox(
            height: scaleHeight(context, 20),
          ),
          Row(
            children: [
              Expanded(
                flex: 560,
                child: Container(
                  height: scaleHeight(context, 212),
                  decoration: BoxDecoration(
                      color: pastelBlueGray,
                      borderRadius: BorderRadius.circular(15)),
                  child: const BarChart(),
                ),
              ),
              Expanded(
                  flex: 440,
                  child: Container(
                    height: scaleHeight(context, 211),
                    margin: EdgeInsets.only(left: scaleWidth(context, 24)),
                    decoration: BoxDecoration(
                      color: const Color(0xff5058DC),
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF5058DC), Color(0xFF8489E7)],
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          top: -50,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -70,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Color(0xFF5058DC),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Share Your QR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  // Container(
                  //   height: scaleHeight(context, 211),
                  //   margin: EdgeInsets.only(left: scaleWidth(context, 24)),
                  //   color: const Color(0xff5058DC),
                  //   child: QRCode(),
                  // ),
                  )
            ],
          ),
          SizedBox(
            height: scaleHeight(context, 24),
          ),
          Row(
            children: [
              Expanded(
                  flex: 585,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: scaleHeight(context, 10),
                        horizontal: scaleWidth(context, 25)),
                    height: scaleHeight(context, 220),
                    decoration: const BoxDecoration(
                        color: pastelBlueGray,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(2),
                            topRight: Radius.circular(2))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem ipsum",
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 18),
                              fontWeight: FontWeight.w500,
                              color: darkCharcoal),
                        ),
                        SizedBox(
                          height: scaleHeight(context, 15),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 50,
                              child: Container(
                                padding:
                                    EdgeInsets.all(scaleHeight(context, 17)),
                                margin: EdgeInsets.only(
                                    right: scaleWidth(context, 16)),
                                height: scaleHeight(context, 150),
                                decoration: BoxDecoration(
                                    color: lightSilverGrey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: scaleWidth(context, 14)),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xffefefef),
                                          ),
                                          height: scaleHeight(context, 40),
                                          width: scaleHeight(context, 40),
                                        ),
                                        Text(
                                          widget.statistic.numberOfRegistrations
                                              .toString(),
                                          style: GoogleFonts.getFont(
                                              fontFamily2,
                                              fontSize:
                                                  scaleHeight(context, 32),
                                              fontWeight: FontWeight.w400,
                                              color: darkCharcoal),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: scaleHeight(context, 17),
                                    ),
                                    Text(
                                      "Total Registrations",
                                      style: GoogleFonts.getFont(fontFamily2,
                                          fontSize: scaleHeight(context, 18),
                                          fontWeight: FontWeight.w400,
                                          color: darkCharcoal),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 50,
                              child: Container(
                                padding:
                                    EdgeInsets.all(scaleHeight(context, 17)),
                                height: scaleHeight(context, 150),
                                decoration: BoxDecoration(
                                    color: lightSilverGrey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: scaleWidth(context, 14)),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xffefefef),
                                          ),
                                          height: scaleHeight(context, 40),
                                          width: scaleHeight(context, 40),
                                        ),
                                        Text(
                                          widget.statistic.numberOfImpressions
                                              .toString(),
                                          style: GoogleFonts.getFont(
                                              fontFamily2,
                                              fontSize:
                                                  scaleHeight(context, 32),
                                              fontWeight: FontWeight.w400,
                                              color: darkCharcoal),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: scaleHeight(context, 17),
                                    ),
                                    Text(
                                      "Total Impressions",
                                      style: GoogleFonts.getFont(fontFamily2,
                                          fontSize: scaleHeight(context, 18),
                                          fontWeight: FontWeight.w400,
                                          color: darkCharcoal),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 415,
                  child: Container(
                    margin: EdgeInsets.only(left: scaleWidth(context, 4)),
                    height: scaleHeight(context, 220),
                    decoration: const BoxDecoration(
                        color: pastelBlueGray,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(2),
                            topLeft: Radius.circular(2),
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: const DoughnutChart(),
                  )),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: scaleHeight(context, 24),
                  bottom: scaleHeight(context, 40)),
              padding: EdgeInsets.symmetric(
                  vertical: scaleHeight(context, 19),
                  horizontal: scaleWidth(context, 36)),
              decoration: BoxDecoration(
                  color: pastelBlueGray,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 280,
                        child: Center(
                          child: Text(
                            'Team Name',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: GoogleFonts.getFont(
                              fontFamily2,
                              fontWeight: FontWeight.w500,
                              color: darkCharcoal,
                              fontSize: scaleHeight(context, 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 240,
                        child: Center(
                          child: Text(
                            'Registration Date',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: GoogleFonts.getFont(
                              fontFamily2,
                              fontWeight: FontWeight.w500,
                              color: darkCharcoal,
                              fontSize: scaleHeight(context, 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 240,
                        child: Text(
                          'Team Leader Name',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontWeight: FontWeight.w500,
                            color: darkCharcoal,
                            fontSize: scaleHeight(context, 16),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 240,
                        child: Center(
                          child: Text(
                            'Team Count',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: GoogleFonts.getFont(
                              fontFamily2,
                              fontWeight: FontWeight.w500,
                              color: darkCharcoal,
                              fontSize: scaleHeight(context, 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: scaleHeight(context, 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scaleHeight(context, 16)),
                    child: Divider(
                      height: scaleHeight(context, 2),
                      color: lightSilverGrey,
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: scaleHeight(context, 42),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5058DC),
                          ),
                          child: Text(
                            'More',
                            style: GoogleFonts.getFont(fontFamily2,
                                fontSize: scaleHeight(context, 21),
                                fontWeight: FontWeight.w500,
                                color: white),
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
