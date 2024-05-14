import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/GetRegistrationForm/Desktop/desktop_get_form.dart';
import 'package:major_project__widget_testing/views/Screens/GetRegistrationForm/Desktop/desktop_get_registeration_form.dart';

class GetRegistrationForm extends StatefulWidget {
  const GetRegistrationForm({
    super.key,
  });

  @override
  State<GetRegistrationForm> createState() => _GetRegistrationFormState();
}

class _GetRegistrationFormState extends State<GetRegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEDECF2),
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            mobileBody: const DesktopGetRegisterationForm(), //TODO: Add mobile body
            desktopBody: const DesktopGetRegisterationForm(),
            tabletBody: const DesktopGetRegisterationForm(), //TODO: Add tablet body
          ),
        ),
      ),
    );
  }
}
