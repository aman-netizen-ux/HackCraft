import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:major_project__widget_testing/models/prefilledDataModel.dart';
import 'dart:convert';


class GetPrefilledData {
  Future<PrefilledDataModel?> getprefilledData(String emailId) async {
    try {
      final String baseUrl = dotenv.get('prefilled');
      final String url = '$baseUrl$emailId';
      print("url  $url");

      final response = await http.get(
        Uri.parse(url),
      );
      // debugPrint('response in usertype api : ${response.body}');
       print("Im in prefilled  data api ${response.statusCode}");

      if (response.statusCode == 200) {
        
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
         print("Im in prefilled  data api ${jsonResponse}");
        return PrefilledDataModel.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error message in usertypeapi: $e");
      return null;
    }
  }
}
