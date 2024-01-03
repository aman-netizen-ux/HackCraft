import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:major_project__widget_testing/Constants/app_routes.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistration.dart';
import 'package:major_project__widget_testing/state/galleryProvider.dart';
import 'package:major_project__widget_testing/state/getAllHackathons/getAllHackathonsProvider.dart';
import 'package:major_project__widget_testing/state/getHackathon/getSingleHackathonProvider.dart';
import 'package:major_project__widget_testing/state/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/hostNavigationProvider.dart';
import 'package:major_project__widget_testing/state/mainNavigationProvider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/state/templateSelectionprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainNavigationProvider()),
        ChangeNotifierProvider(create: (context) => HostNavigationProvider()),
        ChangeNotifierProvider(
            create: (context) => TemplateSelectionProvider()),
        ChangeNotifierProvider(create: (context) => RulesProvider()),
        ChangeNotifierProvider(create: (context) => GalleryProvider()),
        ChangeNotifierProvider(create: (context) => HackathonDetailsProvider()),
        ChangeNotifierProvider(create: (context) => AllHackathonProvider()),
        ChangeNotifierProvider(create: (context) => SingleHackathonProvider()),
        ChangeNotifierProvider(
            create: (context) => GetRegistrationFormProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}
