import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Sponsors/sponsors_landing.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    ListView(
      children: const  [
        SizedBox(height: 50,),
        SponsorsLanding(),
         SizedBox(height: 50,),
       Placeholder()
      ],
    );
  }
}

