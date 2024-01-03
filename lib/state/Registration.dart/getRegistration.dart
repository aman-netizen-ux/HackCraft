import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/Registartion/fetchRegistration.dart';
import 'package:major_project__widget_testing/models/Registration/customField.dart';

//This provider is for the registration section.
class GetRegistrationFormProvider with ChangeNotifier {
  List<CustomField> _customFields = [];
  List<CustomField> get customFields => _customFields;

  Map<String, dynamic> _formData = {};
  Map<String, dynamic> get formData => _formData;

  Future<void> getRegForm(String uId) async {
    try {
      var response = await ApiService().getRegistration(uId);

      if (response.containsKey('form') && response['form'].isNotEmpty) {
        _formData = response['form'][0];
      } else {
        debugPrint("Form data is empty or not found");
      }

      if (response.containsKey('custom_fields')) {
        if (response['custom_fields'] != null &&
            response['custom_fields'].isNotEmpty) {
          _customFields = (response['custom_fields'] as List)
              .map((field) => CustomField.fromJson(field))
              .toList();
          notifyListeners();
        } else {
          debugPrint("Custom fields are empty or null");
        }
      } else {
        debugPrint("Custom fields key not found in response");
      }
    } catch (e) {
      debugPrint("Error fetching registration form: $e");
    }
  }
}
