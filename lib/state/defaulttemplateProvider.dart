import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//This provider is for the gallery section.
class DefaultTemplateProvider with ChangeNotifier {
  int _selectedSection = 0;

  int get selectedSection => _selectedSection;

  void setSelectedSection(int index) {
    _selectedSection = index;
    notifyListeners();
  }

  Color stringToColor(String colorString) {
    try {
      // Checking if the string contains '(' and ')'
      if (colorString.contains('(') && colorString.contains(')')) {
        // Extracting the hex color code from the string
        String hexColor = colorString.split('(')[1].split(')')[0];
        // Converting to a Color object
        return Color(int.parse(hexColor));
      } else {
        throw FormatException("Invalid format");
      }
    } catch (e) {
      var logger = Logger();
      logger.e('Error converting string to color: $e');
      // Return a default color in case of an error
      return Colors.black; // Default color
    }

    // Extracting the hex color code from the string
  }

  FontWeight fontWeightFromInt(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }


  //Convert the string alignment coming from the API to TextAlign
  TextAlign getTextAlign(String align){
    switch(align){
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'center':
        return TextAlign.center;
      case 'justify':
        return TextAlign.justify;
      default:
        return TextAlign.center;
    }
  }

  Alignment getContainerAlign(String align){
    switch(align){
      case 'left':
        return Alignment.centerLeft;
      case 'right':
        return Alignment.centerRight;
      case 'center':
        return Alignment.center;
      default:
        return Alignment.center;
    }
  } 


  AlignmentGeometry getTextAlignForContainer(String align){
    switch(align){
      case 'left':
        return Alignment.centerLeft;
      case 'right':
        return Alignment.centerRight;
      case 'center':
        return Alignment.center;
      case 'justify':
        return Alignment.centerLeft;
      default:
        return Alignment.center;
    }
  }

  MainAxisAlignment getMainAxisAlignment(String align) {
    switch (align) {
      case 'left':
        return MainAxisAlignment.start;
      case 'right':
        return MainAxisAlignment.end;
      case 'center':
        return MainAxisAlignment.center;
      default:
        return MainAxisAlignment.center;
    }
  }
}
