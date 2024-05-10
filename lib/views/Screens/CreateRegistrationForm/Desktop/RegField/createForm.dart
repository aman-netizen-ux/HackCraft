import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/sampleTab.dart';
import 'package:provider/provider.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: false);
    List<String> keys = createRegistrationProvider.tabField.keys.toList();
    for (int i = 0; i < createRegistrationProvider.tabField.length; i++) {
      createRegistrationProvider.edit.add(false);
      createRegistrationProvider.tab.add(TextEditingController(text: keys[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: true);
    if (createRegistrationProvider.edit.length !=
        createRegistrationProvider.tabField.length) {
      createRegistrationProvider.edit.clear();
      createRegistrationProvider.tab.clear();
      for (int i = 0; i < createRegistrationProvider.tabField.length; i++) {
        createRegistrationProvider.edit.add(false);

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
                          return GestureDetector(
                            onTap: () {
                              createRegistrationProvider.formcontroller
                                  .animateTo(0);
                              createRegistrationProvider.resetEditingState(1);
                            },
                            onDoubleTap: () {
                              setState(() {
                                createRegistrationProvider.edit[index] = true;
                              });
                            },
                            child: Tab(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: scaleHeight(context, 10),
                                    left: scaleHeight(context, 5)),
                                child: SizedBox(
                                  width: 100,
                                  child: TextField(
                                    controller:
                                        createRegistrationProvider.tab[index],
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    style: GoogleFonts.firaSans(
                                      color: const Color(0xff000000),
                                      fontSize: heightScaler(context, 14),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    enabled:
                                        createRegistrationProvider.edit[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                       
                        ),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: createRegistrationProvider.formcontroller,
                        children: List.generate(
                            createRegistrationProvider.tabField.length,
                            (index) {
                          List<List> values = createRegistrationProvider
                              .tabField.values
                              .toList();
                          return SampleTab(
                            fieldsList: values[index],
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
                            : SizedBox(
                                height: scaleHeight(context, 38),
                                width: scaleWidth(context, 104),
                                child: ElevatedButton(
                                  onPressed: () {
                                    int i = createRegistrationProvider
                                        .formcontroller.index;
                                    if (i != 0) {
                                      createRegistrationProvider.formcontroller
                                          .animateTo(i - 1);
                                    }
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: lightSilver,
                                  ),
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
                            : Container(
                                margin: EdgeInsets.only(
                                    left: scaleWidth(context, 12)),
                                height: scaleHeight(context, 38),
                                width: scaleWidth(context, 104),
                                child: ElevatedButton(
                                  onPressed: () {
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: lightSilver,
                                  ),
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
                        Container(
                          margin:
                              EdgeInsets.only(left: scaleWidth(context, 12)),
                          height: scaleHeight(context, 38),
                          width: scaleWidth(context, 104),
                          child: ElevatedButton(
                            onPressed: () async {
                              final singleHackathonProvider =
                                  Provider.of<CreateRegistrationProvider>(
                                      context,
                                      listen: false);

                              await singleHackathonProvider
                                  .getSingleHackathonsList(
                                      "d3ae95c1-0eee-4745-8b56-259ae9404867");

                              print(singleHackathonProvider
                                  .singleForm.fields[0].minDate);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightSilver,
                            ),
                            child: Text(
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
