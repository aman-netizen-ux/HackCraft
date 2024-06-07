import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/Registration/registration_form_model.dart';
import 'package:major_project__widget_testing/models/teamRegisterationModel.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/dialog_alert.dart';
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
  bool isloading = true;
  String userType = "";
  String hackathonId = "";
  String hackathonName = "";
  String teamId = "";
  List<int> teamSize = [];
  @override
  void initState() {
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
          teamSize = args['teamSize'];
          teamId = args['teamId'];
        });
      }
    }).then((value) async {
      final getRegistrationFormProvider =
          Provider.of<GetRegistrationFormProvider>(context, listen: false);
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);

      //TODO: change with member index: and keep this saved in provider,
      // and update few things in below code based on this(like disable enable and all, etc.)
      // inde value pasing while calling prefilled api

      if (userType == "pendin") {
        await getRegistrationFormProvider.getTeamDetails(teamId);
        debugPrint("teacm details fetched in desktop");
      }

      getRegistrationFormProvider.setInitiallMemberIndex(userType == "firstuser"
          ? 0
          : userType == "pendin"
              ? getRegistrationFormProvider
                  .findMemberIndex(loginProvider.emailId)
              : -1);

      //SelectedParticipantTab initial value is set same as initialmemberIndex
      getRegistrationFormProvider.setSelectedParticipantTab(
          getRegistrationFormProvider.initialmemberIndex);

      //tabs need to be initialized before api call as well
      getRegistrationFormProvider.setSectionsCount(
          getRegistrationFormProvider.selectedParticipantTab == 0 ? 2 : 1);
      getRegistrationFormProvider.refreshTabs();

      // api call to get the form
      await getRegistrationFormProvider.getHackathonForm(hackathonId);
      getRegistrationFormProvider.setSectionsCount(
          getRegistrationFormProvider.singleForm.sections.length +
              getRegistrationFormProvider.sectionsCount);
      getRegistrationFormProvider
          .refreshTabs(); //tabs are refreshed to update tab controller with no. of sections

      //team details variable is already there in api
      // just set that based on the user type and team size with prefilled values
      if (userType == "firstuser") {
        getRegistrationFormProvider.updateTeam(
            "", teamSize.length > 1 ? 0 : teamSize[0]);

        if (teamSize.length > 1) {
          getRegistrationFormProvider.addMember(loginProvider.emailId, true);
          getRegistrationFormProvider.addModelInTeamDetailsList(StepperModel(
              id: "",
              serialNumber: 1,
              label: "Team Member (Including leader)",
              errorText: "This field is required",
              required: true,
              type: FieldTypes.stepper,
              max_value: teamSize[1],
              min_value: teamSize[0]));
        } else {
          for (int i = 0; i < teamSize[0]; i++) {
            getRegistrationFormProvider.addMember(
                i == 0 ? loginProvider.emailId : "Member $i",
                i == 0 ? true : false);

            if (i > 0) {
              getRegistrationFormProvider.addTeamFields(i);
            }
          }
        }
      }
      if (userType == "pendin") {
        getRegistrationFormProvider.initializeMemberDataListToMembers();
      }

      await getRegistrationFormProvider.getPrefilledData(
        loginProvider.emailId,
        getRegistrationFormProvider.initialmemberIndex,
      );

      print("set");

      // String jsonOutput = jsonEncode(getRegistrationFormProvider.teamData.team.toJson());
      // print("jsonOutput $jsonOutput ..................................\n ${jsonEncode(getRegistrationFormProvider.teamData.members[0].toJson())}");
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Center(child: CircularProgressIndicator())
        : Stack(
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
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(35))),
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
                        alignment: Alignment.center,
                        color: const Color(0xFFEDECF2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                widthFactor: 0.5,
                                child: Container(
                                  height: scaleHeight(context, 820),
                                  width: scaleHeight(context, 820),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: indicatorblue),
                                  child: Container(
                                    height: scaleHeight(context, 820),
                                    width: scaleHeight(context, 820),
                                    margin: EdgeInsets.all(
                                        scaleHeight(context, 120)),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFEDECF2)),
                                  ),
                                ),
                              ),
                            )
                            // HollowCircle(
                            //   diameter: scaleHeight(context, 820),
                            //   side: 'left',
                            //   width: scaleWidth(context, 100),
                            //   color: dblue,
                            //   isSemicircle: true,
                            // ),
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
                      padding: EdgeInsets.symmetric(
                          vertical: scaleHeight(context, 82)),
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
                                          child: isloading
                                              ? Container(
                                                  width: double.infinity,
                                                  margin: EdgeInsets.only(
                                                      left: scaleHeight(
                                                          context, 30)),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xFFF9F9F9),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                )
                                              : MiddleFormPart(
                                                  hackathonId: hackathonId,
                                                  teamId: teamId,
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
                                                child: isloading
                                                    ? Container()
                                                    : const ParticipantsListSide()),
                                            Expanded(
                                                flex: 766, child: Container())
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
  const MiddleFormPart(
      {super.key, required this.hackathonId, required this.teamId});

  final String hackathonId;
  final String teamId;

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
                  tabs: List.generate(getRegistrationFormProvider.sectionsCount,
                      (index) {
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
            children: List.generate(getRegistrationFormProvider.sectionsCount,
                (index) {
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
                      ...List
                          .generate(
                              sectionIndex ==
                                          getRegistrationFormProvider
                                                  .singleForm.sections.length +
                                              1 &&
                                      getRegistrationFormProvider
                                              .selectedParticipantTab ==
                                          0
                                  ? getRegistrationFormProvider
                                      .teamDetailsSectionFieldsList.length
                                  : 0, (index) {
                        TeamModel teamData =
                            getRegistrationFormProvider.teamData.team;
                        return Row(
                          children: [
                            getRegistrationFormProvider.getField(
                                type: getRegistrationFormProvider
                                    .teamDetailsSectionFieldsList[index].type,
                                field: getRegistrationFormProvider
                                    .teamDetailsSectionFieldsList[index],
                                initialAnswer: index == 0
                                    ? teamData.teamName
                                    : index == 1
                                        ? teamData.teamSize.toString()
                                        : "",
                                isDisabled: getRegistrationFormProvider
                                                .initialmemberIndex ==
                                            0 &&
                                        getRegistrationFormProvider
                                                .selectedParticipantTab ==
                                            0
                                    ? false
                                    : true,
                                isRequiredData:
                                    index == 0 || index == 1 ? "TeamData" : "",
                                requiredType: index == 0
                                    ? "teamname"
                                    : index == 1
                                        ? "teamsize"
                                        : "")
                          ],
                        );
                      }),
                      ...List.generate(
                          //getting list of fields based on selected setion => general list, team data list, sections questions list(api)
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
                                      .teamEmailList.length
                                  : getRegistrationFormProvider
                                      .singleForm
                                      .sections[sectionIndex - 1]
                                      .numberOfQuestions, (index) {
                        if (sectionIndex == 0) {
                          //General Section case

                          RequiredDataModel requiredData =
                              getRegistrationFormProvider
                                  .teamData
                                  .members[getRegistrationFormProvider
                                      .selectedParticipantTab]
                                  .details
                                  .values
                                  .toList()[0][0]
                                  .requiredData;

                          return Row(
                            children: [
                              getRegistrationFormProvider.getField(
                                  type: getRegistrationFormProvider
                                      .gereralSectionFieldsList[index].type,
                                  field: getRegistrationFormProvider
                                      .gereralSectionFieldsList[index],
                                  initialAnswer: index == 0
                                      ? requiredData.participantName
                                      : index == 1
                                          ? requiredData.participantEmail
                                          : index == 2
                                              ? requiredData.participantCollege
                                              : index == 3
                                                  ? requiredData
                                                      .participantGender
                                                  : requiredData
                                                      .participantPhone,
                                  isDisabled: index == 4 &&
                                          getRegistrationFormProvider
                                                  .selectedParticipantTab ==
                                              getRegistrationFormProvider
                                                  .initialmemberIndex
                                      ? false
                                      : true,
                                  isRequiredData: "GeneralData",
                                  requiredType: "phone")
                            ],
                          );
                        } else if (sectionIndex ==
                                getRegistrationFormProvider
                                        .singleForm.sections.length +
                                    1 &&
                            getRegistrationFormProvider
                                    .selectedParticipantTab ==
                                0) {
                          TeamModel teamData =
                              getRegistrationFormProvider.teamData.team;
                          return Row(
                            children: [
                              getRegistrationFormProvider.getField(
                                  type: getRegistrationFormProvider
                                      .teamEmailList[index].type,
                                  field: getRegistrationFormProvider
                                      .teamEmailList[index],
                                  initialAnswer: getRegistrationFormProvider
                                      .teamData.members[index + 1].details.keys
                                      .toList()[0],
                                  isDisabled: false,
                                  isRequiredData: "MemberEmails",
                                  requiredType: "${index + 1}")
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

                          print(
                              "sumOfFieldsTillPrevSection :$sumOfFieldsTillPrevSection");

                          int currentFieldIndex =
                              sumOfFieldsTillPrevSection + index;

                          dynamic additionalData = getRegistrationFormProvider
                              .teamData
                              .members[getRegistrationFormProvider
                                  .selectedParticipantTab]
                              .details
                              .values
                              .toList()[0][0]
                              .additionalData[currentFieldIndex];
                          print(
                              "((((((((((((((((((((((((((((   ${getRegistrationFormProvider.selectedParticipantTab == getRegistrationFormProvider.initialmemberIndex}   ))))))))))))))))))))))))))))");

                          return Row(
                            children: [
                              getRegistrationFormProvider.getField(
                                type: allFieldsList[currentFieldIndex].type,
                                field: allFieldsList[currentFieldIndex],
                                initialAnswer: additionalData
                                            is StringAnswerModel ||
                                        additionalData is OneIntAnswerModel ||
                                        additionalData is BoolAnswerModel
                                    ? additionalData.input
                                    : additionalData is MapAnswerModel ||
                                            additionalData is MapIntAnswerModel
                                        ? additionalData.input.values
                                                .toList()
                                                .isNotEmpty
                                            ? additionalData.input.values
                                                .join(',')
                                            : ""
                                        : additionalData is TwoIntAnswerModel
                                            ? additionalData
                                                        .input1.isNotEmpty &&
                                                    additionalData
                                                        .input2.isNotEmpty
                                                ? "${additionalData.input1},${additionalData.input2}"
                                                : ""
                                            : "hola",
                                isDisabled: getRegistrationFormProvider
                                        .selectedParticipantTab !=
                                    getRegistrationFormProvider
                                        .initialmemberIndex,
                                serialNumber: currentFieldIndex,
                                modelType: additionalData is StringAnswerModel
                                    ? "StringAnswerModel"
                                    : additionalData is MapAnswerModel
                                        ? "MapAnswerModel"
                                        : additionalData is OneIntAnswerModel
                                            ? "OneIntAnswerModel"
                                            : additionalData
                                                    is TwoIntAnswerModel
                                                ? "TwoIntAnswerModel"
                                                : additionalData
                                                        is BoolAnswerModel
                                                    ? "BoolAnswerModel"
                                                    : additionalData
                                                            is MapIntAnswerModel
                                                        ? "MapIntAnswerModel"
                                                        : "hola",
                              )
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
                onTap: _isPreviousDisabled(getRegistrationFormProvider)
                    ? null
                    : () {
                        _previous(
                            getRegistrationFormProvider.selectedParticipantTab,
                            getRegistrationFormProvider);
                      },
                child: Container(
                  height: scaleHeight(context, 40),
                  width: scaleWidth(context, 120.85),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: scaleWidth(context, 12.85)),
                  decoration: BoxDecoration(
                      color: _isPreviousDisabled(getRegistrationFormProvider)
                          ? null
                          : const Color(0xFFD9D9D9),
                      border: _isPreviousDisabled(getRegistrationFormProvider)
                          ? Border.all(color: const Color(0xFFD9D9D9))
                          : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back,
                          size: 16,
                          color:
                              _isPreviousDisabled(getRegistrationFormProvider)
                                  ? const Color(0xFFD9D9D9)
                                  : const Color(0xFF3C3C3C)),
                      SizedBox(width: scaleWidth(context, 16)),
                      Text('Previous',
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontSize: scaleWidth(context, 16),
                            color:
                                _isPreviousDisabled(getRegistrationFormProvider)
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
                onTap: _isNextDiasabled(getRegistrationFormProvider)
                    ? null
                    : () {
                        _next(
                            getRegistrationFormProvider.selectedParticipantTab,
                            getRegistrationFormProvider,
                            context);
                      },
                child: Container(
                  height: scaleHeight(context, 40),
                  width: scaleWidth(context, 120.85),
                  margin: EdgeInsets.only(right: scaleWidth(context, 53.15)),
                  padding: EdgeInsets.only(right: scaleWidth(context, 12.85)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: _isNextDiasabled(getRegistrationFormProvider)
                          ? null
                          : const Color(0xFFD9D9D9),
                      border: _isNextDiasabled(getRegistrationFormProvider)
                          ? Border.all(color: const Color(0xFFD9D9D9))
                          : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          _isSubmitEnabled(getRegistrationFormProvider)
                              ? "Submit"
                              : 'Next',
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontSize: scaleWidth(context, 16),
                            color: _isNextDiasabled(getRegistrationFormProvider)
                                ? const Color(0xFFD9D9D9)
                                : const Color(0xFF3C3C3C),
                            fontWeight: FontWeight.w400,
                          )),
                      SizedBox(width: scaleWidth(context, 16)),
                      Icon(Icons.arrow_forward,
                          color: _isNextDiasabled(getRegistrationFormProvider)
                              ? const Color(0xFFD9D9D9)
                              : const Color(0xFF3C3C3C),
                          size: 16),
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

  void _previous(
    int selectedTab,
    GetRegistrationFormProvider provider,
  ) async {
    int sectionIndex = provider.getformcontroller.index;
    int lastTab = provider.teamData.members.length - 1;
    debugPrint(
        "Current state -> selectedTab: $selectedTab, sectionIndex: $sectionIndex, initialMemberIndex: ${provider.initialmemberIndex}");

    if (provider.initialmemberIndex == 0) {
      if (selectedTab == 0) {
        if (sectionIndex == 0) {
          debugPrint("Action disabled");
        } else {
          provider.getformcontroller.animateTo(sectionIndex - 1);
        }
      } else if (selectedTab == 1) {
        if (sectionIndex == 0) {
          provider.setSelectedParticipantTab(0);
          await refreshSectionCounts(provider);
          provider.getformcontroller
              .animateTo(provider.singleForm.sections.length + 1);
        } else {
          provider.getformcontroller.animateTo(sectionIndex - 1);
        }
      } else if (selectedTab > 1) {
        if (sectionIndex == 0) {
          provider.setSelectedParticipantTab(selectedTab - 1);
          await refreshSectionCounts(provider);
          provider.getformcontroller.animateTo(0);
        } else {
          provider.getformcontroller.animateTo(sectionIndex - 1);
        }
      }
    } else {
      // Cases when initialMemberIndex > 0
      if (selectedTab < provider.initialmemberIndex) {
        debugPrint("Action disabled");
      } else if (selectedTab > provider.initialmemberIndex &&
          selectedTab <= lastTab) {
        provider.setSelectedParticipantTab(provider.initialmemberIndex);
        await refreshSectionCounts(provider);
        provider.getformcontroller.animateTo(0);
      } else if (selectedTab == provider.initialmemberIndex) {
        if (sectionIndex == 0) {
          debugPrint("Action disabled");
        } else {
          provider.getformcontroller.animateTo(sectionIndex - 1);
        }
      }
    }
  }

  void _next(int selectedTab, GetRegistrationFormProvider provider,
      BuildContext context) async {
    int sectionIndex = provider.getformcontroller.index;
    int lastTab = provider.teamData.members.length - 1;
    int teamsize = provider.teamData.team.teamSize;

    debugPrint(
        "Current state -> selectedTab: $selectedTab, sectionIndex: $sectionIndex, initialMemberIndex: ${provider.initialmemberIndex}");

    // Case 1, 2, 5, 7: Animating to the next section based on sectionIndex constraints
    if (provider.initialmemberIndex == 0 &&
        ((selectedTab == 0 &&
                sectionIndex < provider.singleForm.sections.length + 1) ||
            ((selectedTab > 0 && selectedTab <= lastTab) &&
                (sectionIndex < provider.singleForm.sections.length) &&
                (sectionIndex > 0)))) {
      debugPrint("case 1");
      provider.getformcontroller.animateTo(sectionIndex + 1);
    }

    // Case 3:
    else if (provider.initialmemberIndex == 0 &&
        selectedTab == 0 &&
        sectionIndex == provider.singleForm.sections.length + 1) {
      debugPrint("case 2");

      if (teamsize == 0) {
        debugPrint("Action disabled");
        debugPrint("case 2a");
      } else if (teamsize == 1) {
        postTeamData(provider, context);
        debugPrint("case 2b");
      } else if (teamsize > 1) {
        provider.setSelectedParticipantTab(selectedTab + 1);
        await refreshSectionCounts(provider);
        provider.getformcontroller.animateTo(0);
      }
    }

    // Case 6: Submit function for the last tab and section boundary conditions
    else if ((provider.initialmemberIndex == 0 && selectedTab == lastTab) &&
        (sectionIndex == 0 ||
            sectionIndex == provider.singleForm.sections.length)) {
      postTeamData(provider, context);
    }

    // Case 4: Change to the next participant at the boundaries
    else if (provider.initialmemberIndex == 0 &&
        (selectedTab > 0 && selectedTab < lastTab) &&
        (sectionIndex == 0 ||
            sectionIndex == provider.singleForm.sections.length)) {
      provider.setSelectedParticipantTab(selectedTab + 1);
      await refreshSectionCounts(provider);
      provider.getformcontroller.animateTo(0);
    }

    //below cases are for member
    // Case 8: Reset to the initial participant if the selectedTab is less
    else if (provider.initialmemberIndex > 0 &&
        selectedTab < provider.initialmemberIndex) {
      provider.setSelectedParticipantTab(provider.initialmemberIndex);
      await refreshSectionCounts(provider);
      provider.getformcontroller.animateTo(0);
    }

    // Case 10: Animate within the sections of the initial member when the sectionIndex is less
    else if (provider.initialmemberIndex > 0 &&
        selectedTab == provider.initialmemberIndex &&
        sectionIndex < provider.singleForm.sections.length) {
      provider.getformcontroller.animateTo(sectionIndex + 1);
    }

    // Case 9: Print disabled when selected tab is outside valid range
    else if (provider.initialmemberIndex > 0 &&
        selectedTab > provider.initialmemberIndex &&
        selectedTab <= lastTab) {
      debugPrint("Action disabled");
    }

    // End of the form sections for initial member, call submit function
    else if (provider.initialmemberIndex > 0 &&
        selectedTab == provider.initialmemberIndex &&
        sectionIndex == provider.singleForm.sections.length) {
      // _postMemberDetails(); or another submission logic//TODO
      postMemberDetails(provider,context);
    }
  }

  Future<void> refreshSectionCounts(
      GetRegistrationFormProvider provider) async {
    int count = provider.selectedParticipantTab == 0 ? 2 : 1;

    provider.setSectionsCount(provider.singleForm.sections.length + count);

    await provider.refreshTabs();
  }

  bool _isPreviousDisabled(GetRegistrationFormProvider provider) {
    return (provider.selectedParticipantTab == provider.initialmemberIndex &&
            provider.getformcontroller.index == 0) ||
        (provider.initialmemberIndex > 0 &&
            provider.selectedParticipantTab < provider.initialmemberIndex);
  }

  bool _isNextDiasabled(GetRegistrationFormProvider provider) {
    int sectionIndex = provider.getformcontroller.index;
    int lastTab = provider.teamData.members.length - 1;
    int teamsize = provider.teamData.team.teamSize;
    int selectedTab = provider.selectedParticipantTab;

    return (provider.initialmemberIndex == 0 &&
            selectedTab == 0 &&
            sectionIndex == provider.singleForm.sections.length + 1 &&
            teamsize == 0) ||
        (provider.initialmemberIndex > 0 &&
            selectedTab > provider.initialmemberIndex &&
            selectedTab <= lastTab);
  }

  bool _isSubmitEnabled(GetRegistrationFormProvider provider) {
    int sectionIndex = provider.getformcontroller.index;
    int lastTab = provider.teamData.members.length - 1;
    int teamSize = provider.teamData.team.teamSize;
    int selectedTab = provider.selectedParticipantTab;
    int totalSections = provider.singleForm.sections.length;
    int initialMemberIndex = provider.initialmemberIndex;

    // Debug current state
    debugPrint(
        "Current state -> selectedTab: $selectedTab, sectionIndex: $sectionIndex, initialMemberIndex: $initialMemberIndex");

    // Handle cases for the team leader
    if (initialMemberIndex == 0) {
      // Handle navigation and submit cases for the team leader
      if (selectedTab == 0) {
        if (sectionIndex <= totalSections) {
          debugPrint("Navigating within leader's sections");
          return false;
        } else if (sectionIndex == totalSections + 1) {
          debugPrint("Leader's form submit decision");
          return teamSize == 1; // Submit only if single-member team
        }
      } else if (selectedTab >= 1 && selectedTab <= lastTab) {
        if (selectedTab == lastTab &&
            (sectionIndex == 0 || sectionIndex == totalSections)) {
          debugPrint("Submitting leader's details on last tab");
          return true; // Submit leader's details on last tab
        } else {
          debugPrint("Navigating within leader's multiple member tabs");
          return false; // Navigate within other tabs
        }
      }
    } else {
      // Handle cases for other members
      if (selectedTab < initialMemberIndex ||
          (selectedTab > initialMemberIndex && selectedTab <= lastTab)) {
        debugPrint("Navigation control for team members");
        return false; // Control navigation for other team members
      } else if (selectedTab == initialMemberIndex) {
        if (sectionIndex < totalSections) {
          debugPrint("Navigating within member's sections");
          return false;
        } else if (sectionIndex == totalSections) {
          debugPrint("Submitting member's details");
          return true; // Submit current member's details
        }
      }
    }
    return false;
  }

  void postTeamData(
      GetRegistrationFormProvider provider, BuildContext context) async {
    // check all needed data filled of leader and team details filled or not
    final allDetailsFilled = provider.isMemberDataComplete(0) &&
        provider.teamData.team.teamName.isNotEmpty &&
        provider.teamData.team.teamSize > 0;

    if (allDetailsFilled) {
      //show dialog box are u sure?
      final result = await askUserDialog(
        context,
        "Are you sure you want to submit",
        "This action can't be undone",
      );

      if (result) {
        final memberId = await provider.createTeam(hackathonId);
        debugPrint("isTeamCreated $memberId");
        if (memberId.isNotEmpty) {
          // call api participant
          final isParticipationDone =
              await provider.createParticipant(0, memberId);

          if (isParticipationDone) {
            //show dialog box of success and on its ok redirect to details screen
            // invitaion api is on hold ig
            await askUserDialog(
                context, "Your form is submitted successfully", "Success",
                cancel: false);
            Navigator.pop(context);
            Navigator.pop(context);

            print("Yuhooooooooooooooooooooooooo new screen");
          } else {
            // show dialog something went wrong(also think what to do with created team)
            aletDialog(context, "Unable to submit", "Something went wrong");
          }
        } else {
          aletDialog(context, "Unable to submit", "Something went wrong");
        }
      }
    } else {
      aletDialog(
          context, "Fill all the necessary details", "Details not filled");
      //show errors on such places or do something
    }
  }

  void postMemberDetails(
      GetRegistrationFormProvider provider, BuildContext context) async {
    final allDetailsFilled =
        provider.isMemberDataComplete(provider.initialmemberIndex);

    if (allDetailsFilled) {
      //show dialog box are u sure?
      final result = await askUserDialog(
        context,
        "Are you sure you want to submit",
        "This action can't be undone",
      );

      if (result) {
        final memberId =
            await provider.createMember(teamId, provider.initialmemberIndex);
        debugPrint("isMemberCreated in desktop $memberId");
        if (memberId.isNotEmpty) {
          // call api participant
          final isParticipationDone = await provider.createParticipant(
              provider.initialmemberIndex, memberId);

          if (isParticipationDone) {
            //show dialog box of success and on its ok redirect to details screen
            // invitaion api is on hold ig
            await askUserDialog(
                context, "Your form is submitted successfully", "Success",
                cancel: false);
            Navigator.pop(context);
            Navigator.pop(context);

            print("Yuhooooooooooooooooooooooooo new screen");
          } else {
            // show dialog something went wrong(also think what to do with created team)
            aletDialog(context, "Unable to submit", "Something went wrong");
          }
        } else {
          aletDialog(context, "Unable to submit", "Something went wrong");
        }
      }
    } else {
      aletDialog(
          context, "Fill all the necessary details", "Details not filled");
      //show errors on such places or do something
    }
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
          ...List.generate(getRegistrationFormProvider.teamData.members.length,
              (index) {
            return Padding(
              padding: EdgeInsets.only(
                  top: scaleHeight(context, index == 0 ? 0 : 25),
                  bottom: scaleHeight(context, index == 9 ? 0 : 25)),
              child: InkWell(
                onTap: () async {
                  //setting currently selected participant tab and updating total sections count according to participant type and tabs controller
                  getRegistrationFormProvider.setSelectedParticipantTab(index);
                  int count =
                      getRegistrationFormProvider.selectedParticipantTab == 0
                          ? 2
                          : 1;

                  getRegistrationFormProvider.setSectionsCount(
                      getRegistrationFormProvider.singleForm.sections.length +
                          count);

                  await getRegistrationFormProvider.refreshTabs();
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
                            color: getRegistrationFormProvider
                                    .isMemberDataComplete(index)
                                ? const Color(0xFF44D152)
                                : const Color(0xFFFFFBFB),
                            shape: BoxShape.circle,
                            border: getRegistrationFormProvider
                                        .selectedParticipantTab ==
                                    index
                                ? Border.all(
                                    color:
                                        const Color.fromARGB(255, 44, 116, 51),
                                    width: 5)
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
