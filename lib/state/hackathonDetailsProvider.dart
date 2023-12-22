import 'package:flutter/material.dart';


class HackathonDetailsProvider with ChangeNotifier {
  String  _hackathonName= "";

  String get hackathonName => _hackathonName;

  set hackathonName(String index) {
    _hackathonName = index;
    notifyListeners();
  }
}
