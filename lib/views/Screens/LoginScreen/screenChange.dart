import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Verification/otp.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Verification/registration.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/signUp.dart';
import 'package:provider/provider.dart';

class ScreenChange extends StatefulWidget {
  const ScreenChange({super.key});

  @override
  State<ScreenChange> createState() => _ScreenChangeState();
}

class _ScreenChangeState extends State<ScreenChange> {
  late List<Widget> options_widget; // List to hold different screen options

  @override
  void initState() {
    // Initializing the list of screen options
    super.initState();
    options_widget = <Widget>[SignUpDetails(), OTPFile(), RegisterUser()];
  }

  @override
  Widget build(BuildContext context) {
    // Accessing the current state of LoginProvider using Provider
    final loginProvider = Provider.of<LoginProvider>(context);
    // Returning the widget based on the currentIndex from LoginProvider
    return options_widget.elementAt(loginProvider.currentIndex);
  }
}
