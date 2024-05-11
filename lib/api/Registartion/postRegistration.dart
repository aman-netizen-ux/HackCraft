import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PostApiService {
  var logger = Logger();
  postRegistration(String hackathonId, Map<String, dynamic> params) async {
    final String baseUrl = dotenv.get("registration");
    final String url = '$baseUrl$hackathonId';
   // print(params);
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
        logger.i('Registration success');
        return response.statusCode;
      } else {
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        logger.e(errorMessage);
        return response.statusCode;
      }
    } catch (e) {
      logger.e("Error message : $e");
      return response.statusCode;
    }
  }
}
