import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';

class GetSingleHackathon {
  //Get All the Hackathons
  Future<DefaultTemplateApiResponse?> getSingleHackathon(String uid) async {
    try {
      final String baseUrl = dotenv.get('getHackathon');
      final String url = '$baseUrl$uid';

      final response = await http.get(
        Uri.parse(url),
      );

      print("1");
      if (response.statusCode == 200) {
        print("2");
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        // debugPrint('API Response: $jsonResponse');
        return DefaultTemplateApiResponse.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      print("Error message : $e");
      return null;
    }
  }
}