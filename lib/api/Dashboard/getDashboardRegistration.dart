import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:major_project__widget_testing/models/DashboardModel/registration_model.dart';

class GetDashboardRegistration {
  Future<List<Team>> fetchTeamData(String id) async {
    final String baseUrl = dotenv.get('getDashboardRegistration');
    final String url = '$baseUrl$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("response body ${response.body}");
      final List<dynamic> decodedJson = json.decode(response.body);
      return decodedJson.map((json) => Team.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load team data');
    }
  }
}
