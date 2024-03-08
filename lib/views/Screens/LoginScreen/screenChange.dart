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
  late List<Widget> options_widget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    options_widget = <Widget>[SignUpDetails(), OTPFile(), RegisterUser()];
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return options_widget.elementAt(loginProvider.currentIndex);
  }
}
