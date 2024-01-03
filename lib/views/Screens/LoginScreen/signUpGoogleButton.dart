import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';

class SignUpWithGoogleButton extends StatelessWidget {
  var onPressed;
  String txt;
  SignUpWithGoogleButton({
    required this.onPressed,
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20, left: 25),
        width: MediaQuery.of(context).size.width * 0.118,
        height: screenHeight * 0.060,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: black1,
            width: 1,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: const Color.fromARGB(255, 26, 26, 26)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: screenHeight * 0.063,
                  width: 25,
                  child: const Image(
                    image: AssetImage("assets/icons/googleIcon.png"),
                  )),
              const SizedBox(
                width: 15,
              ),
              Text(
                txt,
                style: GoogleFonts.montserrat(
                    fontSize: screenHeight * 0.019,
                    fontWeight: FontWeight.w600,
                    color: white),
              ),
            ],
          ),
        ));
  }
}
