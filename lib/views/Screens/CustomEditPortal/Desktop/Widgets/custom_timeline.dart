import 'package:flutter/material.dart';

class CustomTimeline extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  final List<Widget> childWidgets;
  const CustomTimeline(
      {super.key,
      required this.node,
      required this.onTap,
      required this.childWidgets});

  @override
  State<CustomTimeline> createState() => _CustomTimelineState();
}

class _CustomTimelineState extends State<CustomTimeline> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(children: widget.childWidgets));
  }
}