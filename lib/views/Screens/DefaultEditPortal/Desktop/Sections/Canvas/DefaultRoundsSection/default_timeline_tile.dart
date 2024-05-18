import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/DefaultRoundsSection/default_round_Card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DefaultCustomTimelineTile extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final bool isFirst;
  final bool isLast;
  //final bool isPast;
  final String roundTitle;
  final int cardIndex;
  final String roundDescription;
  final String endDate;
  final String startDate;
  final void Function()? onTap;
  const DefaultCustomTimelineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      //required this.isPast,
      required this.roundTitle,
      required this.roundDescription,
      required this.endDate,
      required this.startDate,
      this.onTap,
      required this.cardIndex,
      required this.containerHeight,
      required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: const LineStyle(
        color: black1,
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
        width: scaleWidth(context, 35),
        color: lavender,
        padding: const EdgeInsets.all(6),
      ),
      endChild: DefaultRoundCard(
          index: cardIndex,
          title: roundTitle,
          enddate: endDate,
          startDate: startDate,
          onTap: onTap,
          containerHeight: containerHeight,
          containerWidth: containerWidth, isLast: isLast),
    );
  }
}
