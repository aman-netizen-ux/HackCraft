import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:major_project__widget_testing/models/allHackathonsModel.dart';

class hackathons {
  //Get All the Hackathons
  Future<List<HackathonModel>> getAllHackathons() async {
    List<HackathonModel> hackathonsList = [];
    try {
      final String url = dotenv.get("getAllHackathons");

      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        hackathonsList = jsonResponse.map((json) => HackathonModel.fromJson(json)).toList();
      }
    } catch (e) {
      print("Error getting hackathons: $e");
    }
    return hackathonsList;
  }
}
