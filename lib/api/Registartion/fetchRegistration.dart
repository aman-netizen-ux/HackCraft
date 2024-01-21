import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

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
