import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/getAllHackathons/getAllHackathonsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  bool _isHovering = false;
  late int _index;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final hackathonsProvider =
        Provider.of<AllHackathonProvider>(context, listen: false);
    hackathonsProvider.getAllHackathonsList();
  }

  final List<Color> pastelColors = [
    const Color(0xFFD4A5A5),
    const Color(0xFFA5D3D3),
    const Color(0xFFC3C0DF),
    const Color(0xFFE3C6A4),
    const Color(0xFFF3E4A5),
    const Color(0xFFA5E3A5),
    const Color(0xFFA4A5E3),
    const Color(0xFFE3A5C0),
    const Color(0xFFC0E3E3),
  ];

  void _setHovering(int index, bool isHovering) {
    setState(() {
      _isHovering = isHovering;
      _index = index;
    });
  }

  Color getRandomPastelColor() {
    final random = Random();
    return pastelColors[random.nextInt(pastelColors.length)];
  }

  String extractDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    // Construct the date string
    String date =
        "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    return date;
  }

  @override
  Widget build(BuildContext context) {
    final hackathonsProvider = Provider.of<AllHackathonProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                ),
                ElevatedButton(
                    onPressed: () async {
                      // Sign out from Firebase Authentication
                      //  await FirebaseAuth.instance.signOut();

                      // Sign out from Google Sign-In
                       await GoogleSignIn().disconnect();
                      //await GoogleSignIn().signOut();
                      await FirebaseAuth.instance.signOut();
                      
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LoginPage(),
                      //   ),
                      // );
                        Navigator.pushNamedAndRemoveUntil(context,
                                          '/', (route) => false);
                      //  Navigator.pushNamed(context, '/');
                      // FirebaseAuth.instance
                      //     .authStateChanges()
                      //     .listen((User? user) {
                      //   if (user == null) {
                      //     // Navigate to login page only if the user is not authenticated
                      //     Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => LoginPage()),
                      //     );
                      //   }
                      // });
                    },
                    child: const Text("Logout"))
              ],
            ),
            Container(
              width: double.infinity,
              height: scaleHeight(context, 300),
              margin: EdgeInsets.symmetric(
                  horizontal: scaleWidth(context, 60),
                  vertical: scaleHeight(context, 20)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: scaleWidth(context, 20),
                        top: scaleHeight(context, 20)),
                    padding: EdgeInsets.all(scaleWidth(context, 2)),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: scaleWidth(context, 100),
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        'assets/images/home/Onlinegamesaddiction-amico.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  singleColumn('First Name', 'Aman ', context)
                ],
              ),
            ),
            SizedBox(height: scaleHeight(context, 50)),
            Center(
              child: Text('See All Your Hosted Hackathons',
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 45),
                      color: blue,
                      height: lineHeight(25, 45),
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              //height: 1000,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(context, 60),
                    vertical: scaleHeight(context, 25)),
                itemCount:  hackathonsProvider.allHackathons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  mainAxisExtent: 230,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final hackathon = hackathonsProvider.allHackathons[index];
                  Color cardColor = getRandomPastelColor();
                  return Card(
                      color: grey1,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 20, child: Container(color: cardColor)),
                          Expanded(
                            flex: 80,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: scaleWidth(context, 15),
                                  top: scaleHeight(context, 40),
                                  right: scaleWidth(context, 15)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Hackathon Name is there
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(hackathon.name,
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize: scaleHeight(
                                                    context, 30),
                                                color: black1,
                                                height: lineHeight(25, 40),
                                                fontWeight: FontWeight.w700)),
                                        SizedBox(
                                            height: scaleHeight(context, 15)),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: scaleWidth(context, 44)),
                                          child: Text(
                                              hackathon.organisationName,
                                              style: GoogleFonts.getFont(
                                                  fontFamily2,
                                                  fontSize:
                                                      scaleHeight(context, 18),
                                                  color: black1,
                                                  height: lineHeight(22.4, 18),
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: scaleHeight(context, 30)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //Start Date is there
                                        Text('Start Date :',
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height:
                                                    lineHeight(22.4, 18),
                                                fontWeight:
                                                    FontWeight.w300)),
                                        Text(extractDate(
                                                    hackathon.startDate),
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),

                                    const SizedBox(height: 35),
                                    MouseRegion(
                                      onEnter: (event) =>
                                          _setHovering(index, true),
                                      onExit: (event) =>
                                          _setHovering(index, false),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Center(
                                          child: Container(
                                            width: double.infinity,
                                            height: scaleHeight(context, 50),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25)),
                                              color: _isHovering &&
                                                      (index == _index)
                                                  ? darkBlue
                                                  : Colors.white,
                                              border:
                                                  Border.all(color: darkBlue),
                                            ),
                                            child: Text(
                                                'Check Your Registrations',
                                                style: GoogleFonts.getFont(
                                                    fontFamily2,
                                                    fontSize: scaleHeight(
                                                        context, 20),
                                                    color: _isHovering &&
                                                            (index == _index)
                                                        ? Colors.white
                                                        : darkBlue,
                                                    height:
                                                        lineHeight(22.4, 20),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Column singleColumn(String text1, String text2, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: scaleWidth(context, 20), top: scaleHeight(context, 20)),
          child: Text(text1,
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 24),
                  color: Colors.black,
                  height: lineHeight(22.4, 24),
                  fontWeight: FontWeight.w400)),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: scaleWidth(context, 20), top: scaleHeight(context, 20)),
          child: Text(text2,
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 24),
                  color: Colors.black,
                  height: lineHeight(22.4, 24),
                  fontWeight: FontWeight.w400)),
        )
      ],
    );
  }
}
