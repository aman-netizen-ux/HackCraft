import 'package:flutter/material.dart';

// import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';

import 'package:major_project__widget_testing/views/Components/customToolWidget.dart';
import 'package:provider/provider.dart';

class ContainerShapeTool extends StatefulWidget {
  const ContainerShapeTool({
    super.key,
  });

  @override
  State<ContainerShapeTool> createState() => _ContainerShapeToolState();
}

class _ContainerShapeToolState extends State<ContainerShapeTool> {
  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return CustomToolWidget(
        message: "Shape",
        onTap: () {
          customEditPortalProvider.toggleContainerShapeAlignment();
        },
        isWidgetClicked: false,
        child: Icon(
          customEditPortalProvider.getContainerShapeIcon(),
          color: Colors.white,
        ));
  }
}
