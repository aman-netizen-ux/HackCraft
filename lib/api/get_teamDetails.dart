import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:major_project__widget_testing/models/teamRegisterationModel.dart';
import 'dart:convert';

import 'package:major_project__widget_testing/models/userTypeModel.dart';

class GetTeamDetails {
  Future<TeamRegisterationModel?> getTeamDetails(String teamId) async {
    try {
      final String baseUrl = dotenv.get('postteam');
      final String url = '$baseUrl$teamId';
      print("url  $url");

      final response = await http.get(
        Uri.parse(url),
      );
      // debugPrint('response in usertype api : ${response.body}');
       debugPrint("Im in team details api ${response.statusCode}");

      if (response.statusCode == 200) {
        
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
         debugPrint("Im in team details api $jsonResponse");
        return TeamRegisterationModel.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error message in team details api: $e");
      return null;
    }
  }
}
