import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/Desktop/dashboard_desktop_body.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff44A6BB).withOpacity(0.4),
        body: ResponsiveLayout(
          mobileBody: const DashboardDesktopBody(), //TODO: Add mobile body
          desktopBody: const DashboardDesktopBody(),
          tabletBody: const DashboardDesktopBody(), //TODO: Add tablet body
        ),
      ),
    );
  }
}
