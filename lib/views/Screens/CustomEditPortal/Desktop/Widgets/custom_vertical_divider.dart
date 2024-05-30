import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomVerticalDivider(
      {super.key, required this.node, required this.onTap});
  @override
  State<CustomVerticalDivider> createState() => _CustomVerticalDividerState();
}

class _CustomVerticalDividerState extends State<CustomVerticalDivider> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: VerticalDivider(
        color: Colors.grey,
        thickness: widget.node['properties']['thickness'],
        indent: widget.node['properties']['indent'],
        endIndent: widget.node['properties']['endIndent'],
        width: widget.node['properties']['verticalDividerWidth'],
      ),
    );
  }
}
