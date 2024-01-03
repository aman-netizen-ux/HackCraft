import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class hackathons {
  getAllHackathons() async {
    try {
      final String url = dotenv.get("getAllHackathons");

      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint("Error message : $e");
      return [];
    }
  }
}
