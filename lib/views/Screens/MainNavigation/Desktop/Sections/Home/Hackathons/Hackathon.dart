import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/getAllHackathons/getAllHackathonsProvider.dart';
import 'package:major_project__widget_testing/state/getHackathon/getSingleHackathonProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/default_template.dart';
import 'package:provider/provider.dart';

class HomeHackathon extends StatefulWidget {
  const HomeHackathon({super.key});

  @override
  State<HomeHackathon> createState() => _HomeHackathonState();
}

class _HomeHackathonState extends State<HomeHackathon> {
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

  @override
  Widget build(BuildContext context) {
    final hackathonsProvider = Provider.of<AllHackathonProvider>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text('See New Opportunities Lined Up For You',
          maxLines: 2,
          style: GoogleFonts.getFont(fontFamily2,
              fontSize: scaleHeight(context, 45),
              color: blue,
              height: lineHeight(25, 45),
              fontWeight: FontWeight.w500)),
      SizedBox(
        height: 3000,
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(context, 60),
                vertical: scaleHeight(context, 25)),
            itemCount: hackathonsProvider.allHackathons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisExtent: 230,
                mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              final hackathon = hackathonsProvider.allHackathons[index];
              Color? cardColor = getRandomPastelColor();
              return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: grey1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 20,
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFFC3C0DF),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))))),
                      Expanded(
                        flex: 80,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: scaleWidth(context, 15),
                              top: scaleHeight(context, 20),
                              right: scaleWidth(context, 15)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Hackathon Name is there
                                Text(hackathon['name'],
                                    style: GoogleFonts.getFont(fontFamily2,
                                        fontSize: scaleHeight(context, 30),
                                        color: black1,
                                        height: lineHeight(22.4, 30),
                                        fontWeight: FontWeight.w700)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Organization Name is there
                                    Text(hackathon['organisation_name'],
                                        style: GoogleFonts.getFont(fontFamily2,
                                            fontSize: scaleHeight(context, 18),
                                            color: black1,
                                            height: lineHeight(22.4, 18),
                                            fontWeight: FontWeight.w500)),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //Start Date is there
                                        Text('Start Date :',
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w300)),
                                        Text('Start Date ${index + 1}',
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                //Participation Fee is there
                                Text(hackathon['price'].toString(),
                                    style: GoogleFonts.getFont(fontFamily2,
                                        fontSize: scaleHeight(context, 32),
                                        color: mustard,
                                        height: lineHeight(25, 32),
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Team Size :',
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w300)),
                                        Text(hackathon['team_size'].toString(),
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Mode of Conduct :',
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w300)),
                                        Text(hackathon['mode_of_conduct'],
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Venue :',
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w300)),
                                        Text(hackathon['venue'],
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 18),
                                                color: black1,
                                                height: lineHeight(22.4, 18),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                                MouseRegion(
                                  onEnter: (event) => _setHovering(index, true),
                                  onExit: (event) => _setHovering(index, false),
                                  child: InkWell(
                                    onTap: () async{
                                      final singleHackathonProvider =
                                          Provider.of<SingleHackathonProvider>(
                                              context,
                                              listen: false);
                                      print('_id: ${hackathon['_id']}');

                                      singleHackathonProvider.setIsLoading =
                                          true;

                                      await singleHackathonProvider
                                          .getSingleHackathonsList(
                                              hackathon['_id']);
                                              print('Hi');

                                              print(singleHackathonProvider.singleHackathon.hackathons.startDateTime);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DefaultTemplate(
                                                  defaultTemplateModel:
                                                      singleHackathonProvider
                                                          .singleHackathon,
                                                )),
                                      );
                                      
                                      // Navigator.pushNamed(
                                      // context, '/singleHackathon');
                                    },
                                    child: Center(
                                      child: Container(
                                        width: double.infinity,
                                        height: scaleHeight(context, 50),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25)),
                                          color:
                                              _isHovering && (index == _index)
                                                  ? darkBlue
                                                  : Colors.white,
                                          border: Border.all(color: darkBlue),
                                        ),
                                        child: Text('See more details',
                                            style: GoogleFonts.getFont(
                                                fontFamily2,
                                                fontSize:
                                                    scaleHeight(context, 20),
                                                color: _isHovering &&
                                                        (index == _index)
                                                    ? Colors.white
                                                    : darkBlue,
                                                height: lineHeight(22.4, 20),
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ));
            }),
      )
    ]);
  }
}
