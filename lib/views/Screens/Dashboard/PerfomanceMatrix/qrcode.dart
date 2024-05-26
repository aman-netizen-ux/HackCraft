import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class QRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: BarcodeWidget(
          barcode: Barcode.aztec(), // Barcode type and settings
          data: 'https://pub.dev/packages/barcode_widget', // Content
          width: 200,
          height: 200,
          color: Colors.white,
        ),
      ),
    );
  }
}
