import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/snackBar.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Registation/sendUserProfile.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Verification/pinInput.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Verification/sendOtpFunction.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Verification/verifyOtp.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';

class OTPFile extends StatefulWidget {
  const OTPFile({super.key});

  @override
  State<OTPFile> createState() => _OTPFileState();
}

class _OTPFileState extends State<OTPFile> {
  late CountdownTimer _timer;
  int _secondsRemaining = 60;
  bool _timerActive = true;
  bool otpCheck = false;
  static Future<User?> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    User? user;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar("weak-password", red2,
            const Icon(Icons.report_gmailerrorred_outlined), context);
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e as String?);
    }
    return user;
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer =
        CountdownTimer(const Duration(minutes: 1), const Duration(seconds: 1));
    _timer.listen((event) {
      if (mounted) {
        setState(() {
          _secondsRemaining = event.remaining.inSeconds;
        });
      }
      if (_secondsRemaining <= 0) {
        setState(() {
          _timerActive = false;
        });
        if (_timerActive) {
          // Check if the timer is active before canceling
          _timer.cancel();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: heightScaler(context, 84),
                          bottom: heightScaler(context, 16)),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Enter the One Time Password (OTP) which has\nbeen sent to ",
                              style: GoogleFonts.firaSans(
                                color: darkCharcoal,
                                fontSize: heightScaler(context, 16),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: loginProvider.emailId,
                              style: GoogleFonts.firaSans(
                                color: skyBlue,
                                fontSize: heightScaler(context, 16),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // child: Row(
                      //   children: [
                      //     Text(
                      //       "Enter the One Time Password (OTP) which has \nbeen sent to ",
                      //       style: GoogleFonts.firaSans(
                      //         color: darkCharcoal,
                      //         fontSize: heightScaler(context, 16),
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //      Text(
                      //       " ${loginProvider.emailId}",
                      //       style: GoogleFonts.firaSans(
                      //         color: skyBlue,
                      //         fontSize: heightScaler(context, 16),
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: heightScaler(context, 52),
                          width: widthScaler(context, 53),
                          child: PinInput(first: true, last: false),
                        ),
                        SizedBox(
                          height: heightScaler(context, 52),
                          width: widthScaler(context, 53),
                          child: PinInput(first: false, last: false),
                        ),
                        SizedBox(
                          height: heightScaler(context, 52),
                          width: widthScaler(context, 53),
                          child: PinInput(first: false, last: false),
                        ),
                        SizedBox(
                          height: heightScaler(context, 52),
                          width: widthScaler(context, 53),
                          child: PinInput(first: false, last: false),
                        ),
                        SizedBox(
                          height: heightScaler(context, 52),
                          width: widthScaler(context, 53),
                          child: PinInput(first: false, last: false),
                        ),
                        SizedBox(
                          height: heightScaler(context, 52),
                          width: widthScaler(context, 53),
                          child: PinInput(first: false, last: true),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: otpCheck,
                      child: Text(
                        "Invalid OTP. Please try again",
                        style: GoogleFonts.firaSans(
                            fontSize: heightScaler(context, 14),
                            fontWeight: FontWeight.w500,
                            color: salmonRed),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Didn't receive the Otp?  ",
                            style: GoogleFonts.firaSans(
                                fontSize: heightScaler(context, 16),
                                fontWeight: FontWeight.w500,
                                color: greyish3),
                          ),
                          //   SizedBox(width: widthScaler(context, 20)),
                          TextButton(
                            onPressed: _timerActive
                                ? null
                                : () {
                                    setState(() async {
                                      _timerActive = true;
                                      _startTimer();
                                      // Resend OTP here
                                      code = "";
                                      final otpId = await triggerResendOTP(
                                          loginProvider.emailId);

                                      loginProvider.setOtpId(otpId);
                                    });
                                  },
                            child: const Text('RESEND OTP'),
                          ),
                          Text(
                            'in $_secondsRemaining secs',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
            width: widthScaler(context, 140),
            height: heightScaler(context, 40),
            margin: EdgeInsets.symmetric(vertical: widthScaler(context, 20)),
            child: ElevatedButton(
                onPressed: () async {
                  final otpId = loginProvider.otpId;
                  print(code);
                  final status = await verifyOTP(code, otpId);
                  if (status == true) {
                    User? user = await createUserWithEmailAndPassword(
                      email: loginProvider.emailId,
                      password: loginProvider.password,
                      context: context,
                    );
                    String firebaseUUID = user!.uid;
                    sendUserPost({
                      "first_name": loginProvider.firstName,
                      "last_name": loginProvider.lastName,
                      "email": loginProvider.emailId,
                    });
                    loginProvider.setUuid(firebaseUUID);
                    loginProvider.setOtpId(0);
                    loginProvider.setCurrentIndex(2);
                  } else {
                    setState(() {
                      otpCheck = true;
                    });
                    code = "";
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff518AFA)),
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
                child: const Text(
                  "Next ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                )))
      ],
    );
  }
}
