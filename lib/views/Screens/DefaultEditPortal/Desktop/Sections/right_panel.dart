import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/separator.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/canvas.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/StackedToolBar/stackedToolBar.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/toolbar.dart';
import 'package:provider/provider.dart';

class RightPanel extends StatefulWidget {
  RightPanel({super.key, required this.formKey, this.textinput});

  final GlobalKey<FormState> formKey;
  String? textinput;

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(
          left: scaleWidth(context, 110),
          right: scaleWidth(context, 94),
          top: scaleHeight(context, 44)),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
        color: grey4,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const ToolBar(),
              Expanded(flex: 0528, child: Container()),
              DefaultCanvas(
                formKey: widget.formKey,
                textinput: widget.textinput,
              )
            ],
          ),
          Visibility(
            visible: ((hackathonTextProvider.isBoldSelected ||
                        hackathonTextProvider.isTextColorSelected) &&
                    hackathonTextProvider.selectedTextFieldKey != null) ||
                (hackathonContainerPropertiesProvider
                        .activeIndex > -1 &&
                    hackathonContainerPropertiesProvider.selectedContainerKey !=
                        null),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: scaleHeight(context, 60)),
                  child: const StackedToolBar()),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                bottom: scaleHeight(context, 60),
              ),
              width: double.infinity, // Set the width to double.infinity
              child: const Separator(),
            ),
          )
        ],
      ),
    );
  }
}
