import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/api/Registartion/postRegistration.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/models/Registration/questionModel.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistration.dart';
import 'package:major_project__widget_testing/state/getAllHackathons/getAllHackathonsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/RegistrationForm/addQuestion.dart';
import 'package:major_project__widget_testing/views/Screens/RegistrationForm/formQuestion.dart';
import 'package:provider/provider.dart';

//  scaleHeight(context, 640),

class RegistrationFormDesktopBody extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: vibrantGreen,
        ),
        Align(
          alignment: Alignment.bottomCenter,
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
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: offWhite,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value != null &&
                                          !RegExp(r"^[a-zA-Z\s]+$")
                                              .hasMatch(value)) {
                                        return "Only letters  allowed";
                                      }
                                      return null;
                                    },
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter an email address";
                                      } else if (!RegExp(r'^.+@.+\..+$')
                                          .hasMatch(value)) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "College",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: deepNavy,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  FormBuilderTextField(
                                    name: 'college',
                                    controller: _collegeController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          _collegeController.text.isNotEmpty
                                              ? Colors.white
                                              : offWhite,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value != null &&
                                          !RegExp(r"^[a-zA-Z]+$")
                                              .hasMatch(value)) {
                                        return "Only letters are allowed";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
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
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: offWhite,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              labelText: 'Select Gender'),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Please Select gender";
                                            }
                                            return null;
                                          },
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
                                              validator: (value) {
                                                if (value?.length != 10 ||
                                                    !RegExp(r'^[789]\d{9}$')
                                                        .hasMatch(value!)) {
                                                  return 'Invalid mobile number';
                                                }
                                                return null;
                                              },
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
                                // for (int i = 0;
                                //     i <
                                //         registrationProvider
                                //             .getForm['custom_fields'].length;
                                //     i++)
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!
                                          .saveAndValidate()) {
                                        final formData =
                                            _formKey.currentState!.value;
                                        // Process and save the form data as needed
                                        // PostApiService().postRegistration();
                                        print(formData);
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                    ),
                                    child: const Text('Submit'),
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
