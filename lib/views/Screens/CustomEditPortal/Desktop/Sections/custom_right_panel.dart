import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:provider/provider.dart';

class CustomRightPanel extends StatefulWidget {
  const CustomRightPanel({super.key});

  @override
  State<CustomRightPanel> createState() => _CustomRightPanelState();
}

class _CustomRightPanelState extends State<CustomRightPanel> {
  @override
  Widget build(BuildContext context) {
    final customEditProvider = Provider.of<CustomEditPortal>(context);
    return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: customEditProvider.customWidgetList)));
  }
}
