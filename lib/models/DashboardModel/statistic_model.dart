import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/bar_chart.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/doughnutChart.dart';

class StatisticModel {
  final int numberOfRegistrations;
  final int numberOfImpressions;
  final Map<String, int> genderCounts;
  final String hackathonUrl;
  final Map<String, int> courseCounts;

  StatisticModel({
    required this.numberOfRegistrations,
    required this.numberOfImpressions,
    required this.genderCounts,
    required this.hackathonUrl,
    required this.courseCounts,
  });

  factory StatisticModel.fromJson(Map<String, dynamic> json) {
    return StatisticModel(
      numberOfRegistrations: json['number_of_registerations'],
      numberOfImpressions: json['number_of_impressions'],
      genderCounts: Map<String, int>.from(json['gender_counts']),
      hackathonUrl: json['hackathon_url'],
      courseCounts: Map<String, int>.from(json['course_counts']),
    );
  }

  List<DoughnutChartData> get genderChartData {
    return genderCounts.entries
        .map((entry) => DoughnutChartData(entry.key, entry.value.toDouble()))
        .toList();
  }

  List<ChartData> get courseChartData {
    return courseCounts.entries
        .map((entry) => ChartData(
              course: entry.key,
              count: entry.value,
            ))
        .toList();
  }
}
