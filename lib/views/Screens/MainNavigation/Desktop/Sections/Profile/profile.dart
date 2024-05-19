import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/getAllHackathons/getAllHackathonsProvider.dart';
import 'package:major_project__widget_testing/state/profile-provider/profile_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // bool _isHovering = false;
  // late int _index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final hackathonsProvider =
        Provider.of<AllHackathonProvider>(context, listen: false);
    hackathonsProvider.getAllHackathonsList();
  }

  // final List<Color> pastelColors = [
  //   const Color(0xFFD4A5A5),
  //   const Color(0xFFA5D3D3),
  //   const Color(0xFFC3C0DF),
  //   const Color(0xFFE3C6A4),
  //   const Color(0xFFF3E4A5),
  //   const Color(0xFFA5E3A5),
  //   const Color(0xFFA4A5E3),
  //   const Color(0xFFE3A5C0),
  //   const Color(0xFFC0E3E3),
  // ];

  // void _setHovering(int index, bool isHovering) {
  //   setState(() {
  //     _isHovering = isHovering;
  //     _index = index;
  //   });
  // }

  // Color getRandomPastelColor() {
  //   final random = Random();
  //   return pastelColors[random.nextInt(pastelColors.length)];
  // }

  // String extractDate(String dateTimeString) {
  //   DateTime dateTime = DateTime.parse(dateTimeString);
  //   // Construct the date string
  //   String date =
  //       "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  //   return date;
  // }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 113, 190, 201),
      body: Row(
        children: [
          Expanded(
              flex: 165,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: scaleHeight(context, 50),
                    horizontal: scaleWidth(context, 19)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: scaleWidth(context, 12)),
                        SvgPicture.asset(
                          'assets/icons/defaultEditPortal/add.svg',
                          height: scaleHeight(context, 32),
                          width: scaleWidth(context, 32),
                        ),
                        SizedBox(width: scaleWidth(context, 12)),
                        Text('HackCraft',
                            style: GoogleFonts.getFont(fontFamily1,
                                fontSize: scaleWidth(context, 18),
                                color: Colors.white,
                                height: lineHeight(25, 18),
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(height: scaleHeight(context, 40)),
                    singleRow('assets/icons/defaultEditPortal/add.svg',
                        'User Details', 0, profileProvider),
                    singleRow('assets/icons/defaultEditPortal/add.svg',
                        'Registrations', 1, profileProvider),
                    singleRow('assets/icons/defaultEditPortal/add.svg',
                        'Referral', 2, profileProvider),
                    singleRow('assets/icons/defaultEditPortal/add.svg',
                        'Settings', 3, profileProvider),
                    SizedBox(height: scaleHeight(context, 27)),
                    Container(
                        height: scaleHeight(context, 269),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff71bec9), Color(0xff1c9daf)],
                          ),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                                'assets/images/profile/Dashboard.svg'),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/dashboard');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: scaleWidth(context, 20),
                                    vertical: scaleHeight(context, 12)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: scaleWidth(context, 8),
                                    vertical: scaleHeight(context, 12)),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/defaultEditPortal/add.svg',
                                        height: scaleHeight(context, 24),
                                        width: scaleWidth(context, 24)),
                                    SizedBox(width: scaleWidth(context, 8)),
                                    Text('Dashboard',
                                        style: GoogleFonts.getFont(fontFamily2,
                                            fontSize: scaleWidth(context, 14),
                                            color: black1,
                                            height: lineHeight(19.2, 14),
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: scaleHeight(context, 40)),
                    Padding(
                      padding: EdgeInsets.only(left: scaleWidth(context, 12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/defaultEditPortal/add.svg',
                            color: Colors.black,
                            height: scaleHeight(context, 32),
                            width: scaleWidth(context, 32),
                          ),
                          SizedBox(width: scaleWidth(context, 12)),
                          InkWell(
                            onTap: () async {
                              await GoogleSignIn().disconnect();
                              await FirebaseAuth.instance.signOut();

                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/',
                                (route) => false,
                              );
                            },
                            child: Text('Logout',
                                style: GoogleFonts.getFont(fontFamily1,
                                    fontSize: scaleWidth(context, 14),
                                    color: black1,
                                    height: lineHeight(19.2, 16),
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 835,
              child: Column(
                children: [
                  profileProvider.pages[profileProvider.selectedIndex]
                ],
              ))
        ],
      ),
    );
  }

  Padding singleRow(String iconPath, String label, int index,
      ProfileProvider profileProvider) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 6)),
      child: InkWell(
        onTap: () {
          profileProvider.setSelectedIndex(index);
        },
        child: Container(
          padding: EdgeInsets.all(scaleWidth(context, 4)),
          decoration: profileProvider.selectedIndex == index
              ? const BoxDecoration(
                  color: lightSilver,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(scaleWidth(context, 8)),
                  decoration: profileProvider.selectedIndex == index
                      ? const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xffACACAC))
                      : null,
                  child: SvgPicture.asset(iconPath,
                      height: scaleHeight(context, 24),
                      width: scaleWidth(context, 24))),
              SizedBox(width: scaleWidth(context, 8)),
              Text(label,
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleWidth(context, 14),
                      color: black1,
                      height: lineHeight(19.2, 16),
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
      ),
    );
  }
}
