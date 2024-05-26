import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/models/DashboardModel/hackathonModel.dart';

class GetDashboardHackathon {
  Future<Map<String, List<HackathonModel>>> fetchHackathons(
      String email) async {
    try {
      final String baseUrl = dotenv.get('getDashboardHackathon');
      final String url = '$baseUrl$email';
      final response = await http.get(Uri.parse(url));
      // print("response code${response.statusCode}");
      // print("response of list of hackathon ${response.body}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> liveData = responseData['live'];
        final List<dynamic> openData = responseData['open'];
        final List<dynamic> closeData = responseData['close'];
        List<HackathonModel> liveHackathons =
            liveData.map((json) => HackathonModel.fromJson(json)).toList();
        List<HackathonModel> openHackathons =
            openData.map((json) => HackathonModel.fromJson(json)).toList();
        List<HackathonModel> closeHackathons =
            closeData.map((json) => HackathonModel.fromJson(json)).toList();

        return {
          'live': liveHackathons,
          'open': openHackathons,
          'close': closeHackathons,
        };
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      var logger = Logger();
      logger.e("Error fetching hackathons: $e");
      throw Exception('Error to load data');
    }
  }
}
