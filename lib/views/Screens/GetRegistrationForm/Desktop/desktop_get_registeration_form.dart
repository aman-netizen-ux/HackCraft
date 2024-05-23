import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/hollowCircle.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/short_ans.dart';
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
  String hackathonName = "";
  List<int> teamSize=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      //got some required details in form of args 
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null && args.containsKey('hackathonId')) {
        print(
            "args were not null and args['hackathonId']: ${args['hackathonId']} ${args['userType']}  ${args['hackathonName']}");
        setState(() {
          hackathonId = args['hackathonId'];
          userType = args['userType'];
          hackathonName = args['hackathonName'];
          teamSize= args['teamSize'];
        });
      }
    }).then((value) async {
      final getRegistrationFormProvider =
          Provider.of<GetRegistrationFormProvider>(context, listen: false);
       final loginProvider = Provider.of<LoginProvider>(context, listen: false);

      int someInt = 2; //TODO: change with member index
    
    //SelectedParticipantTab initial value is set based on usertype
      getRegistrationFormProvider
          .setSelectedParticipantTab(userType == "firstuser"
              ? 0
              : userType == "pending"
                  ? someInt
                  : -1);
        print("sected participant tab ${getRegistrationFormProvider.selectedParticipantTab}");
      getRegistrationFormProvider.setSectionsCount(getRegistrationFormProvider.selectedParticipantTab == 0 ? 2 : 1);
       getRegistrationFormProvider.refreshTabs();
      // api call to get the form
      await getRegistrationFormProvider.getHackathonForm(hackathonId);
      // print("section: ${getRegistrationFormProvider.singleForm.sections[0].sectionName}");
      getRegistrationFormProvider.setSectionsCount(
        getRegistrationFormProvider.singleForm.sections.length+
        getRegistrationFormProvider.sectionsCount
      );
      getRegistrationFormProvider.refreshTabs();//tabs are refreshed to update tab controller with no. of sections


      //team details variable is already there in api
      // just set that based on the user type and team size with prefilled values 
  //     if(userType == "firstuser"){
  //       getRegistrationFormProvider.updateTeam("", teamSize.length>1? 0: teamSize[0]);

  //       if(teamSize.length>1){
  //         getRegistrationFormProvider.addMember(loginProvider.emailId, true);
  //       }else{

  //         for(int i=0; i< teamSize[0]; i++){

  //            getRegistrationFormProvider.addMember(i==0?loginProvider.emailId: "Member $i", i==0?true:false);
  //         }
  //       }


        
  //     }else if(userType=="pending"){
  //       //TODO: hit the team get api 
  //       //TODO: and change the value of key same as current email
           //TODO: for pending user also create memberdatamodel type object and set only email in there
  //     }

  //     getRegistrationFormProvider.getPrefilledData(
  //       loginProvider.emailId, 
  //       userType=="firstuser"? 0:someInt, 
  //       );

  //       String jsonOutput = jsonEncode(getRegistrationFormProvider.teamData.toJson());
  // print(jsonOutput); // Yeh JSON string ko print karega

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
                      getRegistrationFormProvider.sectionsCount, (index) {
                    return InkWell(
                        onTap: () {
                          getRegistrationFormProvider.getformcontroller
                              .animateTo(index);
                        },
                        child: Tab(
                            child: Text(
                                index == 0
                                    ? "General"
                                    : index ==
                                                getRegistrationFormProvider
                                                        .singleForm
                                                        .sections
                                                        .length +
                                                    1 &&
                                            getRegistrationFormProvider
                                                    .selectedParticipantTab ==
                                                0
                                        ? "Team Details"
                                        : getRegistrationFormProvider.singleForm
                                            .sections[index - 1].sectionName,
                                style: GoogleFonts.getFont(
                                  fontFamily2,
                                  fontSize: scaleWidth(context, 18),
                                  color: black1,
                                  fontWeight: FontWeight.w500,
                                ))));
                  }))),

          Expanded(
              child: TabBarView(
            controller: getRegistrationFormProvider.getformcontroller,
            children: List.generate(
               getRegistrationFormProvider.sectionsCount, (index) {
              final int sectionIndex =
                  getRegistrationFormProvider.getformcontroller.index;
              final List<dynamic> allFieldsList =
                  getRegistrationFormProvider.singleForm.fields;
              return Container(
                  // color: Colors.blue[100 * (index + 1)],
                  padding: EdgeInsets.only(
                      left: scaleWidth(context, 159),
                      right: scaleWidth(context, 5)),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(right: scaleWidth(context, 108)),
                    child: Column(children: [
                      SizedBox(
                        height: scaleHeight(context, 36.76),
                      ),
                      ...List.generate(
                          sectionIndex == 0
                              ? getRegistrationFormProvider
                                  .gereralSectionFieldsList.length
                              : sectionIndex ==
                                          getRegistrationFormProvider
                                                  .singleForm.sections.length +
                                              1 &&
                                      getRegistrationFormProvider
                                              .selectedParticipantTab ==
                                          0
                                  ? getRegistrationFormProvider
                                      .teamDetailsSectionFieldsList.length
                                  : getRegistrationFormProvider
                                      .singleForm
                                      .sections[sectionIndex - 1]
                                      .numberOfQuestions, (index) {
                        if (sectionIndex == 0) {
                          // return Container(height: 50, width: double.infinity, color:Colors.orange, margin: EdgeInsets.all(8),);
                          return Row(
                            children: [
                              getRegistrationFormProvider.getField(
                                  getRegistrationFormProvider
                                      .gereralSectionFieldsList[index].type,
                                  getRegistrationFormProvider
                                      .gereralSectionFieldsList[index])
                            ],
                          );
                        } else if (sectionIndex ==
                                getRegistrationFormProvider
                                        .singleForm.sections.length +
                                    1 &&
                            getRegistrationFormProvider
                                    .selectedParticipantTab ==
                                0) {
                          return Row(
                            children: [
                              getRegistrationFormProvider.getField(
                                  getRegistrationFormProvider
                                      .teamDetailsSectionFieldsList[index].type,
                                  getRegistrationFormProvider
                                      .teamDetailsSectionFieldsList[index])
                            ],
                          );
                        } else {
                          int sumOfFieldsTillPrevSection = sectionIndex - 1 == 0
                              ? 0
                              : getRegistrationFormProvider.singleForm.sections
                                  .sublist(0, sectionIndex - 1)
                                  .fold(
                                      0,
                                      (prev, elem) =>
                                          prev + elem.numberOfQuestions);

                                          print("sumOfFieldsTillPrevSection :$sumOfFieldsTillPrevSection");

                          int currentFieldIndex =sumOfFieldsTillPrevSection+index;
                          return Row(
                            children: [
                              
                              getRegistrationFormProvider.getField(
                                  allFieldsList[currentFieldIndex].type,
                                  allFieldsList[currentFieldIndex])
                            ],
                          );
                        }
                      })
                    ]),
                  ));
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
                  padding: EdgeInsets.only(left: scaleWidth(context, 12.85)),
                  decoration: BoxDecoration(
                      color:
                          getRegistrationFormProvider.getformcontroller.index ==
                                  0
                              ? null
                              : const Color(0xFFD9D9D9),
                      border:
                          getRegistrationFormProvider.getformcontroller.index ==
                                  0
                              ? Border.all(color: const Color(0xFFD9D9D9))
                              : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back,
                          size: 16,
                          color: getRegistrationFormProvider
                                      .getformcontroller.index ==
                                  0
                              ? const Color(0xFFD9D9D9)
                              : const Color(0xFF3C3C3C)),
                      SizedBox(width: scaleWidth(context, 16)),
                      Text('Previous',
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontSize: scaleWidth(context, 16),
                            color: getRegistrationFormProvider
                                        .getformcontroller.index ==
                                    0
                                ? const Color(0xFFD9D9D9)
                                : const Color(0xFF3C3C3C),
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
                  padding: EdgeInsets.only(right: scaleWidth(context, 12.85)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          getRegistrationFormProvider.getformcontroller.index ==
                                  getRegistrationFormProvider
                                          .singleForm.sections.length +
                                      1
                              ? "Submit"
                              : 'Next',
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontSize: scaleWidth(context, 16),
                            color: const Color(0xFF3C3C3C),
                            fontWeight: FontWeight.w400,
                          )),
                      SizedBox(width: scaleWidth(context, 16)),
                      const Icon(Icons.arrow_forward, color: black1, size: 16),
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
     final getRegistrationFormProvider =
        Provider.of<GetRegistrationFormProvider>(
      context,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(getRegistrationFormProvider.teamData.members.length, (index) {
            return Padding(
              // color: Colors.pink.shade100,
              padding: EdgeInsets.only(
                  top: scaleHeight(context, index == 0 ? 0 : 25),
                  bottom: scaleHeight(context, index == 9 ? 0 : 25)),
              child: InkWell(
                onTap: (){
                  getRegistrationFormProvider.setSelectedParticipantTab(index);
                },
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
                               getRegistrationFormProvider.isMemberDataComplete(index) ?const Color(0xFF44D152) :const Color(0xFFFFFBFB),
                            shape: BoxShape.circle,
                            border: getRegistrationFormProvider.selectedParticipantTab==index
                                ? Border.all(color:const Color.fromARGB(255, 44, 116, 51), width: 5)
                                : null,
                            boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(4, 0),
                                        blurRadius: 15,
                                        spreadRadius: 0,
                                        color: Colors.black.withOpacity(0.25))
                                  ]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
