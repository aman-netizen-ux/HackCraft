import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CreateHackathon {
  //Get All the Hackathons
  postSingleHackathon(Map<String, dynamic> params, BuildContext context) async {
    try {
      final String baseUrl = dotenv.get('postHackathon');

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
        body: jsonEncode(params),
      );

      print("1");
      print(response.statusCode);
      if (response.statusCode == 201) {
        
        debugPrint('Hackathon created successfully');

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Hackathon created successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );

        return true;
      } else {
        // Parse the error response
        final errorResponse = jsonDecode(response.body);
        String errorMessage = '';
        errorResponse['error'].forEach((k, v) {
          errorMessage += '$k: ${v.join(', ')}\n';
        });

        print(errorMessage);
        return [];
      }
    } catch (e) {
      print("Error message : $e");
      return [];
    }
  }
}
