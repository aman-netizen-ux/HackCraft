import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class hackathons {
  //Get All the Hackathons
  getAllHackathons() async {
    try {
      final String url = dotenv.get("getAllHackathons");

      final response = await http.get(
        Uri.parse(url),
      );

      print("1");
      if (response.statusCode == 200) {
        print("2");
        final List<dynamic> jsonResponse = json.decode(response.body);
        debugPrint('API Response: $jsonResponse');
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
