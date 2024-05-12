import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:major_project__widget_testing/models/ProfileModel/getUserProfileModel.dart';

Future<User?> fetchUserData(String uid) async {
  final String baseUrl = dotenv.get("getUserData");
  final String url = '$baseUrl$uid';
  final response = await http.get(Uri.parse(url),);

  if (response.statusCode == 200) {
    log('Hurraayy data fetched 🫡');
    print('resppnse : ${response.body}');
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response, throw an exception
    log('Error occured while fetching the data 🥲😭');
    print('error : ${response.reasonPhrase}');
    throw Exception('Failed to load user data');
  }
}
