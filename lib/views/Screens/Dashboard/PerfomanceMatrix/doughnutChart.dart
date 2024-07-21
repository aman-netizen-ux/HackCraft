import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class DoughnutChart extends StatefulWidget {
  final List<DoughnutChartData> data;

  const DoughnutChart({super.key, required this.data});

  @override
  _DoughnutChartState createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: scaleHeight(context, 10),
              left: scaleWidth(context, 14),
              bottom: scaleHeight(context, 40)),
          child: Text(
            "Gender Distribution",
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleHeight(context, 18),
                fontWeight: FontWeight.w500,
                color: darkCharcoal),
          ),
        ),
        SizedBox(
          height: scaleHeight(context, 100),
          child: Center(
            child: PieChart(
              PieChartData(
                sections: widget.data.map((data) {
                  return PieChartSectionData(
                    color: data.category == 'Male' ? Colors.blue : (data.category == 'Female' ? Colors.pink : Colors.grey),
                    value: data.value,
                    title: '${data.category}: ${data.value}',
                    radius: 40,
                    titleStyle: GoogleFonts.getFont(
                      fontFamily1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }).toList(),
                centerSpaceRadius: 45,
                sectionsSpace: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DoughnutChartData {
  final String category;
  final double value;

  DoughnutChartData(this.category, this.value);
}
