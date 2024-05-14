import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:major_project__widget_testing/models/ProfileModel/userRegisteredHackathons.dart';

Future<UserRegisteredHackathons> fetchUserRegisteredHackathons(String emailId, String hackathonType, String  viewType) async {
  final String baseUrl1 = dotenv.get("getUserRegisteredHackathons");
  final String baseUrl2 = '$baseUrl1$emailId';
   final Uri url = Uri.parse(baseUrl2).replace(
    queryParameters: {
      hackathonType: 'True',
      viewType : 'True',
    },
  );
  final response = await http.get(url);
  debugPrint('reponse body : ${response.body}');

  if (response.statusCode == 200) {
    log('Hurraayy hackathons fetched 🫡');
    debugPrint('resppnse : ${response.body}');
    List<dynamic> jsonList = jsonDecode(response.body);
    UserRegisteredHackathons userRegisteredHackathons = UserRegisteredHackathons.fromJson(jsonList);

    return userRegisteredHackathons;
  } else {
    debugPrint('response in else : ${response.body}');
    log('Error occured while fetching the data 🥲😭');
    debugPrint('error : ${response.reasonPhrase}');
    throw Exception('Failed to load user data');
  }
}
