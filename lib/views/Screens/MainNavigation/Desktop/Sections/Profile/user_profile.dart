 import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: scaleHeight(context, 820), color :  Color(0xffdfe1e2),child: Text("I'm in user profile"));
  }
}