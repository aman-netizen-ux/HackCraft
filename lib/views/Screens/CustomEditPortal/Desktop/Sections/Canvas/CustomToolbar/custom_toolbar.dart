import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/container_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomRowToolbar/custom_row_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_text_toolbar.dart';
import 'package:provider/provider.dart';

class CustomToolBar extends StatefulWidget {
  const CustomToolBar({super.key});

  @override
  State<CustomToolBar> createState() => _CustomToolBarState();
}

class _CustomToolBarState extends State<CustomToolBar> {
  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return Container(
        //height: scaleHeight(context, 60),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: scaleHeight(context, 11.5),
            horizontal: scaleWidth(context, 20)),
        decoration: BoxDecoration(
            color: grey3,
            borderRadius: BorderRadius.circular(rad5_2),
            border: Border.all(color: greyish3)),
        child: customEditPortalProvider.selectedWidgetKey != null &&
                customEditPortalProvider.selectedWidgetType == "Text"
            ? const CustomTextPropertiesPanelWidget()
            : customEditPortalProvider.selectedWidgetKey != null &&
                    customEditPortalProvider.selectedWidgetType == "Container"
                ? const CustomContainerPropertiesPanelWidget()
                : customEditPortalProvider.selectedWidgetKey != null &&
                    customEditPortalProvider.selectedWidgetType == "Row"
                ?  const CustomRowPropertiesPanelWidget() : Container(
                    height: 100, width: 100, color: Colors.deepPurpleAccent));
  }
}
