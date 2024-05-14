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
        child: Row(
          mainAxisAlignment: widget.node['properties']['mainAxisAlignment'],
          crossAxisAlignment: widget.node['properties']['crossAxisAlignment'],
          children: [ ...List.generate(widget.childWidgets.length, (index) => widget.childWidgets[index])],
        ),
      ),
    );
  }
}
