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
                padding:
                    EdgeInsets.symmetric(vertical: scaleHeight(context, 82)),
                child: Row(
                  children: [
                    Expanded(
                        flex: 930,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 214, child: Container()),
                                Expanded(
                                    flex: 786,
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          left: scaleHeight(context, 30)),
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFF9F9F9),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: scaleHeight(context, 68),

                                          ),
                                          //TODo: tab bar view

                                          SizedBox(
                                            height: scaleHeight(context, 36.76),
                                            
                                          ),
                                         Expanded(
                                          child: Container(color: Colors.blue.shade100)
                                         ),
                                           SizedBox(
                                            height: scaleHeight(context,44),
                                            
                                          ),
                                          Row(
                                            children: [Container(color: Colors.blue.shade100, height: 50, width: 400)],
                                          ),

                                           SizedBox(
                                            height: scaleHeight(context,49),
                                            
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: scaleHeight(context, 90),
                                      bottom: scaleWidth(context, 49)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 254,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ...List.generate(10, (index) {
                                                  return Padding(
                                                    // color: Colors.pink.shade100,
                                                    padding: EdgeInsets.only(
                                                        top: scaleHeight(
                                                            context,
                                                            index == 0
                                                                ? 0
                                                                : 25),
                                                        bottom: scaleHeight(
                                                            context,
                                                            index == 9
                                                                ? 0
                                                                : 25)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                            width: scaleWidth(
                                                                context, 59)),
                                                        Text(
                                                            index == 0
                                                                ? "Team Leader Details"
                                                                : "Participant ${index + 1} Details",
                                                            style: GoogleFonts.getFont(
                                                                fontFamily2,
                                                                fontSize:
                                                                    scaleWidth(
                                                                        context, 14),
                                                                color: black1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height:
                                                                    lineHeight(
                                                                        22.4,
                                                                        18))),
                                                        const Spacer(),
                                                        Container(
                                                          height: scaleHeight(
                                                              context, 60),
                                                          width: scaleHeight(
                                                              context, 60),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: index >
                                                                          6
                                                                      ? Colors
                                                                          .red
                                                                      : index >
                                                                              3
                                                                          ? Colors
                                                                              .yellow
                                                                          : Colors
                                                                              .green,
                                                                  shape: BoxShape
                                                                      .circle),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                })
                                              ],
                                            ),
                                          )),
                                      Expanded(flex: 766, child: Container())
                                    ],
                                  ),
                                ))
                          ],
                        )),
                    Expanded(flex: 070, child: Container())
                  ],
                )))
      ],
    );
  }
}
