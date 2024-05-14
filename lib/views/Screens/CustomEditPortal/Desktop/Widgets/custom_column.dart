import 'package:flutter/material.dart';

class CustomColumn extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  final List<Widget> childWidgets;
  const CustomColumn(
      {super.key,
      required this.node,
      required this.onTap,
      required this.childWidgets});

  @override
  State<CustomColumn> createState() => _CustomColumnState();
}

class _CustomColumnState extends State<CustomColumn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: SingleChildScrollView(
          // TODO : Hide the scroll bar
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Customize as needed
            crossAxisAlignment: CrossAxisAlignment.start, // Customize as needed
            children: widget.childWidgets,
          ),
        ),
      ),
    );
  }
}
