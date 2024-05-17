import 'package:flutter/material.dart';

class CustomPDFViewer extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomPDFViewer({super.key, required this.node, required this.onTap});

  @override
  State<CustomPDFViewer> createState() => _CustomPDFViewerState();
}

class _CustomPDFViewerState extends State<CustomPDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Text('PDFViewer');
  }
}