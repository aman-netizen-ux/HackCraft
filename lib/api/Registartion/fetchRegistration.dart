import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/models/Registration/registration_form_model.dart';

class ApiService {
  getRegistration(String uId) async {
    final String baseUrl = dotenv.get("getRegistration");
    final String url = '$baseUrl$uId';
    final response = await http.get(
      Uri.parse(url),
    );

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        return {};
      }
    } catch (e) {
      var logger = Logger();
      logger.e("Error message : $e");
      return {};
    }
  }
}

class GetRegistratioForm {
  //Get All the Hackathons
  Future<RegistrationFormModel?> getRegistratioForm(String uid) async {
    print("api start");
    try {
      final String baseUrl = dotenv.get('getRegistration');
      final String url = '$baseUrl$uid';

      final response = await http.get(
        Uri.parse(url),
      );
      print("try state");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        print("response sucess $jsonResponse");
        return RegistrationFormModel.fromJson(jsonResponse);
      } else {
        print("response failed");
        print(response.body);
        return null;
      }
    } catch (e) {
      var logger = Logger();
      logger.e("Error message : $e");
      print("eorr ");
      return null;
    }
  }
}
