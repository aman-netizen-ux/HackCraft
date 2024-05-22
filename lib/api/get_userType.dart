import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:major_project__widget_testing/models/userTypeModel.dart';

class GetUserType {
  Future<UserTypeModel?> getuserType(String hackathonId, String emailId) async {
    try {
      final String baseUrl = dotenv.get('getUserType');
      final String url = '$baseUrl$emailId/$hackathonId';
      print("url  $url");

      final response = await http.get(
        Uri.parse(url),
      );
      // debugPrint('response in usertype api : ${response.body}');
       print("Im in usertype api ${response.statusCode}");

      if (response.statusCode == 200) {
        
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
         print("Im in usertype api ${jsonResponse}");
        return UserTypeModel.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error message in usertypeapi: $e");
      return null;
    }
  }
}
