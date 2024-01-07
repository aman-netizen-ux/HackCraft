import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';

class HackathonTextPropertiesProvider with ChangeNotifier {
  // textFieldPropertiesMap temporary saves all the text properties of every text form field
  Map<GlobalKey, TextFieldProperties> textFieldPropertiesMap = {};

  // _selectedTextFieldKey helps determining which text form field is getting onTapped
  GlobalKey? _selectedTextFieldKey;

  GlobalKey? get selectedTextFieldKey => _selectedTextFieldKey;

  set selectedTextFieldKey(GlobalKey? value) {
    _selectedTextFieldKey = value;
    notifyListeners();
  }

  void increaseFontSize() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.size += 2;
      notifyListeners();
    }
  }
}
