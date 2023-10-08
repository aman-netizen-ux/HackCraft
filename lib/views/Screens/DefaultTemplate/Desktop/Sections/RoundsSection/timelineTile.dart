import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/roundCard.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  //final bool isPast;
  final String roundTitle;
  final String roundDescription;
  final String endDate;
  final String startDate;
  final void Function()? onTap;
  const CustomTimelineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      //required this.isPast,
      required this.roundTitle,
      required this.roundDescription,
      required this.endDate,
      required this.startDate, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle:  const LineStyle(
        color:  black1,
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
        width: scaleWidth(context, 35),
        color: timelinesColor,
        padding: EdgeInsets.all(6),
      ),

      endChild: RoundCard(title: roundTitle, enddate: endDate, startDate: startDate, onTap: onTap),
      
    );
  }
}
