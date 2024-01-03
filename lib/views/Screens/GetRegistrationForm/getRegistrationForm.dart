import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/GetRegistrationForm/Desktop/desktop_get_form.dart';

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            mobileBody: const GetRegistered(), //TODO: Add mobile body
            desktopBody: const GetRegistered(),
            tabletBody: const GetRegistered(), //TODO: Add tablet body
          ),
        ),
      ),
    );
  }
}
