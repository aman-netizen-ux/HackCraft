import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/communication_share.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/statistics.dart';

class PerformanceMatrix extends StatefulWidget {
  const PerformanceMatrix({super.key, required this.hackathonName});
  final String hackathonName;
  @override
  State<PerformanceMatrix> createState() => _PerformanceMatrixState();
}

class _PerformanceMatrixState extends State<PerformanceMatrix> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(context, 820),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
        color: Color(0xfff5f5f5),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 30, child: SizedBox()),
          Expanded(
            flex: 628,
            child: Statistic(),
          ),
          Expanded(flex: 45, child: SizedBox()),
          Expanded(flex: 297, child: CommunicateShare())
        ],
      ),
    );
  }
}
