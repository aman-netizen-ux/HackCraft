import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CreateHackathon {
  var logger = Logger();
  //Get All the Hackathons
  postSingleHackathon(Map<String, dynamic> params, BuildContext context) async {
    print(params);
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
        final jsonResponse = json.decode(response.body);

        debugPrint('response : $jsonResponse');

        id = jsonResponse['hackathon created']['_id'];
        debugPrint('id : $id');
        logger.i('Hackathon created successfully');

        return id;
      } else {
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        debugPrint('error at 43 : $errorResponse');

        logger.e(errorMessage);
        return '';
      }
    } catch (e) {
      logger.e("Error message : $e");
      debugPrint('error : $e');
      return null;
    }
  }



   postCustomSingleHackathon(Map<String, dynamic> params) async {
    print(params);
    try {
      final String baseUrl = dotenv.get('postCustomHackathon');
      final String id;
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(params),
      );

debugPrint("postCustomHackathon: ${response.statusCode}");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        debugPrint('response : $jsonResponse');

        id = jsonResponse['hackathon'];
        debugPrint('id postCustomHackathon: $id');
        logger.i('Hackathon created successfully');

        return id;
      } else {
        

        debugPrint('error at postCustomHackathon 43 : ${response.body}');

        return '';
      }
    } catch (e) {
      logger.e("Error message : $e");
      debugPrint('error : $e');
      return null;
    }
  }
}
