import 'package:flutter/material.dart';

//This provider is for the gallery section.
class DefaultTemplateProvider with ChangeNotifier{

 int _selectedSection = 0;

  int get selectedSection => _selectedSection;

  void setSelectedSection(int index) {
    _selectedSection = index;
    notifyListeners();
  }
}