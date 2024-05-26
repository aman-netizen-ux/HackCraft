import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CreateTeam {
  postTeam(Map<String, dynamic> params, ) async {
    try {
      final String baseUrl = dotenv.get('postteam');
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(params),
      );



      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);

        debugPrint('response of team create : $jsonResponse');

       
        return response.body;
      } else {
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        debugPrint('error at 39 in team create: $errorResponse ,  $errorMessage');

        return "";
      }
    } catch (e) {
      debugPrint('error in catch of team create : $e');
      return "";
    }
  }




  postParticipant(Map<String, dynamic> params, String memberId) async {
    try {
      final String baseUrl = dotenv.get('postparticipant');
      final response = await http.post(
        Uri.parse("$baseUrl$memberId"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(params),
      );



      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);

        debugPrint('response of post participant : $jsonResponse');

       
        return true;
      } else {
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        debugPrint('error at 77 in post participant: $errorResponse ,  $errorMessage');

        return false;
      }
    } catch (e) {
      debugPrint('error in catch of post participant : $e');
      return false;
    }
  }




  postMember(Map<String, dynamic> params) async {
    try {
      final String baseUrl = dotenv.get('postmember');
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(params),
      );



      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);

        debugPrint('response of  post member : $jsonResponse');

       
        return true;
      } else {
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        debugPrint('error at 118 in post member: $errorResponse ,  $errorMessage');

        return false;
      }
    } catch (e) {
      debugPrint('error in catch of post member : $e');
      return false;
    }
  }
}
