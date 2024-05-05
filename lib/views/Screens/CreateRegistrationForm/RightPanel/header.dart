import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/customToggle.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: scaleHeight(context, 9),
          right: scaleWidth(context, 12),
          left: scaleWidth(context, 12)),
      color: const Color(0xffeaeaea),
      child: Column(
        children: [
          SizedBox(
            height: scaleHeight(context, 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: scaleWidth(context, 20),
                        left: scaleWidth(context, 10)),
                    height: scaleHeight(context, 24),
                    width: scaleHeight(context, 24),
                    color: lightSilver,
                  ),
                  Text(
                    "Mutiple choice",
                    style: GoogleFonts.firaSans(
                        fontSize: scaleHeight(context, 18),
                        color: darkCharcoal,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomToggle(),
                  Container(
                    height: scaleHeight(context, 34),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: scaleWidth(context, 8),
                        right: scaleWidth(context, 14)),
                    width: scaleHeight(context, 34),
                    color: lightSilver,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete,
                        size: 18,
                        color: white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: scaleHeight(context, 12),
          ),
          SizedBox(
            height: scaleHeight(context, 40),
            width: scaleWidth(context, 289),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: scaleHeight(context, 10)),
                decoration: BoxDecoration(
                    color: lightSilver, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Save",
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontWeight: FontWeight.w400,
                    color: darkCharcoal,
                    fontSize: scaleHeight(context, 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
