import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/ContainerToolbar/container_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/text_toolbar.dart';
import 'package:provider/provider.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({super.key});

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    return Expanded(
      flex: 0774,
      child: Container(
          height: scaleHeight(context, 60),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: scaleHeight(context, 11.5),
              horizontal: scaleWidth(context, 20)),
          decoration: BoxDecoration(
              color: grey3,
              borderRadius: BorderRadius.circular(rad5_2),
              border: Border.all(color: greyish3)),
          child: hackathonTextProvider.selectedTextFieldKey!=null
          ? TextPropertiesPanelWidget(hackathonTextProvider: hackathonTextProvider)
          : hackathonContainerPropertiesProvider.selectedContainerKey != null ? ContainerPropertiesPanelWidget(hackathonContainerProvider: hackathonContainerPropertiesProvider,) : null),
    );
  }
}






