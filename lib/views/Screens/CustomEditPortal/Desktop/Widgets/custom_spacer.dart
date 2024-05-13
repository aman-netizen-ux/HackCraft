import 'package:flutter/material.dart';

class CustomSpacer extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomSpacer({super.key, required this.node, required this.onTap});

  @override
  State<CustomSpacer> createState() => _CustomSpacerState();
}

class _CustomSpacerState extends State<CustomSpacer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: widget.onTap, child: const Spacer());
  }
}
