import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/models/customTemplateModel/customTemplateModel.dart';
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

      debugPrint('response in api : ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('status : ${response.statusCode}');
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        debugPrint('json : $jsonResponse');
        debugPrint('default one : ${DefaultTemplateApiResponse.fromJson(jsonResponse)}');

        return DefaultTemplateApiResponse.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      
      var logger = Logger();
      logger.e("Error message : $e");
      return null;
    }
  }





  Future<CustomTemplateApiResponse?> getSingleCustomHackathon(String uid) async {
    try {
      final String baseUrl = dotenv.get('getCustomHackathon');
      final String url = '$baseUrl$uid';

      final response = await http.get(
        Uri.parse(url),
      );

      debugPrint('response in api getCustomHackathon : ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('status : ${response.statusCode}');
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        debugPrint('json : $jsonResponse');
        debugPrint('custom one : ${CustomTemplateApiResponse.fromJson(jsonResponse)}');

        return CustomTemplateApiResponse.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      
      var logger = Logger();
      logger.e("Error message : $e");
      return null;
    }
  }
}

