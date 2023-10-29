import 'package:flutter/material.dart';
// import 'package:major_project__widget_testing/views/RedundantFiles/Navigation.dart';
// import 'package:major_project__widget_testing/views/RedundantFiles/widget.dart';
// import 'package:major_project__widget_testing/views/RedundantFiles/edit.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/default_template.dart';
import 'package:major_project__widget_testing/views/Screens/Host/host.dart';
import 'package:major_project__widget_testing/views/Screens/TempelateSelection/tempelate_selection.dart';

class AppRoutes{
static const String start = '/';
static const String templateSelection = '/templateSelection';
static const String defaultTemplate = '/defaultTemplate';




static Map<String, Widget Function(BuildContext)> routes = {
// start: (context) =>  Navigation(),
start: (context) => const Host(),
templateSelection: (context) => const TemplateSelection(),
defaultTemplate: (context) => const DefaultTemplate(),




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