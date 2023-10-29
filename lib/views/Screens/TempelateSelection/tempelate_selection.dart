import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/TempelateSelection/Desktop/desktop_tempelate_selection.dart';

class TemplateSelection extends StatelessWidget {
  const TemplateSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  ResponsiveLayout(
            mobileBody: const TemplateSelectionBody(), //TODO: Add mobile body
            desktopBody: const TemplateSelectionBody(),
            tabletBody: const TemplateSelectionBody(),  //TODO: Add tablet body
          ),
        
      ),
    );
  }
}
