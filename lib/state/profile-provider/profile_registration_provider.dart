import 'package:flutter/material.dart';

class ProfileRegProvider extends ChangeNotifier {
  String _dropdownValue = 'Closed';

  String get dropdownValue => _dropdownValue;

  void selectValue(String value) {
    _dropdownValue = value;
    notifyListeners();
  }

  String _finishedDropdownValue = 'Complete';

  String get finishedDropdownValue => _finishedDropdownValue;

  void selectFinishedValue(String value) {
    _finishedDropdownValue = value;
    notifyListeners();
  }

  String _sortValue = 'Latest';

  String get sortValue => _sortValue;

  void selectSortValue(String value) {
    _sortValue = value;
    notifyListeners();
  }
}
