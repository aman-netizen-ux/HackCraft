import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/sample.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/signUpGoogleButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailText = TextEditingController();
  TextEditingController _passwordText = TextEditingController();
  TextEditingController _nameText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: darkBlue2,
                ),
              ),
              Expanded(
                  child: Container(
                color: white,
              ))
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 400,
              height: 500,
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.arrow_back)),
                          const SizedBox(
                            width: 60,
                          ),
                          Text(
                            "Sign Up",
                            style: GoogleFonts.roboto(
                                fontSize: 20, //chnage
                                fontWeight: FontWeight.w500,
                                color: black1),
                          ),
                        ],
                      ),
                    ),
                    SignUpWithGoogleButton(
                      txt: "Sign in Google",
                      onPressed: () {},
                    ),
                    Form(
                      child: SizedBox(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, top: 1, right: 30, bottom: 20),
                                child: TextFormField(
                                  controller: _nameText,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    hintStyle: TextStyle(
                                        decorationColor: greyish4,
                                        fontSize: 20, // chage
                                        color: greyish3),
                                    hintText: 'Enter name',
                                    contentPadding:
                                        EdgeInsets.only(left: 3), //change
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    // Split the full name into first name and last name
                                    List<String> names = value!.split(' ');
                                    String firstName = names[0];
                                    String lastName = names.length > 1
                                        ? names.sublist(1).join(' ')
                                        : '';
                                    // Now you can use firstName and lastName as needed
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, top: 1, right: 30, bottom: 20),
                                child: TextFormField(
                                  controller: _emailText,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    hintStyle: TextStyle(
                                        decorationColor: greyish4,
                                        fontSize: 20, // chage
                                        color: greyish3),
                                    hintText: 'Enter email id',

                                    contentPadding:
                                        EdgeInsets.only(left: 3), //change
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email';
                                    }
                                    if (!value.contains('@') ||
                                        !value.contains('.com')) {
                                      return 'Invalid email format';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, top: 1, right: 30, bottom: 20),
                                child: TextFormField(
                                  controller: _passwordText,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    hintStyle: TextStyle(
                                        decorationColor: greyish4,
                                        fontSize: 20, // chage
                                        color: greyish3),
                                    hintText: 'create password',
                                    contentPadding:
                                        EdgeInsets.only(left: 3), //change
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    if (value.length <= 7) {
                                      return 'Password must be greater than 7 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 30, top: 1, right: 30, bottom: 20),
                              //   child: TextFormField(
                              //     decoration: const InputDecoration(
                              //       filled: true,
                              //       fillColor: white,
                              //       border: OutlineInputBorder(
                              //         borderRadius:
                              //             BorderRadius.all(Radius.circular(5)),
                              //       ),
                              //       hintStyle: TextStyle(
                              //           decorationColor: greyish4,
                              //           fontSize: 20, // chage
                              //           color: greyish3),
                              //       hintText: 'Re-enter password',
                              //       contentPadding:
                              //           EdgeInsets.only(left: 3), //change
                              //     ),
                              //     validator: (value) {
                              //       if (value == null || value.isEmpty) {
                              //         return 'Please re-enter the password';
                              //       }
                              //       final password = // get the password value from the password field
                              //           // use the proper way to get the value based on your implementation
                              //           '';
                              //       if (value != password) {
                              //         return 'Passwords do not match';
                              //       }
                              //       return null;
                              //     },
                              //   ),
                              // ),
                              Container(
                                  width: 200,
                                  color: darkBlue2,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()),
                                        );
                                        // FirebaseAuth.instance
                                        //     .createUserWithEmailAndPassword(
                                        //         email: _emailText.text,
                                        //         password: _passwordText.text)
                                        //     .then((value) {

                                        //   // navigate to home screen
                                        // }).onError((error, stackTrace) {
                                        //   print("Error ${error.toString()}");
                                        // });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                darkBlue2), // Dark blue color
                                      ),
                                      child: const Text("Create Account"))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
