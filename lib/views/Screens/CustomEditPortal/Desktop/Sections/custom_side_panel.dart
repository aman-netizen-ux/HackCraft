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
                 print('containerlength before: ${customWidgetsGlobalKeysMap.length}');
                addCustomGlobalKeys(customEditProvider.customWidgetList.length);
                customEditProvider.updateWidgetList(InkWell(
                  onTap: (){
                    customWidgetsGlobalKeysMap[customEditProvider.customWidgetList.length];
                  },
                  child: Container(
                      key: customWidgetsGlobalKeysMap[
                          customEditProvider.customWidgetList.length],
                      height: 300,
                      width: 300,
                      color: Colors.amberAccent),
                ));
                  print('containerlength after : ${customWidgetsGlobalKeysMap.length}');
              },
              child: const Text('Container')),
          ElevatedButton(
              onPressed: () {
                customEditProvider
                    .updateWidgetList(const Text('Custom Edit text is here'));
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
