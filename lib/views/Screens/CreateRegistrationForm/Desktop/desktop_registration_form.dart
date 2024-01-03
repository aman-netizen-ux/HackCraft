import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/api/Registartion/postRegistration.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/models/Registration/questionModel.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/addQuestion.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/formQuestion.dart';
import 'package:provider/provider.dart';

class RegistrationFormDesktopBody extends StatefulWidget {
  final String hackathonId;
  const RegistrationFormDesktopBody({super.key, required this.hackathonId});

  @override
  _RegistrationFormDesktopBodyState createState() =>
      _RegistrationFormDesktopBodyState();
}

class _RegistrationFormDesktopBodyState
    extends State<RegistrationFormDesktopBody> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final List<Question> questions = [];
  TextEditingController _countryCodeController =
      TextEditingController(text: '+91');
  TextEditingController _collegeController = TextEditingController();

// Function to handle form submission for registration
  Future<bool> submitRegistration() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState!.value;

      // Prepare custom fields data
      List<Map<String, dynamic>> customFieldsData = [];
      for (var question in questions) {
        Map<String, dynamic> customFieldData = {
          "label": question.question,
          //  "type": questionTypeString,
          // ... other fields ...
        };

        if (question.type == "QuestionType.text") {
          customFieldData["short_answer"] = {
            "text": question.question
            // Assuming formData contains answers keyed by question
          };
        } else if (question.type == "QuestionType.multipleChoice") {
          List<Map<String, String>> multipleChoiceOptions = [];
          for (var option in question.options) {
            multipleChoiceOptions.add({"option": option});
          }
          customFieldData["multiple_choice"] = multipleChoiceOptions;
        }

        customFieldsData.add(customFieldData);
      }

      // Prepare the complete request body
      Map<String, dynamic> requestBody = {
        "form": {
          "participant_name": '',
          "participant_email": '',
          "participant_phone": 0,
          "participant_gender": ''
        },
        "custom_fields": customFieldsData
      };

      // Call your API service with the request body
      await PostApiService().postRegistration(widget.hackathonId, requestBody);
      final response = await PostApiService()
          .postRegistration(widget.hackathonId, requestBody);
      if (response == 201) {
        // Assuming 200 is success status code
        return true;
      } else {
        return false;
      }
    }
    return false; // Return false if form validation fails
  }

  void handleRegistration() async {
    bool isSuccess = await submitRegistration();
    if (isSuccess) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Registration Form created successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Show error dialog or message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content:
                Text('Failed to create Registration Form. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: vibrantGreen,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              color: Colors.white,
              height: scaleHeight(context, 650),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: deepNavy,
                              fontSize: 48,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Basic Details*",
                            style: TextStyle(
                                color: deepNavy,
                                fontSize: 32,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilder(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "Full name",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: deepNavy,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  FormBuilderTextField(
                                    name: 'name',
                                    enabled: false,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: offWhite,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: scaleHeight(context, 32)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "Email id",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: deepNavy,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  FormBuilderTextField(
                                    name: 'email',
                                    enabled: false,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: offWhite,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: scaleHeight(context, 16)),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     const Padding(
                              //       padding: EdgeInsets.symmetric(vertical: 10),
                              //       child: Text(
                              //         "College",
                              //         textAlign: TextAlign.left,
                              //         style: TextStyle(
                              //             color: deepNavy,
                              //             fontSize: 24,
                              //             fontWeight: FontWeight.w400),
                              //       ),
                              //     ),
                              //     FormBuilderTextField(
                              //       name: 'college',
                              //       controller: _collegeController,
                              //       decoration: InputDecoration(
                              //         filled: true,
                              //         fillColor:
                              //             _collegeController.text.isNotEmpty
                              //                 ? Colors.white
                              //                 : offWhite,
                              //         border: OutlineInputBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(30.0),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          "Gender",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: deepNavy,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      SizedBox(
                                        width: scaleWidth(context, 400),
                                        child: FormBuilderDropdown(
                                          name: 'gender',
                                          enabled: false,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: offWhite,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              labelText: 'Select Gender'),
                                          items: [
                                            'Male',
                                            'Female',
                                            'Prefer Not to Say'
                                          ]
                                              .map((gender) => DropdownMenuItem(
                                                    value: gender,
                                                    child: Text(gender),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 80),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          "Contact No.",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color(0xff1a202c),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            child: FormBuilderTextField(
                                              name: 'countryCode',
                                              keyboardType: TextInputType.phone,
                                              controller:
                                                  _countryCodeController,
                                              enabled: false,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    const Color(0xffF3FAEE),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                hintText: '+91',
                                                hintStyle: const TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 106, 108, 123),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: 400,
                                            child: FormBuilderTextField(
                                              name: 'mobile',
                                              enabled: false,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    const Color(0xffF3FAEE),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                hintText: 'Mobile Number',
                                                hintStyle: const TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 106, 108, 123),
                                                ),
                                                errorStyle: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              for (int i = 0; i < questions.length; i++)
                                FormBuilderQuestion(
                                  question: questions[i],
                                  questionIndex: i,
                                  onDelete: () {
                                    setState(() {
                                      questions.removeAt(i);
                                    });
                                  },
                                ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Add new Section ",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _addQuestion();
                                    },
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                    child: const Text(
                                      '+',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        handleRegistration();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
