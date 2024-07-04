import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class ChartData {
  ChartData({required this.count, required this.course});
  final String course;
  final int count;
}

class BarChartSample extends StatefulWidget {
  final List<ChartData> data;

  const BarChartSample({super.key, required this.data});

  @override
  _BarChartSampleState createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: scaleHeight(context, 10),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 22)),
          child: Row(
            children: [
              Text(
                "Course Distribution",
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 18),
                    fontWeight: FontWeight.w400,
                    color: darkCharcoal),
              ),
            ],
          ),
        ),
        SizedBox(
          height: scaleHeight(context, 174),
          width: scaleWidth(context, 361),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: widget.data.map((data) {
                return BarChartGroupData(
                  x: widget.data.indexOf(data),
                  barRods: [
                    BarChartRodData(
                      fromY: 0,
                      toY: data.count.toDouble(),
                      color: Colors.blue,
                      width: 15,
                    ),
                  ],
                );
              }).toList(),
              borderData: FlBorderData(
                show: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      final style = GoogleFonts.firaSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                      Widget text =
                          Text(widget.data[value.toInt()].course, style: style);
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: text,
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: false),
            ),
          ),
        ),
      ],
    );
  }
}
