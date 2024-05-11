import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/snackBar.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/SignIn/githubSignIn.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/desktop_login.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/registerCheck.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/screenChange.dart';
import 'package:provider/provider.dart';
import 'googleSignIn.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isError = false;
  bool passwordVisible = true;
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Function to handle sign-in using email and password
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handling errors during sign-in

      if (e.code == " user-not found") {
        showSnackBar(
            "No user found on that email",
            red2,
            const Icon(
              Icons.report_gmailerrorred_outlined,
              color: white,
            ),
            // ignore: use_build_context_synchronously
            context);
        debugPrint("No user found on that email");
      } else if (e.code == "invalid-credential") {
        showSnackBar(
            "Invalid Credentials",
            red2,
            const Icon(
              Icons.report_gmailerrorred_outlined,
              color: white,
            ),
            // ignore: use_build_context_synchronously
            context);
        debugPrint("Invalid Credentials");
      } else {
        showSnackBar(
            "Invalid ",
            red2,
            const Icon(
              Icons.report_gmailerrorred_outlined,
              color: white,
            ),
            // ignore: use_build_context_synchronously
            context);
        debugPrint("Invalid ");
      }
    }
    return user;
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: heightScaler(context, 24)),
          child: SizedBox(
            width: widthScaler(context, 502),
            height: heightScaler(context, 292),
            child: Card(
              surfaceTintColor: Colors.transparent,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widthScaler(context, 36)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title for the sign-in card
                    Padding(
                      padding: EdgeInsets.only(
                          top: heightScaler(context, 18),
                          bottom: heightScaler(context, 16)),
                      child: Text(
                        "Log in your Account",
                        style: GoogleFonts.firaSans(
                            color: darkCharcoal,
                            fontSize: heightScaler(context, 18),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: heightScaler(context, 35),
                          width: widthScaler(context, 130),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Handling Google sign-in
                              UserCredential userCredential =
                                  await handleGoogleSignIn();
                              User? user = userCredential.user;
                              if (user != null) {
                                String firebaseUUID = user.uid;
                                String _email = user.email!;
                                loginProvider.setUuid(firebaseUUID);
                                final status = await registerCheck(_email);
                                if (status) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(
                                    context,
                                    '/mainNavigation',
                                  );
                                } else {
                                  loginProvider.setCurrentIndex(2);
                                  tabController.animateTo(1);
                                }
                              } else {
                                // Handle sign-in failure
                                debugPrint(
                                  'No user found for this Gmail.',
                                );
                                // ignore: use_build_context_synchronously
                                showSnackBar(
                                    "No user found for this Gmail.",
                                    red2,
                                    const Icon(
                                        Icons.report_gmailerrorred_outlined),
                                    context);
                                FirebaseAuth.instance.signOut();
                                user!.delete();
                              }
                            },

                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                color: Colors.black,
                                width: 1,
                              )),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            // Sign-in buttons for Google and GitHub
                            child: Row(
                              children: [
                                // Google sign-in button
                                Image.asset(
                                  'assets/images/login/google 1.png',
                                  height: heightScaler(context, 17),
                                  width: widthScaler(context, 17),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: widthScaler(context, 8)),
                                  child: Text(
                                    "Google",
                                    style: GoogleFonts.firaSans(
                                        fontSize: heightScaler(context, 16),
                                        color: salmonRed,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: widthScaler(context, 10)),
                        SizedBox(
                          height: heightScaler(context, 35),
                          width: widthScaler(context, 130),
                          child: ElevatedButton(
                            // Handling GitHub sign-in
                            onPressed: () async {
                              UserCredential userCredential =
                                  await signInWithGitHub();
                              User? user = userCredential.user;
                              if (user != null) {
                                String firebaseUUID = user.uid;
                                String _email = user.email!;
                                loginProvider.setUuid(firebaseUUID);
                                final status = await registerCheck(_email);
                                if (status) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(
                                    context,
                                    '/mainNavigation',
                                  );
                                } else {
                                  // moves on to register screen

                                  loginProvider.setCurrentIndex(2);
                                  tabController.animateTo(1);
                                }
                              } else {
                                // Handle sign-in failure
                                // ignore: use_build_context_synchronously
                                showSnackBar(
                                    "No user found for this Gmail.",
                                    red2,
                                    const Icon(
                                        Icons.report_gmailerrorred_outlined),
                                    context);
                                FirebaseAuth.instance.signOut();
                                user!.delete();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                color: Colors.black,
                                width: 1,
                              )),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/login/git.png',
                                  height: heightScaler(context, 17),
                                  width: widthScaler(context, 17),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: widthScaler(context, 8)),
                                  child: Text(
                                    "GitHub",
                                    style: GoogleFonts.firaSans(
                                        fontSize: heightScaler(context, 16),
                                        color: darkCharcoal,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: heightScaler(context, 10)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: heightScaler(context, 1),
                            color: const Color(0xffadadad),
                          )),
                          SizedBox(
                            width: widthScaler(context, 16),
                          ),
                          Text(
                            "Or Sign in with Email",
                            style: GoogleFonts.capriola(
                              decoration: TextDecoration.none,
                              fontSize: heightScaler(context, 12),
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffadadad),
                            ),
                          ),
                          SizedBox(
                            width: widthScaler(context, 16),
                          ),
                          Expanded(
                              child: Container(
                            height: heightScaler(context, 1),
                            color: const Color(0xffadadad),
                          )),
                        ],
                      ),
                    ),
                    // Email and password input fields
                    Form(
                        key: _formKey,
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: heightScaler(context, 5),
                                ),
                                child: SizedBox(
                                  height: heightScaler(context, 40),
                                  child: TextFormField(
                                    controller: _emailText,
                                    cursorColor: darkCharcoal,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: white,
                                      hintText: 'Email Address',
                                      hintStyle: GoogleFonts.firaSans(
                                        fontSize: heightScaler(context, 16),
                                        fontWeight: FontWeight.w500,
                                        color: concreteGrey,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: darkCharcoal,
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          left: widthScaler(context, 15)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: heightScaler(context, 17),
                                ),
                                child: SizedBox(
                                  height: heightScaler(context, 40),
                                  child: TextFormField(
                                    controller: _passwordText,
                                    cursorColor: darkCharcoal,
                                    obscureText: passwordVisible,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: darkCharcoal,
                                          width: 1,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: white,
                                      hintStyle: GoogleFonts.firaSans(
                                        fontSize: heightScaler(context, 16),
                                        fontWeight: FontWeight.w500,
                                        color: concreteGrey,
                                      ),
                                      hintText: 'Password',
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
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
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: darkCharcoal,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: heightScaler(context, 5)),
                                  child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Forget password ? ",
                                        style: GoogleFonts.capriola(
                                            color: darkCharcoal,
                                            fontSize: heightScaler(context, 12),
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Sign-in button
        Padding(
          padding: EdgeInsets.symmetric(vertical: heightScaler(context, 15)),
          child: SizedBox(
              width: heightScaler(context, 140),
              height: widthScaler(context, 40),
              child: ElevatedButton(
                  onPressed: () async {
                    // Handling sign-in with email and password
                    String email = _emailText.text;
                    String password = _passwordText.text;
                    if (email.isEmpty) {
                      showSnackBar(
                          'Enter your Email-id',
                          red2,
                          const Icon(
                            Icons.warning,
                            color: white,
                          ),
                          context);
                    } else if (password.isEmpty) {
                      showSnackBar(
                          'Enter your Password',
                          red2,
                          const Icon(
                            Icons.warning,
                            color: white,
                          ),
                          context);
                    } else if (!isEmailValid(email)) {
                      showSnackBar('Invalid  Email-Id', red2,
                          const Icon(Icons.warning, color: white), context);
                    } else {
                      _formKey.currentState?.save();
                      User? user = await loginUsingEmailPassword(
                        email: _emailText.text,
                        password: _passwordText.text,
                        context: context,
                      );
                      if (user != null) {
                        String firebaseUUID = user.uid;
                        loginProvider.setUuid(firebaseUUID);
                        final status = await registerCheck(email);
                        if (status) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(
                            context,
                            '/mainNavigation',
                          );
                        } else {
                          //moves to register screen
                          loginProvider.setCurrentIndex(2);
                          tabController.animateTo(1);
                        }
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff518AFA)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.zero),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(160, 50)),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: heightScaler(context, 18),
                        fontWeight: FontWeight.w500),
                  ))),
        ),
      ],
    );
  }
}
