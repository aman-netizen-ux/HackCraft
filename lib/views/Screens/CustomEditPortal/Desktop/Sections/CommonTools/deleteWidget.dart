import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/views/Components/customToolWidget.dart';
import 'package:provider/provider.dart';

class DeleteWidget extends StatefulWidget {
  const DeleteWidget({super.key});

  @override
  State<DeleteWidget> createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return CustomToolWidget(
        message: "Delete",
        onTap: () {print("Im going to dlete you");
          customEditPortalProvider.deleteChildByKey(customEditPortalProvider.selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : customEditPortalProvider.selectedWidgetKey.toString(),);


                   customEditPortalProvider.dynamicWidgets = customEditPortalProvider
              .buildWidgetsFromJson(customEditPortalProvider.jsonObject);
          customEditPortalProvider.triggerUIUpdate();

          print("after deletion ${customEditPortalProvider.jsonObject}");
        },
        isWidgetClicked: false,
        child: const Icon(
         Icons.delete_rounded,
          color: Colors.red,
        ));
  }
}