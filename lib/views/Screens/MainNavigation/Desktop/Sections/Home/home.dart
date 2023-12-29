import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Home/Hackathons/Hackathon.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Home/home_landing.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    ListView(
      children: const  [
        SizedBox(height: 25,),
        HomeLanding(),
        SizedBox(height: 150),
        HomeHackathon()
      ],
    );
  }
}