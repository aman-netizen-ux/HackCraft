import 'package:flutter/material.dart';

//This Function scales to the width of the Screen
//update 413  according to figma width and height

double scaleWidth(BuildContext context, double value) {
  return MediaQuery.of(context).size.width  * (value/1280);
}

double scaleHeight(BuildContext context, double value) {
  return MediaQuery.of(context).size.height  * (value/820);
}
