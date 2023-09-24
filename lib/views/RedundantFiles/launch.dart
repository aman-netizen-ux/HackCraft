import 'dart:ui';

import 'package:flutter/material.dart';

class Launch extends StatelessWidget {
  const Launch({super.key, required this.boxPercent});
  final double boxPercent;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // key: _whiteContainerKey,
            height: 20,
            width: screenWidth * boxPercent/100,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            color: Colors.blue[200],
          ),
          Container(
            // key: _whiteContainerKey,
            height: 20,
            width: screenWidth * 0.26,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            color: Colors.red[200],
          ),
           Container(
            // key: _whiteContainerKey,
            height: 20,
            width: screenWidth * 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            color: Colors.red[200],
          ),

          const Text(
            'The quick brown fox jumps over a lazy dog.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
              decorationThickness: 4,

            )
          ),

          const Text(
            'The quick brown fox jumps over a lazy dog.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.w600, 
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.none
            )
          ),

           Text(
            'The quIck broWn4 fox jumps9 ov5ER a lazy doG.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 167, 177, 185),
              fontSize: 30,
              decoration: TextDecoration.overline,
              letterSpacing:10,
              fontFeatures: [
    
    // FontFeature.enable('sinf'), // Enable small caps
    FontFeature.scientificInferiors(), 
  ],
            )
          ),

          const Text(
            'The quick brown fox jumps over a lazy dog.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              decoration: TextDecoration.underline
            )
          )


        ],
      ),
    );
  }
}
