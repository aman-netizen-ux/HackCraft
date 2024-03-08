import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Verification/pinInput.dart';
import 'package:provider/provider.dart';

class OTPFile extends StatefulWidget {
  const OTPFile({super.key});

  @override
  State<OTPFile> createState() => _OTPFileState();
}

class _OTPFileState extends State<OTPFile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: heightScaler(context, 24)),
          child: SizedBox(
            width: widthScaler(context, 502),
            height: heightScaler(context, 292),
            child: Card(
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
                      child: Text(
                        "Enter the One Time Password (OTP) which has \nbeen sent to hackcrfat661@gmail.com ",
                        style: GoogleFonts.firaSans(
                          color: darkCharcoal,
                          fontSize: heightScaler(context, 16),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: heightScaler(context, 78),
                          width: widthScaler(context, 53),
                          child: PinInput(first: true, last: false),
                        ),
                        SizedBox(
                         height: heightScaler(context, 78),
                          width: widthScaler(context, 53),
                          child: PinInput(first: false, last: false),
                        ),
                        SizedBox(
                         height: heightScaler(context, 78),
                          width: widthScaler(context, 53),
                          child: PinInput(first: false, last: false),
                        ),
                        SizedBox(
                         height: heightScaler(context, 78),
                          width: widthScaler(context, 53),
                          child: PinInput(first: false, last: true),
                        ),
                      ],
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
                 
                  final loginProvider =
                      Provider.of<LoginProvider>(context, listen: false);
                  loginProvider.setCurrentIndex(2);
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )))
      ],
    );
  }
}
