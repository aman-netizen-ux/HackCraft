import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/models/DashboardModel/statisticModel.dart';

class GetDashboardStatistic {
  Future<StatisticModel?> fetchHackathonStatistic(String id) async {
    try {
      final String baseUrl = dotenv.get('dashboardStatistic');
      final String url = '$baseUrl$id';
      final response = await http.get(Uri.parse(url));
      print("response of stats from api fun ${response.body}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print("response of stats from api fun ${response.body}");
        return StatisticModel.fromJson(responseData);
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
