import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PostApiService {
  postRegistration(String hackathonId, Map<String, dynamic> params) async {
    final String baseUrl = dotenv.get("registration");
    final String url = '$baseUrl$hackathonId';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(params),
    );

    try {
      if (response.statusCode == 201) {
        debugPrint('Registration success');
        return response.statusCode;
      } else {
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        debugPrint(errorMessage);
        return response.statusCode;
      }
    } catch (e) {
      debugPrint("Error message : $e");
      return response.statusCode;
    }
  }
}
