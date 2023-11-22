import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/ContactSponsors/Desktop/desktop_contact_sponsors.dart';

class ContactSponsors extends StatefulWidget {
  const ContactSponsors({super.key});

  @override
  State<ContactSponsors> createState() => _ContactSponsorsState();
}

class _ContactSponsorsState extends State<ContactSponsors> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            mobileBody: const ContactSponsorsDesktopBody(), //TODO: Add mobile body
            desktopBody: const ContactSponsorsDesktopBody(),
            tabletBody: const ContactSponsorsDesktopBody(),  //TODO: Add tablet body
          ),
        ),
      ),
    );
  }
}