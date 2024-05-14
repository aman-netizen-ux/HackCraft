import 'package:flutter/material.dart';

class CustomRow extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  final List<Widget> childWidgets;
  const CustomRow(
      {super.key,
      required this.node,
      required this.onTap,
      required this.childWidgets});

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.hardEdge,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.childWidgets,
          ),
        ),
      ),
    );
  }
}
