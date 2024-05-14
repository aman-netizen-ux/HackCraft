import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatefulWidget {
  const DoughnutChart({super.key});

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
              top: scaleHeight(context, 10), left: scaleWidth(context, 14)),
          child: Text(
            "Lorem ipsum",
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleHeight(context, 18),
                fontWeight: FontWeight.w500,
                color: darkCharcoal),
          ),
        ),
        SizedBox(
          height: scaleHeight(context, 180),
          child: Center(
            child: SfCircularChart(
              legend: const Legend(isVisible: true),
              series: <CircularSeries>[
                DoughnutSeries<DoughnutChartData, String>(
                  dataSource: <DoughnutChartData>[
                    DoughnutChartData('Male', 10),
                    DoughnutChartData('Female', 20),
                    DoughnutChartData('others', 30),
                  ],
                  xValueMapper: (DoughnutChartData data, _) => data.category,
                  yValueMapper: (DoughnutChartData data, _) => data.value,
                ),
              ],
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
