import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  int currentIndex = 0;
  
  int otpId = 0;
  String emailId = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  String _uuid = "";

  String get uuid => _uuid;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
  

  void setOtpId(int id) {
    otpId = id;
    notifyListeners();
  }

  void setEmail(String email) {
    emailId = email;
  }

  void setPassword(String key) {
    password = key;
  }

  void getFirstName(String nameG) {
    firstName = nameG;
  }

  void getLastName(String nameG) {
    lastName = nameG;
  }

  void setUuid(String id) {
    debugPrint('id in provider : $id');
    _uuid = id;
    debugPrint('uuid in provider : $_uuid');
    notifyListeners();
  }
}
