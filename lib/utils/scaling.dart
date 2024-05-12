import 'package:flutter/material.dart';

//This Function scales to the width of the Screen
//update 413  according to figma width and height

double scaleWidth(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * (value / 1280);
}

double scaleHeight(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * (value / 820);
}

double widthScaler(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * (value / 1440);
}

double heightScaler(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * (value / 678);
}

double squareScaler(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * (value / 1440);
}

// double scaleAccordingToRatio(BuildContext context, double value) {
//   // Desired aspect ratio (Width / Height)
//   final double desiredAspectRatio = 1280.0 / 820.0;
  
//   // Current screen size and aspect ratio
//   final Size screenSize = MediaQuery.of(context).size;
//   final double currentAspectRatio = screenSize.width / screenSize.height;
  
//   // Calculate the scaling factor based on current and desired aspect ratios
//   final double scaleFactor = currentAspectRatio / desiredAspectRatio;
  
//   // Scale the input value according to the calculated scaling factor
//   return value * scaleFactor;
// }

//These two functions are made in order to resolve the issue of sizing of default edit template
double defaultEditScaleHeight(double containerHeight, double value) {
  return containerHeight * (value / 820);
}

double defaultEditScaleWidth(double containerWidth, double value) {
  return containerWidth * (value / 1280);
}
