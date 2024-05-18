import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';

class CustomText extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomText({super.key, required this.node, required this.onTap});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text('Dynamic Text');
  }
}