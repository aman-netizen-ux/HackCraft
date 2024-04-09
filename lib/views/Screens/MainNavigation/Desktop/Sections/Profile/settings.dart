 import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: scaleHeight(context, 820), color :  Color(0xffdfe1e2),child: Text("I'm in settings"));
  }
}