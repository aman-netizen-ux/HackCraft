import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/deleteWidget.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomRowToolbar/custom_cross_axis_alignment.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomRowToolbar/custom_main_axis_alignment.dart';

class CustomRowPropertiesPanelWidget extends StatelessWidget {
  const CustomRowPropertiesPanelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const CustomMainAxisAlignmentWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomCrossAxisAlignmentWidget(),
        SizedBox(width: scaleWidth(context, 20)),
const DeleteWidget()
        
        
      ],
    );
  }
}
