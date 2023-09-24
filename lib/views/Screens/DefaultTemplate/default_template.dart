import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/desktop_body_default_template.dart';

class DefaultTemplate extends StatefulWidget {
  const DefaultTemplate({super.key});

  @override
  State<DefaultTemplate> createState() => _DefaultTemplateState();
}

class _DefaultTemplateState extends State<DefaultTemplate> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            mobileBody: const DefaultTemplateDesktopBody(), //TODO: Add mobile body
            desktopBody: const DefaultTemplateDesktopBody(),
            tabletBody: const DefaultTemplateDesktopBody(),  //TODO: Add tablet body
          ),
        ),
      ),
    );
  }
}