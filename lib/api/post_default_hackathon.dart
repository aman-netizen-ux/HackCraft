import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CreateHackathon {
  //Get All the Hackathons
  postSingleHackathon(Map<String, dynamic> params, BuildContext context) async {
    try {
      final String baseUrl = dotenv.get('postHackathon');
      final String id;
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(params),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        id = jsonResponse['hackathon created']['_id'];
        print(id);
        debugPrint('Hackathon created successfully');

        return id;
      } else {
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        debugPrint(errorMessage);
        return '';
      }
    } catch (e) {
      debugPrint("Error message : $e");
      return null;
    }
  }
}
