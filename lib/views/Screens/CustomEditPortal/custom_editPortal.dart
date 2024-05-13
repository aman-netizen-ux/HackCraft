import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/desktop_custom_editPortal.dart';

class CustomEditPortal extends StatefulWidget {
  const CustomEditPortal({super.key});

  @override
  State<CustomEditPortal> createState() => _CustomEditPortalState();
}

class _CustomEditPortalState extends State<CustomEditPortal> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveLayout(
          mobileBody: const CustomEditPortalDesktopBody(), //TODO: Add mobile body
          desktopBody: const CustomEditPortalDesktopBody(),
          tabletBody: const CustomEditPortalDesktopBody(),  //TODO: Add tablet body
        ),
      ),
    );
  }
}