import 'package:flutter/material.dart';

class CustomDivider extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomDivider({super.key, required this.node, required this.onTap});

  @override
  State<CustomDivider> createState() => _CustomDividerState();
}

class _CustomDividerState extends State<CustomDivider> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
    );
  }
}