import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomIcon({super.key, required this.node, required this.onTap});

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: const Icon(Icons.forest_outlined),
    );
  }
}
