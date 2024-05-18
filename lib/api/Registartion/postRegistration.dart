import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PostApiService {
  var logger = Logger();
  Future<bool> postRegistration(String hackathonId, Map<String, dynamic> params) async {
    final String baseUrl = dotenv.get("registration");
    final String url = '$baseUrl$hackathonId';

    var fieldsAsJson = params['fields'].map((field) => field.toJson()).toList();

    params['fields'] = fieldsAsJson;

    debugPrint('params : $params');
    debugPrint('encoded : ${jsonEncode(params)}');

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(params),
    );

    try {
      if (response.statusCode == 201) {
        logger.i('Registration success');
        debugPrint('Registration success');
        return true;
      } else {
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        logger.e(errorMessage);
        return false;
      }
    } catch (e) {
      
      logger.e("Error message : $e, ${response.body} ");
      debugPrint(response.body);
      // log("*********${response.body}*********8");
      return false;
    }
  }
}
