import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomColumnToolbar/custom_column_cross_axis_alignment.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomColumnToolbar/custom_column_main_axis_alignment.dart';

class CustomColumnPropertiesPanelWidget extends StatelessWidget {
  const CustomColumnPropertiesPanelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const CustomColumnMainAxisAlignmentWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomColumnCrossAxisAlignmentWidget()
        
        
      ],
    );
  }
}
