import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<bool> verifyOTP(String otp, int otpId) async {
  final url = "https://hackcraft166.pythonanywhere.com/otprecieve";
 // final url = dotenv.get("verifyOtp");
  final body = {'otp': otp, 'otp_id': otpId};
  String jsonData = jsonEncode(body);
  try {
    print(body);
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData);
    if (response.statusCode == 200) {
      // If OTP is verified successfully
      return true;
    } else {
      // Handle error response
      
      debugPrint('OTP verification failed: ${response.statusCode}');
      debugPrint(response.body);
      return false;
    }
  } catch (e) {
    // Handle network or other errors
    debugPrint('Error: $e');
    return false;
  }
}
