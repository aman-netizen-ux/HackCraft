import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/custom_right_panel.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/custom_side_panel.dart';

class CustomEditPortalDesktopBody extends StatefulWidget {
  const CustomEditPortalDesktopBody({super.key});

  @override
  State<CustomEditPortalDesktopBody> createState() =>
      _CustomEditPortalDesktopBodyState();
}

class _CustomEditPortalDesktopBodyState
    extends State<CustomEditPortalDesktopBody> {
  //final _formKey = GlobalKey<FormState>();
  String? textinput = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
       color: const Color(0xff313030),
      child: const Row(
        children: [
          Expanded(
              flex: 200,
              child: CustomSidePanel(
                  // formKey: _formKey,
                  // textinput: textinput,
                  )),
          Expanded(
              flex: 800,
              child: CustomRightPanel(
                  // formKey: _formKey,
                  // textinput: textinput,
                  ))
        ],
      ),
    );
  }
}
