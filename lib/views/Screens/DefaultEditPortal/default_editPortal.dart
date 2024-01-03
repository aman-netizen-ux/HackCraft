import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/desktop_default_editPortal.dart';

class DefaultEditPortal extends StatefulWidget {
  const DefaultEditPortal({super.key});

  @override
  State<DefaultEditPortal> createState() => _DefaultEditPortalState();
}

class _DefaultEditPortalState extends State<DefaultEditPortal> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: grey3,
        body: ResponsiveLayout(
          mobileBody: const DefaultEditPortalDesktopBody(), //TODO: Add mobile body
          desktopBody: const DefaultEditPortalDesktopBody(),
          tabletBody: const DefaultEditPortalDesktopBody(),  //TODO: Add tablet body
        ),
      ),
    );
  }
}