import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/api/Registartion/fetchRegistration.dart';
import 'package:major_project__widget_testing/models/Registration/customField.dart';
import 'package:major_project__widget_testing/models/Registration/registration_form_model.dart';

var logger = Logger();

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
        logger.i("Form data is empty or not found");
      }

      if (response.containsKey('custom_fields')) {
        if (response['custom_fields'] != null &&
            response['custom_fields'].isNotEmpty) {
          _customFields = (response['custom_fields'] as List)
              .map((field) => CustomField.fromJson(field))
              .toList();
          notifyListeners();
        } else {
          logger.i("Custom fields are empty or null");
        }
      } else {
        logger.i("Custom fields key not found in response");
      }
    } catch (e) {
      logger.e("Error fetching registration form: $e");
    }
  }


  //newCode

  List<String> sections=["abc", "wow", "ok", "nice"];
final TickerProvider _vsync;
  TabController getformcontroller;

  GetRegistrationFormProvider(this._vsync)
      : getformcontroller = TabController(length: 0, vsync: _vsync) {
    initialize();
  }

   Future<void> initialize() async {
//  isInitialized = true;
    _createTabController();
    notifyListeners();
  }


  // This function is used to create a new tabcontroller
  void _createTabController() {
    getformcontroller = TabController(length: sections.length, vsync: _vsync);
    getformcontroller.addListener(() {
      if (!getformcontroller.indexIsChanging) {
        notifyListeners();
      }
    });
  }

   Future<void> refreshTabs() async {
    getformcontroller.dispose();
    _createTabController();
    notifyListeners();
  }
  
 RegistrationFormModel _singleForm = RegistrationFormModel(
      form: FormModel(hackthon: "", numberOfFields: 0),
      fields: [],
      sections: []);

RegistrationFormModel get singleForm => _singleForm;
    Future<void> getHackathonForm(String id) async {
    final response = await GetRegistratioForm().getRegistratioForm(id);
    if (response != null && response is RegistrationFormModel) {
      _singleForm = response;
      print("if $_singleForm");
    } else {
      _singleForm = RegistrationFormModel(
          form: FormModel(hackthon: "", numberOfFields: 0),
          fields: [],
          sections: []);

      print("else $_singleForm");
    }

    notifyListeners();
  }

}

// cae9be78-910b-4fd4-82c6-22a547fce01c
