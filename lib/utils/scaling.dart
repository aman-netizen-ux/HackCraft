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

//These two functions are made in order to resolve the issue of sizing of default edit template
double defaultEditScaleHeight(double containerHeight, double value) {
  return containerHeight * (value / 820);
}

double defaultEditScaleWidth(double containerWidth, double value) {
  return containerWidth * (value / 1280);
}
