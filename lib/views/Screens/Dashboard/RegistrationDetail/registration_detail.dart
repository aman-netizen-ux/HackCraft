import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/api/Dashboard/getDashboardRegistration.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/DashboardModel/registration_model.dart';
import 'package:major_project__widget_testing/state/DashboardProvider/dashboardProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/RegistrationDetail/registration_detail_header.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/RegistrationDetail/resgitration_expansion_tile.dart';
import 'package:provider/provider.dart';

class RegistrationDetails extends StatefulWidget {
  const RegistrationDetails({super.key});

  @override
  State<RegistrationDetails> createState() => _RegistrationDetailsState();
}

class _RegistrationDetailsState extends State<RegistrationDetails> {
  List<Team>? teamDetails;
  List<Team>? filteredTeamDetails;
  TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dashboardProvider =
        Provider.of<DashboardProvider>(context, listen: false);
    if (teamDetails == null) {
      dashboardProvider.setLoading(true);
      GetDashboardRegistration()
          .fetchTeamData("900dcf01-eb68-485d-adc7-4f32fc796d5d")
          .then((value) {
        setState(() {
          teamDetails = value;
          filteredTeamDetails = value;
          dashboardProvider.setLoading(false);
        });
      }).catchError((error) {
        dashboardProvider.setLoading(false);
        // Handle error here if necessary
      });
    }
  }

  void _filterTeams(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTeamDetails = teamDetails;
      } else {
        filteredTeamDetails = teamDetails!.where((team) {
          return team.teamName.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 40)),
      height: scaleHeight(context, 820),
      decoration: const BoxDecoration(
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: scaleHeight(context, 50),
          ),
          Text(
            "${dashboardProvider.name} Registration",
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleHeight(context, 24),
                fontWeight: FontWeight.w500,
                color: darkCharcoal),
          ),
          Text(
            "Total Team: ${teamDetails?.length ?? 0}",
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleHeight(context, 18),
                fontWeight: FontWeight.w500,
                color: darkCharcoal),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: scaleHeight(context, 32),
                bottom: scaleHeight(context, 19)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: scaleHeight(context, 35),
                    width: scaleWidth(context, 367),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: const Color(0xffC5CAD7))),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: _filterTeams,
                      mouseCursor: SystemMouseCursors.click,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          hintStyle: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 16),
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffC1C7D5)),
                          contentPadding: EdgeInsets.only(
                            left: scaleWidth(context, 18),
                            bottom: scaleHeight(context, 25),
                          ),
                          border: InputBorder.none),
                    )),
                Row(
                  children: [
                    Container(
                      width: scaleHeight(context, 129),
                      height: scaleHeight(context, 37),
                      padding: EdgeInsets.symmetric(
                          horizontal: scaleWidth(context, 10)),
                      decoration: BoxDecoration(
                          color: pastelBlueGray,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          // Container(
                          //   width: scaleHeight(context, 24),
                          //   height: scaleHeight(context, 24),
                          //   decoration: BoxDecoration(
                          //       color: lightSilverGrey,
                          //       borderRadius: BorderRadius.circular(24)),
                          // ),
                          // SizedBox(
                          //   width: scaleWidth(context, 1),
                          // ),
                          // Text(
                          //   'Export',
                          //   style: GoogleFonts.getFont(fontFamily2,
                          //       fontSize: scaleHeight(context, 16),
                          //       fontWeight: FontWeight.w500,
                          //       color: darkCharcoal),
                          // )
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: scaleWidth(context, 5)),
                    //   width: scaleHeight(context, 129),
                    //   height: scaleHeight(context, 37),
                    //   decoration: BoxDecoration(
                    //       color: pastelBlueGray,
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: const Center(child: Text("Filter")),
                    // )
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          registrationDetailHeader(context),
          if (dashboardProvider.isLoadin)
            Container(
                height: scaleHeight(context, 525),
                decoration: const BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    )),
                child: const Center(child: CircularProgressIndicator()))
          else if (filteredTeamDetails == null || filteredTeamDetails!.isEmpty)
            Center(
              child: Column(
                children: [
                  Container(
                    width: scaleWidth(context, 270),
                    height: scaleHeight(context, 140),
                    color: lightSilverGrey,
                  ),
                  SizedBox(
                    height: scaleHeight(context, 21),
                  ),
                  Text(
                    "No Results Found",
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 24),
                        fontWeight: FontWeight.w500,
                        color: darkCharcoal),
                  ),
                  Text(
                    "Your search “${searchController.text}”  didi not match any ..........  Please try again",
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 24),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff68616e)),
                  )
                ],
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: filteredTeamDetails!.length,
                itemBuilder: (context, index) {
                  return RegistrationExpansionTile(
                    teamDetails: filteredTeamDetails![index],
                    colorCheck: index % 2 == 0,
                  );
                },
              ),
            ),
          Text(
            "Showing Page ",
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleHeight(context, 16),
                fontWeight: FontWeight.w500,
                color: darkCharcoal.withOpacity(0.8)),
          )
        ],
      ),
    );
  }
}
