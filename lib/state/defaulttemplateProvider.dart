import 'package:flutter/material.dart';

//This provider is for the gallery section.
class DefaultTemplateProvider with ChangeNotifier{

 int _selectedSection = 0;

  int get selectedSection => _selectedSection;

  void setSelectedSection(int index) {
    _selectedSection = index;
    notifyListeners();
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

}