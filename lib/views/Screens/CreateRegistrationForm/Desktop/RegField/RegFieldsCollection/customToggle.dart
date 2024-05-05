import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class CustomToggle extends StatefulWidget {
  @override
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Container(
        height: scaleHeight(context, 40),
        width: scaleWidth(context, 54),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              left: _isChecked ? 2 : 0,
              bottom: 2,
              top: 2,
              child: Container(
                width: scaleWidth(context, 52),
                height: scaleHeight(context, 24),
                decoration: const BoxDecoration(
                  color: lightGrey, 
                ),
              ),
            ),
            Positioned(
              left: _isChecked ? 26 : 0,
             top: 2,
              bottom: 2,
              child: Container(
                margin:const EdgeInsets.all(5),
                width: scaleWidth(context, 24),
                height:scaleHeight(context, 30),
                decoration:const BoxDecoration(
                  color: Color(0xffeaeaea), 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
