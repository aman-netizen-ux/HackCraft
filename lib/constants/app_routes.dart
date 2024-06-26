// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/ContactSponsors/contact_sponsors.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/custom_editPortal.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/dashboard.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/default_editPortal.dart';

import 'package:major_project__widget_testing/views/Screens/GetRegistrationForm/getRegistrationForm.dart';
import 'package:major_project__widget_testing/views/Screens/HostNavigation/hostNavigation.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/desktop_login.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/profile.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/mainNavigation.dart';
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
  static const String mainNavigation = '/mainNavigation';
   static const String dashboard = '/dashboard';

  static Map<String, Widget Function(BuildContext)> routes = {
    //TODO: NEED TO CHANGE THE STARTING APP ROUTE 
    //start: (context) => const CustomEditPortal(),
    
    start: (context) => LoginPageDesktop(),
  //start: (context) =>  RegistrationForm(hackathonId: "8611fbbe-44b5-481f-8f60-4fb99fd366f8"),
    // start: (context) =>  RegisterUser(),
    mainNavigation: (context) => const MainNavigation(),
    hostNavigation: (context) => const HostNavigation(),
    templateSelection: (context) => const TemplateSelection(),
    contactSponsors: (context) => const ContactSponsors(),
// defaultTemplate: (context) => const DefaultTemplate(),
    customEditPortal: (context) => const CustomEditPortal(),
    defaultEditPortal: (context) => const DefaultEditPortal(),
    profile: (context) => const Profile(),
    dashboard: (context) => const Dashboard(),
    getRegistration: (context) => const GetRegistrationForm(),
  };
}

// id= 861cbcfd-6e0f-419d-8581-8202bb638d0c

// static const String otp = '/otp';
// otp: (context) {
//       final completePhoneNumber =
//           ModalRoute.of(context)!.settings.arguments as String;
//       return Otp(completePhoneNumber: completePhoneNumber);
//     },



// static const String terms = '/terms';
// terms: (context) => const TermsPolicies(),