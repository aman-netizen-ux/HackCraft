import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/contactUsAndFooter_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/aboutUs_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/gallerySection.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/landing_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/rounds_section.dart';


class DefaultTemplateDesktopBody extends StatefulWidget {
  const DefaultTemplateDesktopBody({super.key});

  @override
  State<DefaultTemplateDesktopBody> createState() => _DefaultTemplateDesktopBodyState();
}

class _DefaultTemplateDesktopBodyState extends State<DefaultTemplateDesktopBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LandingSection(),
        RoundsAndRules(),
        Aboutus(),
        GallerySection(),
        ContactUsAndFooterSection()
      ],
    );
  }
}