import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class StackedToolBar extends StatefulWidget {
  const StackedToolBar({super.key});

  @override
  State<StackedToolBar> createState() => _StackedToolBarState();
}

class _StackedToolBarState extends State<StackedToolBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(context, 60),
      width: scaleWidth(context, 500),
      decoration: BoxDecoration(
        color: grey3,
        borderRadius: BorderRadius.circular(rad5_2),
        border: Border.all(
          color: greyish3
        )
      ),
    );
  }
}
