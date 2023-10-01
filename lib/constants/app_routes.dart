import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/RedundantFiles/Navigation.dart';
import 'package:major_project__widget_testing/views/RedundantFiles/widget.dart';
import 'package:major_project__widget_testing/views/RedundantFiles/edit.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/default_template.dart';

class AppRoutes{
static const String start = '/';



static Map<String, Widget Function(BuildContext)> routes = {
// start: (context) =>  Navigation(),
start: (context) => const DefaultTemplate(),


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