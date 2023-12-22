import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class hackathon {
  //Get All the Hackathons
  getSingleHackathon(String uid) async {
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
        return jsonResponse;
      } else {
        return [];
      }
    } catch (e) {
      print("Error message : $e");
      return [];
    }
  }
}
