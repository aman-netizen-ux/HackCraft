import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/desktop_mainNavigation.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  ResponsiveLayout(
            mobileBody: const DesktopMainNavigation(), //TODO: Add mobile body
            desktopBody: const DesktopMainNavigation(),
            tabletBody: const DesktopMainNavigation(),  //TODO: Add tablet body
          ),
        
      ),
    );
  }
}

//This MainNavigation will get linked to getstarteted after login
// this consist of DesktopMainNavigation for desktop 
// DesktopMainNavigation this will have logic for navbar navigation and will call widget acc to the section


// for mobile and desktop create TabMainNavigation and MobileMainNavigation, add the logic and if any section is same 
// or just if else difference then create a folder common section tranfer that section to there and use in common ones 
// otherwise use layout wise
