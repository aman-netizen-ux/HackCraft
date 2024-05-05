import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/header.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/option_expansion_tile.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/question_input_form.dart';

class RigthPanel extends StatefulWidget {
  const RigthPanel({super.key});

  @override
  State<RigthPanel> createState() => _RigthPanelState();
}

class _RigthPanelState extends State<RigthPanel> {
  bool isExpanded = false;
  TextEditingController ansController = TextEditingController();
  List<String> options = ["Option 1", "Option 2", "Option 3"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const QuestionInputForm(),
            Container(
              margin: EdgeInsets.only(
                  top: scaleHeight(context, 14),
                  left: scaleWidth(context, 13),
                  right: scaleWidth(context, 13)),
              color: const Color(0xffeaeaea),
              // height: 350,
              child: Column(
                children: [
                  SizedBox(
                    height: scaleHeight(context, 10),
                  ),
                  for (int i = 0; i < options.length; i++)
                    OptionExpansionTile(title: options[i]),
                  InkWell(
                    onTap: () {
                      setState(() {
                        options.add("Option ${options.length}");
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          vertical: scaleHeight(context, 20),
                          horizontal: scaleWidth(context, 15)),
                      height: scaleHeight(context, 41),
                      decoration: BoxDecoration(
                        color: Color(0xffBFBEBE),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("Add Option",
                          style: GoogleFonts.getFont(fontFamily1,
                              color: darkCharcoal,
                              fontSize: scaleHeight(context, 12),
                              fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
