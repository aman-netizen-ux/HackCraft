import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomVerticalDivider/custom_vertical_divider_endIndent.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomVerticalDivider/custom_vertical_divider_indent.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomVerticalDivider/custom_vertical_divider_thickness.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomVerticalDivider/custom_vertical_divider_width.dart';

class CustomVerticalDividerPropertiesPanelWidget extends StatelessWidget {
  const CustomVerticalDividerPropertiesPanelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomVerticalDividerWidthWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomVerticalDividerThicknessWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomVerticalDividerIndentWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomVerticalDividerEndIndentWidget()
        
        
      ],
    );
  }
}
