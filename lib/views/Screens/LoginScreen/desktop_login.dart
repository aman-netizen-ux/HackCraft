import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/sample.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/signUp.dart';

class LoginPageDesktop extends StatefulWidget {
  const LoginPageDesktop({super.key});

  @override
  State<LoginPageDesktop> createState() => _LoginPageDesktopState();
}

class _LoginPageDesktopState extends State<LoginPageDesktop> {
  bool isError = false;
  bool passwordVisible = true;
  late String email;
  late String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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
              width: 300,
              height: 350,
              child: Card(
                elevation: 20,
                // color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: darkBlue2,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: SizedBox(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, top: 1, right: 30), //change
                                  child: TextFormField(
                                    //  autofocus: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: white,
                                      hintStyle: TextStyle(
                                          decorationColor: greyish4,
                                          fontSize: 20, // chage
                                          color: greyish3),
                                      hintText: 'Email Address',
                                      contentPadding:
                                          EdgeInsets.only(left: 3), //change
                                    ),
                                    validator: (value) {
                                      if (value.toString().isEmpty) {
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Enter your email id";
                                      }
                                      if (!value.toString().contains('@')) {
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Invalid Email Id";
                                      }
                                      setState(() {
                                        isError = false;
                                      });
                                      return null;
                                    },
                                    onSaved: (value) {
                                      email = value.toString();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, top: 1, right: 30), //chnage
                                  child: TextFormField(
                                    obscureText: passwordVisible,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: white,
                                      hintStyle: GoogleFonts.roboto(
                                          fontSize: 20, //chnage
                                          fontWeight: FontWeight.w500,
                                          color: greyish3),
                                      hintText: 'Password',
                                      contentPadding:
                                          const EdgeInsets.only(left: 3),
                                      suffixIcon: IconButton(
                                        color: greyish4,
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.toString().isEmpty) {
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Enter password";
                                      }
                                      if (value.toString().length < 6) {
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Password length should be greater/equal to 6 ";
                                      }
                                      setState(() {
                                        isError = false;
                                      });
                                      return null;
                                    },
                                    onSaved: (value) {
                                      password = value.toString();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Container(
                                //   padding: const EdgeInsets.only(
                                //       left: 140, right: 100),
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //           child: Container(
                                //         height: 1,
                                //         color: greyish6,
                                //       )),
                                //       SizedBox(
                                //         width: 25,
                                //       ),
                                //       SizedBox(
                                //         width: 25,
                                //       ),
                                //       Expanded(
                                //           child: Container(
                                //         height: 1,
                                //         color: greyish6,
                                //       )),
                                //     ],
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 200,
                                        color: darkBlue2,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Home()),
                                              );
                                              // FirebaseAuth.instance
                                              //     .signInWithEmailAndPassword(
                                              //         email: email,
                                              //         password: password)
                                              //     .then((value) {

                                              //   // navigate to home screen

                                              // }).onError((error, stackTrace) {
                                              //   print(
                                              //       "Error ${error.toString()}");
                                              // });
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      darkBlue2), // Dark blue color
                                            ),
                                            child: const Text("Login"))),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Don't have account? ",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16, //chnage
                                                fontWeight: FontWeight.w500,
                                                color: greyish3),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SignUp()),
                                                );
                                              },
                                              child: const Text("SignUp")),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
