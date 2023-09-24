import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Redundant%20files/Navigation.dart';
import 'package:major_project__widget_testing/views/Redundant%20files/widget.dart';
import 'package:major_project__widget_testing/views/Redundant%20files/edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Navigation(),
      home:EditPlatform()
    );
  }
}

