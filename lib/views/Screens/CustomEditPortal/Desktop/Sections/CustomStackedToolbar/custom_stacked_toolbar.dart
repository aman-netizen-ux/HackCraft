import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/color_picker_widget.dart';
import 'package:provider/provider.dart';

class CustomStackedToolBar extends StatefulWidget {
  const CustomStackedToolBar({super.key});

  @override
  State<CustomStackedToolBar> createState() => _CustomStackedToolBarState();
}

class _CustomStackedToolBarState extends State<CustomStackedToolBar> {
  
  @override
  Widget build(BuildContext context) {
    // final hackathonTextProvider =
    //     Provider.of<HackathonTextPropertiesProvider>(context);

    //     final hackathonContainerPropertiesProvider =
    //     Provider.of<HackathonContainerPropertiesProvider>(context);
        final customEditPortalProvider = Provider.of<CustomEditPortal>(context);

    // TODO: logic to update
    //works fine when color-> bold but not on clicking on bold-> color
    return 
    // hackathonTextProvider.isBoldSelected
    //     ? const FontWeightPanelWidget()
        //: 
       customEditPortalProvider.isColorSelected
            ? const CustomColorPickerWidget()
            : Container();
            //hackathonContainerPropertiesProvider.activeIndex > -1 ? const ContainerColorPickerWidget() : Container();
  }
}

