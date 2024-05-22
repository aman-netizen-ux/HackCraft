import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/ProfileModel/userRegisteredHackathons.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/state/profile-provider/profile_registration_provider.dart';
import 'package:major_project__widget_testing/state/profile-provider/user_hackathons_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class Registrations extends StatefulWidget {
  const Registrations({super.key});

  @override
  State<Registrations> createState() => _RegistrationsState();
}

class _RegistrationsState extends State<Registrations> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _loadHackathonData();
  }

  void _loadHackathonData() async {
    setState(() {
      _isLoading = true; // Set loading state when fetching data
    });
    try {
      final hackathonsProvider =
          Provider.of<UserHackathons>(context, listen: false);
      final hackProvider =
          Provider.of<ProfileRegProvider>(context, listen: false);
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      debugPrint('email in profile : ${loginProvider.emailId}');
      await hackathonsProvider.fetchUserHackathons(loginProvider.emailId,
          hackProvider.dropdownValue, hackProvider.sortValue);
    } catch (e) {
      debugPrint("Error fetching user: $e");
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final hackProvider = Provider.of<ProfileRegProvider>(context);
    final userHackathonsProvider = Provider.of<UserHackathons>(context);
    final userHackathons = userHackathonsProvider.userHackathons;
    return Container(
      width: double.infinity,
      height: scaleHeight(context, 820),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
      child: Row(
        children: [
          Expanded(
            flex: 705,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(context, 28),
                  vertical: scaleHeight(context, 55)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Registered Hackathons',
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 22),
                            color: const Color(0xff1a202c),
                            height: lineHeight(28.8, 22),
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: scaleHeight(context, 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Filter by: ',
                            style: GoogleFonts.getFont(fontFamily2,
                                fontSize: scaleWidth(context, 14),
                                color: const Color(0xff1a202c),
                                height: lineHeight(19.2, 14),
                                fontWeight: FontWeight.w500)),
                        SizedBox(width: scaleWidth(context, 25)),
                        Container(
                          height: scaleHeight(context, 32),
                          width: scaleWidth(context, 97),
                          padding: EdgeInsets.symmetric(
                              horizontal: scaleWidth(context, 12),
                              vertical: scaleHeight(context, 3)),
                          decoration: const BoxDecoration(
                              color: Color(0xffe2e2e2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: hackProvider.dropdownValue,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 24,
                              style: GoogleFonts.getFont(fontFamily2,
                                  fontSize: scaleWidth(context, 14),
                                  color: const Color(0xff1a202c),
                                  height: lineHeight(19.2, 14),
                                  fontWeight: FontWeight.w500),
                              onChanged: (value) {
                                hackProvider.selectValue(value!);
                                _loadHackathonData();
                              },
                              items: <String>[
                                'All',
                                'Close',
                                'Open',
                                'Live'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        // SizedBox(width: scaleWidth(context, 13)),
                        // Container(
                        //   height: scaleHeight(context, 32),
                        //   width: scaleWidth(context, 120),
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: scaleWidth(context, 12),
                        //       vertical: scaleHeight(context, 3)),
                        //   decoration: const BoxDecoration(
                        //       color: Color(0xffe2e2e2),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(50))),
                        //   child: DropdownButtonHideUnderline(
                        //     child: DropdownButton<String>(
                        //       value: hackProvider.finishedDropdownValue,
                        //       icon: const Icon(Icons.arrow_drop_down_sharp),
                        //       iconSize: 24,
                        //       style: GoogleFonts.getFont(fontFamily2,
                        //           fontSize: scaleWidth(context, 14),
                        //           color: const Color(0xff1a202c),
                        //           height: lineHeight(19.2, 14),
                        //           fontWeight: FontWeight.w500),
                        //       onChanged: (value) {
                        //         hackProvider.selectFinishedValue(value!);
                        //       },
                        //       items: <String>['Complete', 'Incomplete']
                        //           .map<DropdownMenuItem<String>>((String value) {
                        //         return DropdownMenuItem<String>(
                        //           value: value,
                        //           child: Text(value),
                        //         );
                        //       }).toList(),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(width: scaleWidth(context, 13)),
                        Container(
                          height: scaleHeight(context, 32),
                          width: scaleWidth(context, 120),
                          padding: EdgeInsets.symmetric(
                              horizontal: scaleWidth(context, 12),
                              vertical: scaleHeight(context, 3)),
                          decoration: const BoxDecoration(
                              color: Color(0xffe2e2e2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: hackProvider.sortValue,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 24,
                              style: GoogleFonts.getFont(fontFamily2,
                                  fontSize: scaleWidth(context, 14),
                                  color: const Color(0xff1a202c),
                                  height: lineHeight(19.2, 14),
                                  fontWeight: FontWeight.w500),
                              onChanged: (value) {
                                hackProvider.selectSortValue(value!);
                                _loadHackathonData();
                              },
                              items: <String>[
                                'Latest',
                                'Oldest'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: scaleHeight(context, 20)),
                    _isLoading
                        ? const Center(
                            child:
                                CircularProgressIndicator(), 
                          )
                        : userHackathons != null &&
                                userHackathons.hackathons.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount: userHackathons.hackathons.length,
                                  itemBuilder: (context, index) {
                                    RegisteredHackathon hackathon =
                                        userHackathons.hackathons[index];
                                    return hackathonCard(
                                        hackathon.name,
                                        hackathon.organizationName,
                                        hackathon.teamName,
                                        hackathon.hackathonDeadline,
                                        extractDate(
                                            hackathon.userRegisteredDate),
                                        hackathon.tag,
                                        "",
                                        hackathon.percentage,
                                        );
                                  },
                                ),
                              )
                            : Center(
                                child: Text(
                                  'No hackathons found.',
                                  style: TextStyle(
                                    fontSize: scaleWidth(context, 16),
                                    color: const Color(0xff1a202c),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                  ]),
            ),
          ),
          Expanded(
              flex: 295,
              child: Container(
                margin: EdgeInsets.only(top: scaleHeight(context, 29)),
                decoration: const BoxDecoration(
                    color: Color(0xffE8EBEC),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
              ))
        ],
      ),
    );
  }

  String extractDate(String dateTimeString) {
    if (dateTimeString.length < 10) {
      return '';
    }

    // Extract date part "2024-05-14" from "2024-05-14T05:06:53.039570Z"
    return dateTimeString.substring(0, 10);
  }

  Container hackathonCard(
      String hackathonName,
      String organisationName,
      String teamName,
      String deadline,
      String registeredDate,
      List<String> tags,
      String logo,
      double progress) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        margin: EdgeInsets.only(bottom: scaleHeight(context, 25)),
        decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.25),
                blurRadius: 10, // Blur radius
                offset: const Offset(0, 1), // Offset
              ),
            ]),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: scaleWidth(context, 65),
            width: scaleWidth(context, 65),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: lightSilver),
          ),
          SizedBox(width: scaleWidth(context, 13)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(hackathonName,
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 19),
                            color: const Color(0xff1a202c),
                            height: lineHeight(25.2, 19),
                            fontWeight: FontWeight.w500)),
                    ...tags.map((tag) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: scaleWidth(context, 13),
                          vertical: scaleHeight(context, 1)),
                      margin: EdgeInsets.only(
                          top: scaleHeight(context, 5),
                          left: scaleWidth(context, 12)),
                      decoration: BoxDecoration(
                          color: tag == "open"
                              ? const Color(0xffffddd2)
                              : tag == "closed"
                                  ? const Color(0xffffe2f7)
                                  : const Color(0xffe7d3ff),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: 
                      Text(tag,
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleWidth(context, 12),
                              color: tag == "open"
                                  ? const Color(0xffff7e55).withOpacity(0.6)
                                  : tag == "closed"
                                      ? const Color(0xfff089c9)
                                      : const Color(0xff7537c5),
                              height: lineHeight(16.8, 12),
                              fontWeight: FontWeight.w600)),
                    )).toList(),
                 
                    progress != 100
                        ? Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: scaleWidth(context, 11),
                                    top: scaleHeight(context, 5)),
                                width: scaleWidth(context, 180),
                                height: scaleHeight(context, 13),
                                child: const LinearProgressIndicator(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  backgroundColor: Colors.transparent,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      lightSilver),
                                  value: 1,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: scaleWidth(context, 11),
                                    top: scaleHeight(context, 5)),
                                width: scaleWidth(context, 180),
                                height: scaleHeight(context, 13),
                                child: LinearProgressIndicator(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Color(0xfffc9d9d)),
                                  value: progress.toDouble() / 100,
                                ),
                              ),
                            ],
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: scaleWidth(context, 12),
                                vertical: scaleHeight(context, 1)),
                            margin: EdgeInsets.only(
                                top: scaleHeight(context, 5),
                                left: scaleWidth(context, 12)),
                            decoration: const BoxDecoration(
                                color: Color(0xffcbefd7),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text('Completed',
                                style: GoogleFonts.getFont(fontFamily2,
                                    fontSize: scaleWidth(context, 12),
                                    color: const Color(0xff3e7e60),
                                    height: lineHeight(16.8, 12),
                                    fontWeight: FontWeight.w600)),
                          ),
                    progress != 100
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: scaleWidth(context, 11),
                                top: scaleHeight(context, 5)),
                            child: Text('$progress% Completed',
                                style: GoogleFonts.getFont(fontFamily2,
                                    fontSize: scaleWidth(context, 12),
                                    color: const Color(0xff1a202c)
                                        .withOpacity(0.6),
                                    height: lineHeight(16.8, 12),
                                    fontWeight: FontWeight.w400)),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('By $organisationName',
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 12),
                            color: const Color(0xff1a202c).withOpacity(0.6),
                            height: lineHeight(16.8, 12),
                            fontWeight: FontWeight.w400)),
                    Text('Deadline: $deadline',
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 12),
                            color: const Color(0xff1a202c).withOpacity(0.6),
                            height: lineHeight(16.8, 12),
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Team: $teamName',
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 12),
                            color: const Color(0xff1a202c).withOpacity(0.6),
                            height: lineHeight(16.8, 12),
                            fontWeight: FontWeight.w400)),
                    Text('Registered On: $registeredDate',
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: scaleWidth(context, 12),
                            color: const Color(0xff1a202c).withOpacity(0.6),
                            height: lineHeight(16.8, 12),
                            fontWeight: FontWeight.w400)),
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
