import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/desktop_registration_form.dart';
import 'package:major_project__widget_testing/views/Screens/GetRegistrationForm/Desktop/desktop_get_form.dart';

class RegistrationForm extends StatefulWidget {
  final String hackathonId;
  const RegistrationForm({super.key, required this.hackathonId});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveLayout(
          mobileBody: RegistrationFormDesktopBody(
              hackathonId: widget.hackathonId), //TODO: Add mobile body
          desktopBody:
              RegistrationFormDesktopBody(hackathonId: widget.hackathonId),
          tabletBody: RegistrationFormDesktopBody(
              hackathonId: widget.hackathonId), //TODO: Add tablet body
        ),
      ),
    );
  }
}
