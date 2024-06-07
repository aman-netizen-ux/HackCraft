import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/deleteWidget.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomDivider/custom_divider_endIndent.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomDivider/custom_divider_height.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomDivider/custom_divider_indent.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomDivider/custom_divider_thickness.dart';

class CustomDividerPropertiesPanelWidget extends StatelessWidget {
  const CustomDividerPropertiesPanelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomDividerHeightWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomDividerThicknessWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomDividerIndentWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomDividerEndIndentWidget(),
        SizedBox(width: scaleWidth(context, 20)),
const DeleteWidget()
        
        
      ],
    );
  }
}
