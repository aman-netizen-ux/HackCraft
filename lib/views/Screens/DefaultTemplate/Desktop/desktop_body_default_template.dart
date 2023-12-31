import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/contactUsAndFooter_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/aboutUs_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/gallerySection.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/landing_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/rounds_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/navbar.dart';


class DefaultTemplateDesktopBody extends StatefulWidget {
  const DefaultTemplateDesktopBody({super.key, required this.defaultTemplateModel});
  final DefaultTemplateApiResponse? defaultTemplateModel;

  @override
  State<DefaultTemplateDesktopBody> createState() => _DefaultTemplateDesktopBodyState();
}

class _DefaultTemplateDesktopBodyState extends State<DefaultTemplateDesktopBody> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        NavBar(defaultTemplateModel: widget.defaultTemplateModel),
        LandingSection(defaultTemplateModel: widget.defaultTemplateModel),
        // RoundsAndRules(),
        Aboutus(defaultTemplateModel: widget.defaultTemplateModel),
        GallerySection(),
        ContactUsAndFooterSection(defaultTemplateModel: widget.defaultTemplateModel)
      ],
    );
  }
}