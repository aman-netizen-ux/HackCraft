import 'dart:js';

import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/ContactSponsors/contact_sponsors.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/custom_editPortal.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/default_editPortal.dart';
// import 'package:major_project__widget_testing/views/RedundantFiles/Navigation.dart';
// import 'package:major_project__widget_testing/views/RedundantFiles/widget.dart';
// import 'package:major_project__widget_testing/views/RedundantFiles/edit.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/default_template.dart';
import 'package:major_project__widget_testing/views/Screens/GetRegistrationForm/getRegistrationForm.dart';
import 'package:major_project__widget_testing/views/Screens/HostNavigation/hostNavigation.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/login.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/profile.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/mainNavigation.dart';
import 'package:major_project__widget_testing/views/Screens/SingleHackathn/single_hackathon.dart';
import 'package:major_project__widget_testing/views/Screens/TempelateSelection/tempelate_selection.dart';

class AppRoutes {
  static const String start = '/';
  static const String hostNavigation = '/hostNavigation';
  static const String singleHackathon = '/singleHackathon';
  static const String templateSelection = '/templateSelection';
  static const String contactSponsors = '/contactSponsors';
// static const String defaultTemplate = '/defaultTemplate';
  static const String customEditPortal = '/customEditPortal';
  static const String defaultEditPortal = '/defaultEditPortal';
  static const String profile = '/profile';
  static const String getRegistration = '/getRegistration';

  static Map<String, Widget Function(BuildContext)> routes = {
// start: (context) =>  Navigation(),
    start: (context) => const MainNavigation(),
    hostNavigation: (context) => const HostNavigation(),
    singleHackathon: (context) => const SingleHackathon(),
    templateSelection: (context) => const TemplateSelection(),
    contactSponsors: (context) => const ContactSponsors(),
// defaultTemplate: (context) => const DefaultTemplate(),
    customEditPortal: (context) => const CustomEditPortal(),
    defaultEditPortal: (context) => const DefaultEditPortal(),
    profile: (context) => const Profile(),
    getRegistration: (context) => GetRegistrationForm(),
  };
}

// static const String otp = '/otp';
// otp: (context) {
//       final completePhoneNumber =
//           ModalRoute.of(context)!.settings.arguments as String;
//       return Otp(completePhoneNumber: completePhoneNumber);
//     },



// static const String terms = '/terms';
// terms: (context) => const TermsPolicies(),