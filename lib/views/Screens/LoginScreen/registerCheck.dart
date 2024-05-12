import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<bool> registerCheck(String email) async {
  // Api Url
  final String baseUrl =
      "https://hackcraft166.pythonanywhere.com/isregistered/";
  final String url = '$baseUrl$email';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return true;
    } else {
      // Handle error response
      debugPrint(' ${response.statusCode}  ${response.body}');
      return false;
    }
  } catch (e) {
    // Handle network or other errors
    debugPrint('Error: $e');
    return false;
  }
}
