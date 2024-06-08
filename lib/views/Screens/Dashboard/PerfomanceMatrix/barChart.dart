// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:major_project__widget_testing/constants/colors.dart';
// import 'package:major_project__widget_testing/constants/fontfamily.dart';
// import 'package:major_project__widget_testing/utils/scaling.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class ChartData {
//   ChartData({required this.month, required this.males, required this.females});
//   final String month;
//   final int males;
//   final int females;
// }

// class BarChart extends StatefulWidget {
//   const BarChart({super.key});

//   @override
//   _BarChartState createState() => _BarChartState();
// }

// class _BarChartState extends State<BarChart> {
//   List<ChartData> chartData = [
//     ChartData(month: 'Jan', males: 5, females: 45),
//     ChartData(month: 'Feb', males: 28, females: 24),
//     ChartData(month: 'Mar', males: 34, females: 34),
//     ChartData(month: 'ap', males: 5, females: 45),
//     ChartData(month: 'may', males: 28, females: 24),
//     ChartData(month: 'jun', males: 34, females: 34),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: scaleHeight(context, 10),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 22)),
//           child: Row(
//             children: [
//               Text(
//                 "Lorem Ipsum",
//                 style: GoogleFonts.getFont(fontFamily2,
//                     fontSize: scaleHeight(context, 18),
//                     fontWeight: FontWeight.w400,
//                     color: darkCharcoal),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: scaleHeight(context, 174),
//           width: scaleWidth(context, 361),
//           child: SfCartesianChart(
//             primaryXAxis: const CategoryAxis(
//               isVisible: true,
//               axisLine: AxisLine(width: 1),
//               majorTickLines: MajorTickLines(size: 5),
//               majorGridLines: MajorGridLines(width: 1),
//               // title: AxisTitle(text: 'Month'),
//             ),
//             primaryYAxis: const NumericAxis(
//               isVisible: true,
//               axisLine: AxisLine(width: 1),
//               majorTickLines: MajorTickLines(size: 5),
//               majorGridLines: MajorGridLines(width: 1),
//               // title: AxisTitle(text: 'Count'),
//             ),
//             legend:
//                 const Legend(isVisible: true, position: LegendPosition.bottom),
//             tooltipBehavior: TooltipBehavior(enable: true),
//             series: <CartesianSeries>[
//               ColumnSeries<ChartData, String>(
//                 name: 'Males',
//                 dataSource: chartData,
//                 xValueMapper: (ChartData data, _) => data.month,
//                 yValueMapper: (ChartData data, _) => data.males,
//                 color: Colors.blue,
//                 width: 0.4,
//                 spacing: 0.1,
//               ),
//               ColumnSeries<ChartData, String>(
//                 name: 'Females',
//                 dataSource: chartData,
//                 xValueMapper: (ChartData data, _) => data.month,
//                 yValueMapper: (ChartData data, _) => data.females,
//                 color: Colors.pink,
//                 width: 0.4,
//                 spacing: 0.1,
//               )
//             ],
//             plotAreaBorderWidth: 0,
//           ),
//         ),
//       ],
//     );
//   }
// }
