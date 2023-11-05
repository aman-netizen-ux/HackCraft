import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/separator.dart';


class DefaultCanvas extends StatefulWidget {
  const DefaultCanvas({super.key});

  @override
  State<DefaultCanvas> createState() => _DefaultCanvasState();
}

class _DefaultCanvasState extends State<DefaultCanvas> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8698,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Container(
              height: scaleHeight(context, 615),
              width: double.infinity,
              color: Colors.blue[100],
            ),
            Container(
              height: scaleHeight(context, 615),
              width: double.infinity,
              color: Colors.pink[100],
            ),
            Container(
              height: scaleHeight(context, 615),
              width: double.infinity,
              color: Colors.brown[300],
            ),
            Container(
              height: scaleHeight(context, 400),
              width: double.infinity,
              color: Colors.purple[200],
            ),
            Container(
              height: scaleHeight(context, 60),
              width: double.infinity,
              color: grey4,
            ),

          ],
        ),
      ),
    );
  }
}
