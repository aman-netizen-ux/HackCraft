import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/Constants/app_routes.dart';
//later defined: any backend related part, provider, (stateful:TickerProviderStateMixin )
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}


