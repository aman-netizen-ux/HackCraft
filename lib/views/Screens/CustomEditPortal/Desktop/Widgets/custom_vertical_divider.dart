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
      child: const VerticalDivider(
        color: Colors.grey,
        thickness: 1,
      ),
    );
  }
}
