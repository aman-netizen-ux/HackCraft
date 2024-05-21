import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/hollowCircle.dart';
import 'package:provider/provider.dart';

class DesktopGetRegisterationForm extends StatefulWidget {
  const DesktopGetRegisterationForm({super.key});

  @override
  State<DesktopGetRegisterationForm> createState() =>
      _DesktopGetRegisterationFormState();
}

class _DesktopGetRegisterationFormState
    extends State<DesktopGetRegisterationForm> {
  String userType = "";
  String hackathonId = "";
  String hackathonName="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("got into init");


  

    Future.delayed(Duration.zero, () {
      print("im in future");
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null && args.containsKey('hackathonId')) {
        print(
            "args were not null and args['hackathonId']: ${args['hackathonId']} ");
        setState(() {
          hackathonId = args['hackathonId'];
          userType= args['userType'];
          hackathonName= args['hackathonName'];
          
        });
      }
    }).then((value) async {
      final getRegistrationFormProvider =
          Provider.of<GetRegistrationFormProvider>(context, listen: false);
      print("im in then");
      await getRegistrationFormProvider.getHackathonForm(hackathonId);
      getRegistrationFormProvider.refreshTabs();
      //TODO: also hit the prefilled data api
    });
  }

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
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back)),
                            SizedBox(
                              width: scaleWidth(context, 10.67),
                            ),
                            Text(hackathonName,
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
                                const Expanded(
                                    flex: 786, child: MiddleFormPart())
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
                                      const Expanded(
                                          flex: 254,
                                          child: ParticipantsListSide()),
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

class MiddleFormPart extends StatelessWidget {
  const MiddleFormPart({super.key});

  @override
  Widget build(BuildContext context) {
    final getRegistrationFormProvider =
        Provider.of<GetRegistrationFormProvider>(
      context,
    );
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: scaleHeight(context, 30)),
      decoration: const BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          SizedBox(
            height: scaleHeight(context, 68),
          ),
          //TODo: tab bar view

          SizedBox(
              height: scaleHeight(context, 37),
              child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: black1,
                  controller: getRegistrationFormProvider.getformcontroller,
                  tabs: List.generate(
                      getRegistrationFormProvider.singleForm.sections.length+2, (index) {
                    return InkWell(
                        onTap: () {
                          getRegistrationFormProvider.getformcontroller
                              .animateTo(index);
                        },
                        child: Tab(
                            child: Text(
                              index==0? "General":index==getRegistrationFormProvider.singleForm.sections.length+1?"Team Details":
                              getRegistrationFormProvider.singleForm.sections[index-1].sectionName,
                                style: GoogleFonts.getFont(
                                  fontFamily2,
                                  fontSize: scaleWidth(context, 18),
                                  color: black1,
                                  fontWeight: FontWeight.w500,
                                ))));
                  }))),

          SizedBox(
            height: scaleHeight(context, 36.76),
          ),
          Expanded(
              child: TabBarView(
            controller: getRegistrationFormProvider.getformcontroller,
            children: List.generate(getRegistrationFormProvider.singleForm.sections.length+2,
                (index) {
              return Container(color: Colors.blue[100 * (index + 1)]);
            }),
          )),
          SizedBox(
            height: scaleHeight(context, 44),
          ),
          Row(
            children: [
              SizedBox(
                width: scaleWidth(context, 57),
              ),
              SizedBox(
                width: scaleWidth(context, 270),
                child: LinearProgressIndicator(
                  value: 5,
                  backgroundColor: Colors.pink[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  minHeight: 10,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  height: scaleHeight(context, 40),
                  width: scaleWidth(context, 120.85),
                  alignment: Alignment.center,
                   padding: EdgeInsets.only(left: scaleWidth(context,12.85)),
                  decoration: BoxDecoration(
                      color: getRegistrationFormProvider.getformcontroller.index==0? null: const Color(0xFFD9D9D9),
                      border: getRegistrationFormProvider.getformcontroller.index==0? Border.all(color: const Color(0xFFD9D9D9)): null,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                       Icon(Icons.arrow_back, 
                       size: 16,
                      color:  getRegistrationFormProvider.getformcontroller.index==0?const Color(0xFFD9D9D9):const Color(0xFF3C3C3C)),
                      SizedBox(width: scaleWidth(context, 16)),
                      Text('Previous',
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontSize: scaleWidth(context, 16),
                            color: getRegistrationFormProvider.getformcontroller.index==0?const Color(0xFFD9D9D9):const Color(0xFF3C3C3C),
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: scaleWidth(context, 12.15),
              ),
              InkWell(
                onTap: () {
                  getRegistrationFormProvider.getHackathonForm("");
                },
                child: Container(
                  height: scaleHeight(context, 40),
                  width: scaleWidth(context, 120.85),
                  margin: EdgeInsets.only(right: scaleWidth(context, 53.15)),
                  padding: EdgeInsets.only(right: scaleWidth(context,12.85)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(getRegistrationFormProvider.getformcontroller.index==getRegistrationFormProvider.singleForm.sections.length+1
                      ?"Submit":  'Next',
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontSize: scaleWidth(context, 16),
                            color: const Color(0xFF3C3C3C),
                            fontWeight: FontWeight.w400,
                          )),
                           SizedBox(width: scaleWidth(context, 16)),
                      const Icon(Icons.arrow_forward, color: black1, size:16),
                    ],
                  ),
                ),
              )
            ],
          ),

          SizedBox(
            height: scaleHeight(context, 49),
          )
        ],
      ),
    );
  }
}

class ParticipantsListSide extends StatelessWidget {
  const ParticipantsListSide({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(10, (index) {
            return Padding(
              // color: Colors.pink.shade100,
              padding: EdgeInsets.only(
                  top: scaleHeight(context, index == 0 ? 0 : 25),
                  bottom: scaleHeight(context, index == 9 ? 0 : 25)),
              child: Row(
                children: [
                  SizedBox(width: scaleWidth(context, 59)),
                  Text(
                      index == 0
                          ? "Team Leader Details"
                          : "Participant ${index + 1} Details",
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleWidth(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 18))),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: scaleHeight(context, 60),
                      width: scaleHeight(context, 60),
                      decoration: BoxDecoration(
                          color:
                              index < 2 ? Color(0xFF44D152) : Color(0xFFFFFBFB),
                          shape: BoxShape.circle,
                          border: index == 3
                              ? Border.all(color: Color(0xFF44D152))
                              : null,
                          boxShadow: index < 2
                              ? null
                              : [
                                  BoxShadow(
                                      offset: Offset(4, 0),
                                      blurRadius: 15,
                                      spreadRadius: 0,
                                      color: Colors.black.withOpacity(0.25))
                                ]),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
