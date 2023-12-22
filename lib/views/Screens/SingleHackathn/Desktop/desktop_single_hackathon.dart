import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/contactUsAndFooter.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/aboutUs_section.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/gallerySection.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/landing_section.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/RoundsSection/rounds_section.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/navbar.dart';


class SingleHackathonDesktopBody extends StatefulWidget {
  const SingleHackathonDesktopBody({super.key});

  @override
  State<SingleHackathonDesktopBody> createState() => _SingleHackathonDesktopBodyState();
}

class _SingleHackathonDesktopBodyState extends State<SingleHackathonDesktopBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NavBar(),
        LandingSection(),
        RoundsAndRules(),
        Aboutus(),
        GallerySection(),
        ContactUsAndFooterSection()
      ],
    );
  }
}