import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/contactUsAndFooter_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/aboutUs_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/gallerySection.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/landing_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/rounds_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/navbar.dart';

class DefaultTemplateDesktopBody extends StatefulWidget {
  const DefaultTemplateDesktopBody(
      {super.key, required this.defaultTemplateModel, required this.isEdit});
  final DefaultTemplateApiResponse? defaultTemplateModel;
  final bool isEdit;

  @override
  State<DefaultTemplateDesktopBody> createState() =>
      _DefaultTemplateDesktopBodyState();
}

class _DefaultTemplateDesktopBodyState
    extends State<DefaultTemplateDesktopBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBar(defaultTemplateModel: widget.defaultTemplateModel),
        LandingSection(defaultTemplateModel: widget.defaultTemplateModel),
        RoundsAndRules(defaultTemplateModel: widget.defaultTemplateModel),
        Aboutus(
          defaultTemplateModel: widget.defaultTemplateModel,
          isEdit: widget.isEdit,
        ),
        GallerySection(),
        ContactUsAndFooterSection(
            defaultTemplateModel: widget.defaultTemplateModel)
      ],
    );
  }
}
