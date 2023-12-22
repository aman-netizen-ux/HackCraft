import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/HostNavigation/Desktop/desktop_hostNavigation.dart';

class HostNavigation extends StatelessWidget {
  const HostNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  ResponsiveLayout(
            mobileBody: const DesktopHostNavigation(), //TODO: Add mobile body
            desktopBody: const DesktopHostNavigation(),
            tabletBody: const DesktopHostNavigation(),  //TODO: Add tablet body
          ),
        
      ),
    );
  }
}


