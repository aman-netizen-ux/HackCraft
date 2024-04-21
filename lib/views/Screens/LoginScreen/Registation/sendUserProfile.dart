import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> sendUserPost(Map<String, dynamic> data) async {
  try {
   // final url = "https://hackcraft166.pythonanywhere.com/userpost";
    final url = dotenv.get("userpost");
    String jsonData = jsonEncode(data);
    print(data);
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    // Check if request was successful (status code 200)
    if (response.statusCode == 201) {
      print('User POST  successful');
      print('Response: ${response.body}');
    } else {
      debugPrint('POST request failed with status: ${response.statusCode}');
      print(response.body);
    }
  } catch (error) {
    debugPrint('Error sending POST request: $error');
  }
}
