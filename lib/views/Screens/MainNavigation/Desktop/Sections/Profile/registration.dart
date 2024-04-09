import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class Registrations extends StatefulWidget {
  const Registrations({super.key});

  @override
  State<Registrations> createState() => _RegistrationsState();
}

class _RegistrationsState extends State<Registrations> {
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: scaleHeight(context, 820), color :  Color(0xffdfe1e2),child: Text("I'm in user registrations"));
  }
}