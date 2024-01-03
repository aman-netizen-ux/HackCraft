import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/desktop_single_hackathon.dart';

class SingleHackathon extends StatefulWidget {
  const SingleHackathon({super.key});

  @override
  State<SingleHackathon> createState() => _SingleHackathonState();
}

class _SingleHackathonState extends State<SingleHackathon> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            mobileBody: const SingleHackathonDesktopBody(), //TODO: Add mobile body
            desktopBody: const SingleHackathonDesktopBody(),
            tabletBody: const SingleHackathonDesktopBody(),  //TODO: Add tablet body
          ),
        ),
      ),
    );
  }
}