import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/desktop_body_default_template.dart';

class DefaultTemplate extends StatefulWidget {
  const DefaultTemplate(
      {super.key, required this.defaultTemplateModel, required this.isEdit});
  final DefaultTemplateApiResponse? defaultTemplateModel;
  final bool isEdit;
  @override
  State<DefaultTemplate> createState() => _DefaultTemplateState();
}

class _DefaultTemplateState extends State<DefaultTemplate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            mobileBody: DefaultTemplateDesktopBody(
                defaultTemplateModel: widget.defaultTemplateModel,
                isEdit: widget.isEdit), //TODO: Add mobile body
            desktopBody: DefaultTemplateDesktopBody(
                defaultTemplateModel: widget.defaultTemplateModel,
                isEdit: widget.isEdit),
            tabletBody: DefaultTemplateDesktopBody(
                defaultTemplateModel: widget.defaultTemplateModel,
                isEdit: widget.isEdit), //TODO: Add tablet body
          ),
        ),
      ),
    );
  }
}
