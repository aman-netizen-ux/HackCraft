import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/hollowCircle.dart';

class DesktopGetRegisterationForm extends StatefulWidget {
  const DesktopGetRegisterationForm({super.key});

  @override
  State<DesktopGetRegisterationForm> createState() =>
      _DesktopGetRegisterationFormState();
}

class _DesktopGetRegisterationFormState
    extends State<DesktopGetRegisterationForm> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 256,
              child: Container(
                  width: double.infinity,
                  height: scaleHeight(context, 820),
                  decoration: const BoxDecoration(
                      color: dblue,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(35))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: scaleHeight(context, 34),
                        right: scaleWidth(context, 98),
                        left: scaleWidth(context, 36)),
                    child: Column(children: [
                      SizedBox(
                        height: scaleHeight(context, 48),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back),
                            SizedBox(
                              width: scaleWidth(context, 10.67),
                            ),
                            Text('Hackathon Name',
                                style: GoogleFonts.getFont(
                                  fontFamily2,
                                  fontSize: scaleWidth(context, 20),
                                  color: black1,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(
                            top: scaleHeight(context, 90),
                            bottom: scaleWidth(context, 49)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(5, (index) {
                                return Container(
                                  height: scaleHeight(context, 60),
                                  // color: Colors.orange.shade100,
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  child: Text(
                                      index == 0
                                          ? "Team Leader Details"
                                          : "Participant ${index + 1} Details",
                                      style: GoogleFonts.getFont(fontFamily2,
                                          fontSize: scaleWidth(context, 14),
                                          color: black1,
                                          fontWeight: FontWeight.w400,
                                          height: lineHeight(22.4, 18))),
                                );
                              })
                            ]),
                      )),
                      SizedBox(height: scaleHeight(context, 82))
                    ]),
                  )),
            ),
            Expanded(
              flex: 744,
              child: Container(
                  height: scaleHeight(context, 820),
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: const Color(0xFFEDECF2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      HollowCircle(
                        diameter: scaleHeight(context, 820),
                        side: 'left',
                        width: scaleWidth(context, 100),
                        color: dblue,
                        isSemicircle: true,
                      ),
                    ],
                  )),
            )
          ],
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 82)),
              child: Row(
                children: [
                  Expanded(flex: 200, child: Container()),
                  Expanded(
                    flex: 730,
                    child: Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            margin:
                                EdgeInsets.only(left: scaleHeight(context, 30)),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF9F9F9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: scaleHeight(context, 90),
                                bottom: scaleWidth(context, 49)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ...List.generate(5, (index) {
                                    return Container(
                                      height: scaleHeight(context, 60),
                                      width: scaleHeight(context, 60),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle),
                                    );
                                  })
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(flex: 070, child: Container()),
                ],
              )),
        )
      ],
    );
  }
}
