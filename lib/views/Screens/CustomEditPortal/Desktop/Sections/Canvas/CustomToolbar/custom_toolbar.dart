import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomColumnToolbar/custom_column_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/container_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomDivider/custom_divider_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomRowToolbar/custom_row_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_text_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomVerticalDivider/custom_vertical_divider_toolbar.dart';
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
                    customEditPortalProvider.selectedWidgetType == "Text" ||
                customEditPortalProvider.selectedWidgetType == "Deadline" ||
                customEditPortalProvider.selectedWidgetType ==
                    "Hackathon Name" ||
                customEditPortalProvider.selectedWidgetType ==
                    "Organization Name" ||
                customEditPortalProvider.selectedWidgetType == "Start Date" ||
                customEditPortalProvider.selectedWidgetType == "Fee" ||
                customEditPortalProvider.selectedWidgetType == "Brief" || customEditPortalProvider.selectedWidgetType == "Total Rounds"
            ? const CustomTextPropertiesPanelWidget()
            : customEditPortalProvider.selectedWidgetKey != null &&
                    customEditPortalProvider.selectedWidgetType == "Container"
                ? const CustomContainerPropertiesPanelWidget()
                : customEditPortalProvider.selectedWidgetKey != null &&
                        customEditPortalProvider.selectedWidgetType == "Row"
                    ? const CustomRowPropertiesPanelWidget()
                    : customEditPortalProvider.selectedWidgetType == "Column"
                        ? const CustomColumnPropertiesPanelWidget()
                        : customEditPortalProvider.selectedWidgetType ==
                                "Divider"
                            ? const CustomDividerPropertiesPanelWidget()
                            : customEditPortalProvider.selectedWidgetType ==
                                    "VerticalDivider"
                                ? const CustomVerticalDividerPropertiesPanelWidget()
                                : Container(
                                    height: scaleHeight(context, 30),
                                  ));
  }
}
