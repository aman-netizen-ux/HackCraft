import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/api/Registartion/postRegistration.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/sampleTab.dart';
import 'package:provider/provider.dart';

class CreateForm extends StatefulWidget {
  final String hackathonId;
  const CreateForm({super.key, required this.hackathonId});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> with TickerProviderStateMixin {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: false);
    List<String> keys = createRegistrationProvider.tabField.keys.toList();
    for (int i = 0; i < createRegistrationProvider.tabField.length; i++) {
      // createRegistrationProvider.edit.add(false);
      createRegistrationProvider.tab.add(TextEditingController(text: keys[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: true);
    if (createRegistrationProvider.tab.length !=
        createRegistrationProvider.tabField.length) {
      // createRegistrationProvider.edit.clear();
      createRegistrationProvider.tab.clear();
      for (int i = 0; i < createRegistrationProvider.tabField.length; i++) {
        // createRegistrationProvider.edit.add(false);

        createRegistrationProvider.tab.add(TextEditingController(
            text: createRegistrationProvider.tabField.keys.toList()[i]));
      }
    }

    return Container(
      margin: EdgeInsets.only(
          left: scaleWidth(context, 27),
          right: scaleWidth(context, 27),
          bottom: scaleHeight(context, 67)),
      decoration: BoxDecoration(
          color: lightGrey, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.only(
            left: scaleWidth(context, 20), right: scaleWidth(context, 27)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: scaleHeight(context, 19),
                  bottom: scaleHeight(context, 5)),
              child: Text(
                "Create your form",
                style: GoogleFonts.firaSans(
                    fontSize: scaleHeight(context, 21),
                    color: darkCharcoal,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur  adipiscing elit.",
              style: GoogleFonts.firaSans(
                  fontSize: scaleHeight(context, 12),
                  color: darkCharcoal,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: scaleHeight(context, 23),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scaleHeight(context, 37),
                    child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: black1,
                        controller: createRegistrationProvider.formcontroller,
                        tabs: List.generate(
                            createRegistrationProvider.tabField.length,
                            (index) {
                          List<String> keys =
                              createRegistrationProvider.tabField.keys.toList();

                          final bool newCurrentTab = createRegistrationProvider
                                      .formcontroller.index ==
                                  index &&
                              index != 0 &&
                              index !=
                                  createRegistrationProvider.tabField.length -
                                      1;
                          return GestureDetector(
                            onTap: () {
                              createRegistrationProvider.formcontroller
                                  .animateTo(index);

                              // createRegistrationProvider.resetEditingState(1);
                            },
                            child: Tab(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: scaleHeight(context, 10),
                                    left: scaleHeight(context, 5)),
                                child: SizedBox(
                                  width: scaleWidth(
                                      context, newCurrentTab ? 250 : 100),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: newCurrentTab
                                            ? TextField(
                                                textAlign: TextAlign.center,
                                                controller:
                                                    createRegistrationProvider
                                                        .tab[index],
                                                decoration:
                                                    const InputDecoration(
                                                        isDense: true,
                                                        border:
                                                            InputBorder.none),
                                                style: GoogleFonts.firaSans(
                                                  color: black1,
                                                  fontSize:
                                                      heightScaler(context, 14),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                enabled: newCurrentTab,
                                                onTapOutside:
                                                    (PointerDownEvent e) {
                                                  createRegistrationProvider
                                                      .updateKeyAtIndex(
                                                          index,
                                                          createRegistrationProvider
                                                              .tab[index].text,
                                                          context);
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              )
                                            : Text(keys[index],
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.getFont(
                                                  fontFamily2,
                                                  fontSize:
                                                      scaleWidth(context, 14),
                                                  color: black1,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                      ),
                                      newCurrentTab
                                          ? InkWell(
                                              onTap: () {
                                                createRegistrationProvider
                                                    .removeSection(
                                                        keys[index], index);
                                              },
                                              child: SvgPicture.asset(
                                                'assets/icons/defaultEditPortal/deleteIcon.svg',
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        grey5, BlendMode.srcIn),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: createRegistrationProvider.formcontroller,
                        children: List.generate(
                            createRegistrationProvider.tabField.length,
                            (index) {
                          List<String> keys =
                              createRegistrationProvider.tabField.keys.toList();
                          return SampleTab(
                            // fieldsList: values[index],
                            // sectionIndex: index,
                            sectionName: keys[index],
                            reorderListDisabled: index == 0 ||
                                index ==
                                    createRegistrationProvider.tabField.length -
                                        1,
                          );
                        })),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: scaleHeight(context, 30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        createRegistrationProvider.formcontroller.index == 0
                            ? Container()
                            : InkWell(
                                onTap: () {
                                  int i = createRegistrationProvider
                                      .formcontroller.index;
                                  if (i != 0) {
                                    createRegistrationProvider.formcontroller
                                        .animateTo(i - 1);
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  height: scaleHeight(context, 38),
                                  width: scaleWidth(context, 104),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: lightSilver,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Previous",
                                    style: GoogleFonts.firaSans(
                                      fontWeight: FontWeight.w500,
                                      color: darkCharcoal,
                                      fontSize: scaleHeight(context, 14),
                                    ),
                                  ),
                                ),
                              ),
                        createRegistrationProvider.formcontroller.index ==
                                createRegistrationProvider.tabField.length - 1
                            ? Container()
                            : InkWell(
                                onTap: () {
                                  int i = createRegistrationProvider
                                      .formcontroller.index;

                                  if (i !=
                                      createRegistrationProvider
                                          .tabField.length) {
                                    createRegistrationProvider.formcontroller
                                        .animateTo(i + 1);
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  height: scaleHeight(context, 38),
                                  width: scaleWidth(context, 104),
                                  margin: EdgeInsets.only(
                                      left: scaleWidth(context, 12)),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: lightSilver,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Next",
                                    style: GoogleFonts.firaSans(
                                      fontWeight: FontWeight.w500,
                                      color: darkCharcoal,
                                      fontSize: scaleHeight(context, 14),
                                    ),
                                  ),
                                ),
                              ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            final singleHackathonProvider =
                                Provider.of<CreateRegistrationProvider>(context,
                                    listen: false);

                            if (isLoading == true) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              );
                            }

                            // await singleHackathonProvider
                            //     .getSingleHackathonsLisHt(
                            //         "d3ae95c1-0eee-4745-8b56-259ae9404867");
                            int count = 7;

                            List<dynamic> allFields = [];
                            int nextSerialNumber = 1;
                            singleHackathonProvider.tabField
                                .forEach((key, fields) {
                              if (key != "General" && key != "Team Details") {
                                for (var field in fields) {
                                  if (field.type == FieldTypes.yesNo) {
                                    field.type = FieldTypes.radio;
                                  }
                                  count++;
                                  field.serialNumber = nextSerialNumber;
                                  nextSerialNumber++;
                                  allFields.add(field);
                                }
                              }
                            });
                            int noOfFields = count - 7;
                            debugPrint('fields : $allFields');

                            List<Map<String, dynamic>> sections = [];
                            int serialNumber = 1;
                            createRegistrationProvider.tabField
                                .forEach((key, fields) {
                              if (key != "General" && key != "Team Details") {
                                int numberOfQuestions = fields.length;
                                if (numberOfQuestions > 0) {
                                  Map<String, dynamic> section = {
                                    "serial_number": serialNumber,
                                    "section_name": key,
                                    "number_of_questions": numberOfQuestions
                                  };

                                  sections.add(section);
                                  serialNumber++;
                                }
                              }
                            });

                            Map<String, dynamic> formPostBody = {
                              "form": {"number_of_fields": noOfFields},
                              "fields": allFields,
                              "sections": sections
                            };

                            PostApiService()
                                .postRegistration(
                                    widget.hackathonId, formPostBody)
                                .then((value) {
                              if (value) {
                                //  Navigator.pushNamed(context, '/mainNavigation');
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/mainNavigation',
                                  (route) => false,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Form Created'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            });
                            setState(() {
                              isLoading = false;
                            });

                            // print(singleHackathonProvider
                            //     .singleForm.fields[0].minDate);
                          },
                          child: Container(
                            height: scaleHeight(context, 38),
                            width: scaleWidth(context, 104),
                            margin:
                                EdgeInsets.only(left: scaleWidth(context, 12)),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: lightSilver,
                                borderRadius: BorderRadius.circular(5)),
                            child: isLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    "Submit",
                                    style: GoogleFonts.firaSans(
                                      fontWeight: FontWeight.w500,
                                      color: darkCharcoal,
                                      fontSize: scaleHeight(context, 14),
                                    ),
                                  ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
