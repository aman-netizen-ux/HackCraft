import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/Registartion/getRegistration.dart';

//This provider is for the gallery section.
class GetRegistrationForm with ChangeNotifier {
  Map<String, dynamic> _getForm = {};

  Map<String, dynamic> get getForm => _getForm;

  Future<void> getRegForm(String uId) async {
    _getForm = await ApiService().getRegistration(uId);
    notifyListeners();
  }
}
