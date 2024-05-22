import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/Dashboard/getDashboardStatistics.dart';
import 'package:major_project__widget_testing/models/DashboardModel/statisticModel.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/communication_share.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/statistics.dart';

class PerformanceMatrix extends StatefulWidget {
  const PerformanceMatrix({super.key});

  @override
  State<PerformanceMatrix> createState() => _PerformanceMatrixState();
}

class _PerformanceMatrixState extends State<PerformanceMatrix> {
  late StatisticModel? statistic;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchStatistic();
  }

  Future<void> fetchStatistic() async {
    try {
      final model = await GetDashboardStatistic().fetchHackathonStatistic("f1f31ea2-b09d-497c-8b9f-894d9433b09e");
      setState(() {
        statistic = model;
        isLoading = false;
        hasError = model == null;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
      debugPrint('Error fetching statistic: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (hasError) {
      return Center(child: Text('Error fetching data'));
    } else {
      return Container(
        height: scaleHeight(context, 820),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          color: Color(0xfff5f5f5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 30, child: SizedBox()),
            Expanded(
              flex: 628,
              child: Statistic(statistic: statistic!),
            ),
            const Expanded(flex: 45, child: SizedBox()),
            Expanded(
              flex: 297,
              child: CommunicateShare(url: statistic!.hackathonUrl),
            ),
          ],
        ),
      );
    }
  }
}