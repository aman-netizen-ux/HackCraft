import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CreateHackathon {
  //Get All the Hackathons
  postSingleHackathon(Map<String, dynamic> params) async {
    try {
      final String baseUrl = dotenv.get('postHackathon');

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
        body: jsonEncode(params),
      );

      print("1");
      print(response.statusCode);
      if (response.statusCode == 201) {
        
        debugPrint('Hackathon created successfully');
        return true;
      } else {
        return [];
      }
    } catch (e) {
      print("Error message : $e");
      return [];
    }
  }
}
