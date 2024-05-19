import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/Registration/questionModel.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/regFormField.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/template.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/addQuestion.dart';


class RegistrationFormDesktopBody extends StatefulWidget {
  final String hackathonId;
  const RegistrationFormDesktopBody({super.key, required this.hackathonId});

  @override
  _RegistrationFormDesktopBodyState createState() =>
      _RegistrationFormDesktopBodyState();
}

class _RegistrationFormDesktopBodyState
    extends State<RegistrationFormDesktopBody> with TickerProviderStateMixin {
  final List<Question> questions = [];
  late TabController fieldtabController;
  late TabController tabController;
  int regTab = 1;

  @override
  void initState() {
    super.initState();
    fieldtabController = TabController(length: 2, vsync: this);
    tabController = TabController(length: 3, vsync: this);
  }

// Function to handle form submission for registration
  // Future<bool> submitRegistration() async {
  //   if (_formKey.currentState!.saveAndValidate()) {
  //     final formData = _formKey.currentState!.value;

  //     // Prepare custom fields data
  //     List<Map<String, dynamic>> customFieldsData = [];
  //     for (var question in questions) {
  //       Map<String, dynamic> customFieldData = {
  //         "label": question.question,
  //         //  "type": questionTypeString,
  //         // ... other fields ...
  //       };

  //       if (question.type == "QuestionType.text") {
  //         customFieldData["short_answer"] = {
  //           "text": question.question
  //           // Assuming formData contains answers keyed by question
  //         };
  //       } else if (question.type == "QuestionType.multipleChoice") {
  //         List<Map<String, String>> multipleChoiceOptions = [];
  //         for (var option in question.options) {
  //           multipleChoiceOptions.add({"option": option});
  //         }
  //         customFieldData["multiple_choice"] = multipleChoiceOptions;
  //       }

  //       customFieldsData.add(customFieldData);
  //     }

  //     // Prepare the complete request body
  //     Map<String, dynamic> requestBody = {
  //       "form": {
  //         "participant_name": '',
  //         "participant_email": '',
  //         "participant_phone": 0,
  //         "participant_gender": ''
  //       },
  //       "custom_fields": customFieldsData
  //     };

  //     // Call your API service with the request body
  //     await PostApiService().postRegistration(widget.hackathonId, requestBody);
  //     final response = await PostApiService()
  //         .postRegistration(widget.hackathonId, requestBody);
  //     if (response == 201) {
  //       // Assuming 200 is success status code
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  //   return false; // Return false if form validation fails
  // }

  // void handleRegistration() async {
  //   bool isSuccess = await submitRegistration();
  //   if (isSuccess) {
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Success'),
  //           content: const Text('Registration Form created successfully!'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainNavigation()), (Route<dynamic> route) => false);
  //                 Navigator.pushNamed(context, '/mainNavigation');
  //               },
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     // Show error dialog or message
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Error'),
  //           content: const Text(
  //               'Failed to create Registration Form. Please try again.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  @override
  void dispose() {
    fieldtabController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 162,
              child: Container(
                color: navbarGrey,
              ),
            ),
            Expanded(
              flex: 838,
              child: Container(
                color: lightSilver,
              ),
            )
          ],
        ),
        SizedBox(
          height: scaleHeight(context, 820),
          width: scaleWidth(context, 1280),
          child: Padding(
            padding: EdgeInsets.only(
                right: scaleWidth(context, 27),
                left: scaleWidth(context, 27),
                top: scaleHeight(context, 27)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Container to be updated with image logic
                        Container(
                          height: scaleHeight(context, 24),
                          width: scaleWidth(context, 24),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: grey1,
                          ),
                        ),
                        SizedBox(
                          width: scaleWidth(context, 6),
                        ),
                        Text('HackCraft',
                            style: GoogleFonts.getFont(fontFamily1,
                                fontSize: scaleHeight(context, 20),
                                color: white,
                                fontWeight: FontWeight.w400,
                                height: lineHeight(22.4, 20))),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: scaleHeight(context, 5)),
                      height: scaleHeight(context, 35),
                      width: scaleWidth(context, 490),
                      decoration: BoxDecoration(
                          color:const Color(0xff626262),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                regTab = 0;
                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: scaleWidth(context, 150),
                                decoration: regTab == 0
                                    ? BoxDecoration(
                                        color: navbarGrey,
                                        borderRadius: BorderRadius.circular(5))
                                    : null,
                                child: Text(
                                  "Workflow",
                                  style: GoogleFonts.firaSans(
                                      fontSize: scaleWidth(context, 12),
                                      fontWeight: FontWeight.w500,
                                      color: white),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                regTab = 1;
                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: scaleWidth(context, 150),
                                decoration: regTab == 1
                                    ? BoxDecoration(
                                        color: navbarGrey,
                                        borderRadius: BorderRadius.circular(5))
                                    : null,
                                child: Text(
                                  "Fields",
                                  style: GoogleFonts.firaSans(
                                      fontSize: scaleWidth(context, 12),
                                      fontWeight: FontWeight.w500,
                                      color: white),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                regTab = 2;
                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: scaleWidth(context, 150),
                                decoration: regTab == 2
                                    ? BoxDecoration(
                                        color: navbarGrey,
                                        borderRadius: BorderRadius.circular(5))
                                    : null,
                                child: Text(
                                  "Preview",
                                  style: GoogleFonts.firaSans(
                                      fontSize: scaleWidth(context, 12),
                                      fontWeight: FontWeight.w500,
                                      color: white),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: scaleHeight(context, 25)),
                    child: regTab == 0
                        ?const  Templates()
                        : regTab == 1
                            ? RegFormFields(fieldtabController: fieldtabController, hackathonId: widget.hackathonId)
                            :const Templates(),
                  ),
                )
              ],
            ),
          ),
        ),

        // Container(
        //   color: vibrantGreen,
        //   height: MediaQuery.of(context).size.height,
        // ),
        // Positioned(
        //   left: 0,
        //   right: 0,
        //   bottom: 0,
        //   child: ClipRRect(
        //     borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        //     child: Container(
        //       color: Colors.white,
        //       height: scaleHeight(context, 650),
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 150),
        //         child: SingleChildScrollView(
        //           child: Column(
        //             children: [
        //               const Padding(
        //                 padding: EdgeInsets.all(30),
        //                 child: Text(
        //                   "Sign Up",
        //                   style: TextStyle(
        //                       color: deepNavy,
        //                       fontSize: 48,
        //                       fontWeight: FontWeight.w600),
        //                 ),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.all(30),
        //                 child: Align(
        //                   alignment: Alignment.topLeft,
        //                   child: Text(
        //                     "Basic Details*",
        //                     style: TextStyle(
        //                         color: deepNavy,
        //                         fontSize: 32,
        //                         fontWeight: FontWeight.w500),
        //                   ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.all(16.0),
        //                 child: FormBuilder(
        //                   key: _formKey,
        //                   autovalidateMode: AutovalidateMode.onUserInteraction,
        //                   child: Column(
        //                     children: [
        //                       Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           const Padding(
        //                             padding: EdgeInsets.symmetric(vertical: 10),
        //                             child: Text(
        //                               "Full name",
        //                               textAlign: TextAlign.left,
        //                               style: TextStyle(
        //                                   color: deepNavy,
        //                                   fontSize: 24,
        //                                   fontWeight: FontWeight.w400),
        //                             ),
        //                           ),
        //                           FormBuilderTextField(
        //                             name: 'name',
        //                             enabled: false,
        //                             decoration: InputDecoration(
        //                               filled: true,
        //                               fillColor: offWhite,
        //                               border: OutlineInputBorder(
        //                                 borderRadius:
        //                                     BorderRadius.circular(30.0),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(height: scaleHeight(context, 32)),
        //                       Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           const Padding(
        //                             padding: EdgeInsets.symmetric(vertical: 10),
        //                             child: Text(
        //                               "Email id",
        //                               textAlign: TextAlign.left,
        //                               style: TextStyle(
        //                                   color: deepNavy,
        //                                   fontSize: 24,
        //                                   fontWeight: FontWeight.w400),
        //                             ),
        //                           ),
        //                           FormBuilderTextField(
        //                             name: 'email',
        //                             enabled: false,
        //                             decoration: InputDecoration(
        //                               filled: true,
        //                               fillColor: offWhite,
        //                               border: OutlineInputBorder(
        //                                 borderRadius:
        //                                     BorderRadius.circular(30.0),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(height: scaleHeight(context, 16)),
        //                       // Column(
        //                       //   crossAxisAlignment: CrossAxisAlignment.start,
        //                       //   children: [
        //                       //     const Padding(
        //                       //       padding: EdgeInsets.symmetric(vertical: 10),
        //                       //       child: Text(
        //                       //         "College",
        //                       //         textAlign: TextAlign.left,
        //                       //         style: TextStyle(
        //                       //             color: deepNavy,
        //                       //             fontSize: 24,
        //                       //             fontWeight: FontWeight.w400),
        //                       //       ),
        //                       //     ),
        //                       //     FormBuilderTextField(
        //                       //       name: 'college',
        //                       //       controller: _collegeController,
        //                       //       decoration: InputDecoration(
        //                       //         filled: true,
        //                       //         fillColor:
        //                       //             _collegeController.text.isNotEmpty
        //                       //                 ? Colors.white
        //                       //                 : offWhite,
        //                       //         border: OutlineInputBorder(
        //                       //           borderRadius:
        //                       //               BorderRadius.circular(30.0),
        //                       //         ),
        //                       //       ),
        //                       //     ),
        //                       //   ],
        //                       // ),
        //                       const SizedBox(height: 16.0),
        //                       Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               const Padding(
        //                                 padding:
        //                                     EdgeInsets.symmetric(vertical: 10),
        //                                 child: Text(
        //                                   "Gender",
        //                                   textAlign: TextAlign.left,
        //                                   style: TextStyle(
        //                                       color: deepNavy,
        //                                       fontSize: 24,
        //                                       fontWeight: FontWeight.w400),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 width: scaleWidth(context, 400),
        //                                 child: FormBuilderDropdown(
        //                                   name: 'gender',
        //                                   enabled: false,
        //                                   decoration: InputDecoration(
        //                                       filled: true,
        //                                       fillColor: offWhite,
        //                                       border: OutlineInputBorder(
        //                                         borderRadius:
        //                                             BorderRadius.circular(30.0),
        //                                       ),
        //                                       labelText: 'Select Gender'),
        //                                   items: [
        //                                     'Male',
        //                                     'Female',
        //                                     'Prefer Not to Say'
        //                                   ]
        //                                       .map((gender) => DropdownMenuItem(
        //                                             value: gender,
        //                                             child: Text(gender),
        //                                           ))
        //                                       .toList(),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           const SizedBox(width: 80),
        //                           Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               const Padding(
        //                                 padding:
        //                                     EdgeInsets.symmetric(vertical: 10),
        //                                 child: Text(
        //                                   "Contact No.",
        //                                   textAlign: TextAlign.left,
        //                                   style: TextStyle(
        //                                       color: Color(0xff1a202c),
        //                                       fontSize: 24,
        //                                       fontWeight: FontWeight.w400),
        //                                 ),
        //                               ),
        //                               Row(
        //                                 children: [
        //                                   SizedBox(
        //                                     width: 50,
        //                                     child: FormBuilderTextField(
        //                                       name: 'countryCode',
        //                                       keyboardType: TextInputType.phone,
        //                                       controller:
        //                                           _countryCodeController,
        //                                       enabled: false,
        //                                       decoration: InputDecoration(
        //                                         filled: true,
        //                                         fillColor:
        //                                             const Color(0xffF3FAEE),
        //                                         border: OutlineInputBorder(
        //                                           borderRadius:
        //                                               BorderRadius.circular(
        //                                                   20.0),
        //                                         ),
        //                                         hintText: '+91',
        //                                         hintStyle: const TextStyle(
        //                                           fontSize: 20,
        //                                           color: Color.fromARGB(
        //                                               255, 106, 108, 123),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   const SizedBox(
        //                                     width: 20,
        //                                   ),
        //                                   SizedBox(
        //                                     width: 400,
        //                                     child: FormBuilderTextField(
        //                                       name: 'mobile',
        //                                       enabled: false,
        //                                       decoration: InputDecoration(
        //                                         filled: true,
        //                                         fillColor:
        //                                             const Color(0xffF3FAEE),
        //                                         border: OutlineInputBorder(
        //                                           borderRadius:
        //                                               BorderRadius.circular(
        //                                                   30.0),
        //                                         ),
        //                                         hintText: 'Mobile Number',
        //                                         hintStyle: const TextStyle(
        //                                           fontSize: 20,
        //                                           color: Color.fromARGB(
        //                                               255, 106, 108, 123),
        //                                         ),
        //                                         errorStyle: const TextStyle(
        //                                             fontSize: 14),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ],
        //                               )
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                       const SizedBox(height: 16.0),
        //                       for (int i = 0; i < questions.length; i++)
        //                         FormBuilderQuestion(
        //                           question: questions[i],
        //                           questionIndex: i,
        //                           onDelete: () {
        //                             setState(() {
        //                               questions.removeAt(i);
        //                             });
        //                           },
        //                         ),
        //                       const SizedBox(
        //                         height: 30,
        //                       ),
        //                       Row(
        //                         children: [
        //                           const Text(
        //                             "Add new Section ",
        //                             style: TextStyle(
        //                               fontSize: 32,
        //                               fontWeight: FontWeight.w500,
        //                             ),
        //                           ),
        //                           const SizedBox(
        //                             width: 50,
        //                           ),
        //                           ElevatedButton(
        //                             onPressed: () {
        //                               _addQuestion();
        //                             },
        //                             style: ButtonStyle(
        //                               foregroundColor:
        //                                   MaterialStateProperty.all<Color>(
        //                                       Colors.black),
        //                               backgroundColor:
        //                                   MaterialStateProperty.all<Color>(
        //                                       Colors.white),
        //                             ),
        //                             child: const Text(
        //                               '+',
        //                               style: TextStyle(fontSize: 24),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       const SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: [
        //                           SizedBox(
        //                             width: 200,
        //                             height: 50,
        //                             child: ElevatedButton(
        //                               onPressed: () async {
        //                                 handleRegistration();
        //                               },
        //                               style: ButtonStyle(
        //                                 backgroundColor:
        //                                     MaterialStateProperty.all(
        //                                         Colors.green),
        //                                 shape: MaterialStateProperty.all<
        //                                     RoundedRectangleBorder>(
        //                                   RoundedRectangleBorder(
        //                                     borderRadius:
        //                                         BorderRadius.circular(30),
        //                                   ),
        //                                 ),
        //                               ),
        //                               child: const Text(
        //                                 'Submit',
        //                                 style: TextStyle(
        //                                     fontSize: 20,
        //                                     fontWeight: FontWeight.w600),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void _addQuestion() {
    showDialog(
      context: context,
      builder: (context) {
        return AddQuestionDialog(
          onQuestionAdded: (question) {
            setState(() {
              questions.add(question);
            });
          },
        );
      },
    );
  }
}
