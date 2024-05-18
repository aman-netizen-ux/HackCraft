import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:provider/provider.dart';

class CustomCanvas extends StatefulWidget {
  const CustomCanvas({super.key});

  @override
  State<CustomCanvas> createState() => _CustomCanvasState();
}

class _CustomCanvasState extends State<CustomCanvas> {
  @override
  Widget build(BuildContext context) {
    final customEditProvider = Provider.of<CustomEditPortal>(context);
    return Expanded(
       flex: 8698,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: InkWell(
                onTap: () {
                  customEditProvider.selectedWidgetKey = null;
                },
                child: Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...customEditProvider.dynamicWidgets,
                      ],
                    )))),
      ),
    );
  }
}
