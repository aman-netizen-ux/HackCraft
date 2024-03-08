import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:major_project__widget_testing/constants/app_routes.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistration.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/state/galleryProvider.dart';
import 'package:major_project__widget_testing/state/getAllHackathons/getAllHackathonsProvider.dart';
import 'package:major_project__widget_testing/state/getHackathon/getSingleHackathonProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/hostNavigationProvider.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/state/mainNavigationProvider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/state/templateSelectionprovider.dart';
import 'package:provider/provider.dart';


void main() async {
 
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBAoD5TbwV5B88rj7iYud1Afd-PcpC6xvI",
    appId: "1:675171732151:web:28ed551a8eb636b56adb32",
    messagingSenderId: "675171732151",
    projectId: "hackk-c6b72",
    authDomain: "hackk-c6b72.firebaseapp.com",
    storageBucket: "hackk-c6b72.appspot.com",
  ));
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
        ChangeNotifierProvider(
            create: (context) => DefaultTemplateProvider()),
         ChangeNotifierProvider(create: (context) => HackathonTextPropertiesProvider()),
            ChangeNotifierProvider(
            create: (context) => LoginProvider()),
         ChangeNotifierProvider(create: (context) => HackathonContainerPropertiesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}
