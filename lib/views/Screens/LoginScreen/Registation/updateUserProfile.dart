import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> updateUserPost(Map<String, dynamic> data, String uid) async {
  try {
    final bUrl = "https://hackcraft166.pythonanywhere.com/userput";
   // final bUrl = dotenv.get("userput");
    final url = '$bUrl/$uid';
    print(url);
    String jsonData = jsonEncode(data);
    print(data);
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      print('User Update  successful');
      print('Response: ${response.body}');
    } else {
      debugPrint('PUT request failed with status: ${response.statusCode}');
      print(response.body);
    }
  } catch (error) {
    debugPrint('Error sending PUT request: $error');
  }
}
