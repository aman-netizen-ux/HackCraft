import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future triggerOTP(String email) async {
  //Api Url
  final String baseUrl = dotenv.get("sendOtp");
  final String url = '$baseUrl$email';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final otpData = json.decode(response.body);
      final otpId = otpData['otp'];

      return otpId;
    } else {
      // Handle error response
      debugPrint('Failed to fetch OTP: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or other errors
    debugPrint('Error: $e');
  }
}

Future triggerResendOTP(String email) async {
  // Api Url
  final String baseUrl = dotenv.get("resendOtp");
  final String url = '$baseUrl$email';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final otpData = json.decode(response.body);
      final otpId = otpData['otp'];

      return otpId;
    } else {
      // Handle error response
      debugPrint('Failed to fetch OTP: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or other errors
    debugPrint('Error: $e');
  }
}
