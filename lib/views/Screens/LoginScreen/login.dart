import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/desktop_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveLayout(
          mobileBody: const LoginPageDesktop(), //TODO: Add mobile body
          desktopBody: const LoginPageDesktop(),
          tabletBody: const LoginPageDesktop(), //TODO: Add tablet body
        ),
      ),
    );
  }
}
