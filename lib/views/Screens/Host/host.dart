import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/Host/Desktop/desktop_host.dart';

class Host extends StatelessWidget {
  const Host({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  ResponsiveLayout(
            mobileBody: const HostDesktopBody(), //TODO: Add mobile body
            desktopBody: const HostDesktopBody(),
            tabletBody: const HostDesktopBody(),  //TODO: Add tablet body
          ),
        
      ),
    );
  }
}
