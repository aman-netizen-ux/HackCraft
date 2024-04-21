import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/sampleTab.dart';

late TabController formtabController;

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> with TickerProviderStateMixin {
  TextEditingController tab1 = TextEditingController(text: "Tab1");
  TextEditingController tab2 = TextEditingController(text: "Tab2");
  TextEditingController tab3 = TextEditingController(text: "Tab3");
  TextEditingController tab4 = TextEditingController(text: "Tab4");
  TextEditingController tab5 = TextEditingController(text: "tab5");
  bool edit1 = false;
  bool edit2 = false;
  bool edit3 = false;
  bool edit4 = false;
  bool edit5 = false;

  @override
  void initState() {
    super.initState();
    formtabController = TabController(length: 5, vsync: this);
  }

  // Add a function to reset editing state for all tabs except the specified index
  void resetEditingState(int currentIndex) {
    setState(() {
      edit1 = currentIndex != 0 ? false : edit1;
      edit2 = currentIndex != 1 ? false : edit2;
      edit3 = currentIndex != 2 ? false : edit3;
      edit4 = currentIndex != 3 ? false : edit4;
      edit5 = currentIndex != 4 ? false : edit5;
    });
  }

  @override
  void dispose() {
    formtabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //   height: scaleHeight(context, 672),
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
                    width: scaleWidth(context, 450),
                    child: TabBar(
                      indicatorColor: black1,
                      controller: formtabController,
                      tabs: [
                        GestureDetector(
                          onTap: () {
                            formtabController.animateTo(0);
                            resetEditingState(1);
                          },
                          onDoubleTap: () {
                            setState(() {
                              edit1 = true;
                            });
                          },
                          child: Tab(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: scaleHeight(context, 10),
                                  left: scaleHeight(context, 5)),
                              child: TextField(
                                controller: tab1,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                style: GoogleFonts.firaSans(
                                  color: const Color(0xff000000),
                                  fontSize: heightScaler(context, 14),
                                  fontWeight: FontWeight.w400,
                                ),
                                enabled: edit1,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            formtabController.animateTo(1);
                            resetEditingState(2);
                          },
                          onDoubleTap: () {
                            setState(() {
                              edit2 = true;
                            });
                          },
                          child: Tab(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: scaleHeight(context, 10),
                                  left: scaleHeight(context, 5)),
                              child: TextField(
                                controller: tab2,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                style: GoogleFonts.firaSans(
                                  color: const Color(0xff000000),
                                  fontSize: heightScaler(context, 14),
                                  fontWeight: FontWeight.w400,
                                ),
                                enabled: edit2,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            formtabController.animateTo(2);
                            resetEditingState(3);
                          },
                          onDoubleTap: () {
                            setState(() {
                              edit3 = true;
                            });
                          },
                          child: Tab(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: scaleHeight(context, 10),
                                  left: scaleHeight(context, 5)),
                              child: TextField(
                                controller: tab3,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                style: GoogleFonts.firaSans(
                                  color: const Color(0xff000000),
                                  fontSize: heightScaler(context, 14),
                                  fontWeight: FontWeight.w400,
                                ),
                                enabled: edit3,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            formtabController.animateTo(3);
                            resetEditingState(4);
                          },
                          onDoubleTap: () {
                            setState(() {
                              edit4 = true;
                            });
                          },
                          child: Tab(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: scaleHeight(context, 10),
                                  left: scaleHeight(context, 5)),
                              child: Center(
                                child: TextField(
                                  controller: tab4,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  style: GoogleFonts.firaSans(
                                    color: const Color(0xff000000),
                                    fontSize: heightScaler(context, 14),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabled: edit4,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            formtabController.animateTo(4);
                            resetEditingState(5);
                          },
                          onDoubleTap: () {
                            setState(() {
                              edit5 = true;
                            });
                          },
                          child: Tab(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: scaleHeight(context, 10),
                                  left: scaleHeight(context, 5)),
                              child: TextField(
                                controller: tab5,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                style: GoogleFonts.firaSans(
                                  color: const Color(0xff000000),
                                  fontSize: heightScaler(context, 14),
                                  fontWeight: FontWeight.w400,
                                ),
                                enabled: edit5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: formtabController,
                      children: const [
                        SampleTab(i: 0),
                        SampleTab(i: 1),
                        SampleTab(i: 2),
                        SampleTab(i: 3),
                        SampleTab(i: 4),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: scaleHeight(context, 30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        formtabController.index == 0
                            ? Container()
                            : SizedBox(
                                height: scaleHeight(context, 38),
                                width: scaleWidth(context, 104),
                                child: ElevatedButton(
                                  onPressed: () {
                                    int i = formtabController.index;

                                    if (i != 0) {
                                      formtabController.animateTo(i - 1);
                                    }
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFD9D9D9),
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
                        formtabController.index == 4
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(
                                    left: scaleWidth(context, 12)),
                                height: scaleHeight(context, 38),
                                width: scaleWidth(context, 104),
                                child: ElevatedButton(
                                  onPressed: () {
                                    int i = formtabController.index;

                                    if (i != 4) {
                                      formtabController.animateTo(i + 1);
                                    }
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFD9D9D9),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFD9D9D9),
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
