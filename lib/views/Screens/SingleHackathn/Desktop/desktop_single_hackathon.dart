import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/state/getHackathon/getSingleHackathonProvider.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/contactUsAndFooter.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/aboutUs_section.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/gallerySection.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/landing_section.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/RoundsSection/rounds_section.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/Desktop/Sections/navbar.dart';
import 'package:provider/provider.dart';

class SingleHackathonDesktopBody extends StatefulWidget {
  const SingleHackathonDesktopBody({super.key});

  @override
  State<SingleHackathonDesktopBody> createState() =>
      _SingleHackathonDesktopBodyState();
}

class _SingleHackathonDesktopBodyState
    extends State<SingleHackathonDesktopBody> {
        bool showLoadingSvg = true;

  @override
  Widget build(BuildContext context) {
    final singleHackathonProvider =
        Provider.of<SingleHackathonProvider>(context);
    
    if (singleHackathonProvider.isLoading && showLoadingSvg) {
      // If still loading, show the SVG
      return Center(child: SvgPicture.asset('assets/icons/defaultEditPortal/loading.svg'));
    } else if (!singleHackathonProvider.isLoading && showLoadingSvg) {
      // Loading just finished, wait for an extra 10 seconds
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          showLoadingSvg = false;
        });
      });
      return Center(child: SvgPicture.asset('assets/icons/defaultEditPortal/loading.svg'));
    } else {
    
    
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
}
