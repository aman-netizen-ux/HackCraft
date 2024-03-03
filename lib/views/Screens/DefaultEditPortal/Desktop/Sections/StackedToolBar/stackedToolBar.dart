import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/StackedToolBar/ContainerStackedToolBar/container_colorPicker_widget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/StackedToolBar/TextStackedToolBar/colorPicker_Widget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/StackedToolBar/TextStackedToolBar/fontWeight_Panel_Widget.dart';
import 'package:provider/provider.dart';

class StackedToolBar extends StatefulWidget {
  const StackedToolBar({super.key});

  @override
  State<StackedToolBar> createState() => _StackedToolBarState();
}

class _StackedToolBarState extends State<StackedToolBar> {
  
  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

        final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);

    // TODO: logic to update
    //works fine when color-> bold but not on clicking on bold-> color
    return hackathonTextProvider.isBoldSelected
        ? const FontWeightPanelWidget()
        : hackathonTextProvider.isTextColorSelected
            ? const ColorPickerWidget()
            : hackathonContainerPropertiesProvider.activeIndex > -1 ? const ContainerColorPickerWidget() : Container();
  }
}

