import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:provider/provider.dart';

class CustomSidePanel extends StatefulWidget {
  const CustomSidePanel({super.key});

  @override
  State<CustomSidePanel> createState() => _CustomSidePanelState();
}

class _CustomSidePanelState extends State<CustomSidePanel> {
  @override
  Widget build(BuildContext context) {
    final customEditProvider = Provider.of<CustomEditPortal>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                print(
                    'containerlength before: ${customWidgetsGlobalKeysMap.length}');
                addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);

                print(
                    " global key  ${customWidgetsGlobalKeysMap[customWidgetsGlobalKeysMap.length - 1]!}");

                print(
                    " customEditProvider.selectedWidgetKey.toString() ${customEditProvider.selectedWidgetKey.toString()}");

                customEditProvider.addOrCheckChildByKey(
                    customWidgetsGlobalKeysMap[
                            customWidgetsGlobalKeysMap.length - 1]!
                        .toString(),
                    customWidgetsGlobalKeysMap.length - 1,
                    customEditProvider.selectedWidgetKey == null
                        ? customColumnKey.toString()
                        : customEditProvider.selectedWidgetKey.toString(),
                    "Container");

                print(customEditProvider.jsonObject);
                print(
                    'containerlength after : ${customWidgetsGlobalKeysMap.length}');
                print(
                    " customWidgetsGlobalKeysMap length ${customWidgetsGlobalKeysMap.length}");

                print("customWidgetsGlobalKeysMap $customWidgetsGlobalKeysMap");

                customEditProvider.dynamicWidgets = customEditProvider
                    .buildWidgetsFromJson(customEditProvider.jsonObject);
              },
              child: const Text('Container')),
          ElevatedButton(
              onPressed: () {
                addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);

                final isChildAdded = customEditProvider.addOrCheckChildByKey(
                    customWidgetsGlobalKeysMap[
                            customWidgetsGlobalKeysMap.length - 1]!
                        .toString(),
                    customWidgetsGlobalKeysMap.length - 1,
                    customEditProvider.selectedWidgetKey == null
                        ? customColumnKey.toString()
                        : customEditProvider.selectedWidgetKey.toString(),
                    "Text");
                customEditProvider.dynamicWidgets = customEditProvider
                    .buildWidgetsFromJson(customEditProvider.jsonObject);
                print(isChildAdded);

                print(
                    " customWidgetsGlobalKeysMap length ${customWidgetsGlobalKeysMap.length}");
                print("customWidgetsGlobalKeysMap $customWidgetsGlobalKeysMap");

                print(customEditProvider.jsonObject);
              },
              child: const Text('Text'))
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Row')),
          ElevatedButton(onPressed: () {}, child: const Text('Column'))
        ],
      )
    ]);
  }
}
