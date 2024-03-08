import 'package:flutter/material.dart';

class TemplateSelectionProvider extends ChangeNotifier {
  int selectedTemplate = 0;
  bool? isTnCChecked = false;

  void setTnC(bool? value) {
    isTnCChecked = value;
    notifyListeners();
  }

  void selectTemplate(int TemplateIndex) {
    selectedTemplate = TemplateIndex;
    notifyListeners();
  }
}
