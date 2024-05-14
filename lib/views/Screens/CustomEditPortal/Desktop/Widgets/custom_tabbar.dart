import 'package:flutter/material.dart';

class CustomTabbar extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomTabbar({super.key, required this.node, required this.onTap});

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  @override
  Widget build(BuildContext context) {
    return Text('Dynamic Text');
  }
}
