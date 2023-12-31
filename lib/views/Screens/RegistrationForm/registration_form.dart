import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/RegistrationForm/Desktop/desktop_registration_form.dart';
import 'package:major_project__widget_testing/views/Screens/RegistrationForm/getForm.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            mobileBody: RegistrationFormDesktopBody(), //TODO: Add mobile body
            desktopBody: GetRegistered(),
            tabletBody: RegistrationFormDesktopBody(), //TODO: Add tablet body
          ),
        ),
      ),
    );
  }
}
