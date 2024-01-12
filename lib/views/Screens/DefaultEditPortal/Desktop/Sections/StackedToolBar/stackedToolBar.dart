import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/custom_colorPicker.dart';
import 'package:major_project__widget_testing/views/Components/custom_swatchPicker.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
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

    // TODO: logic to update
    //works fine when color-> bold but not on clicking on bold-> color
    return hackathonTextProvider.isBoldSelected
        ? const FontWeightPanelWidget()
        : hackathonTextProvider.isTextColorSelected
            ? const ColorPickerWidget()
            : Container();
  }
}

