import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/customTemplateModel/customTemplateModel.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/CustomTemplate/Desktop/desktop_body_custom_template.dart';

class CustomTemplate extends StatefulWidget {
  const CustomTemplate(
      {super.key, required this.isEdit});
  
  final bool isEdit;
  @override
  State<CustomTemplate> createState() => _CustomTemplateState();
}

class _CustomTemplateState extends State<CustomTemplate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveLayout(
          mobileBody: CustomTemplateDesktopBody(
              
              isEdit: widget.isEdit), //TODO: Add mobile body
          desktopBody: CustomTemplateDesktopBody(
             
              isEdit: widget.isEdit),
          tabletBody: CustomTemplateDesktopBody(
              
              isEdit: widget.isEdit), //TODO: Add tablet body
        ),
      ),
    );
  }
}
