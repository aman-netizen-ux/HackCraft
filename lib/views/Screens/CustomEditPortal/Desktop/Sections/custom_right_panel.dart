import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class CustomRightPanel extends StatefulWidget {
  const CustomRightPanel({super.key});

  @override
  State<CustomRightPanel> createState() => _CustomRightPanelState();
}

class _CustomRightPanelState extends State<CustomRightPanel> {
  @override
  Widget build(BuildContext context) {
    final customEditProvider = Provider.of<CustomEditPortal>(context);
      Widget dynamicWidgets = customEditProvider.buildWidgetsFromJson(customEditProvider.jsonObject);

    return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: InkWell(
              onTap: (){
                customEditProvider.selectedWidgetKey=null;
              },
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[dynamicWidgets]
                    
                    //  [
                    //   ...customEditProvider.customWidgetList.mapIndexed((index,widget) => InkWell(
                    //     onTap: (){
                    //       print('index $index in right panel');  
                    //       final currentkey= customWidgetsGlobalKeysMap[
                    //         index];
                    //         print('currentkey: $currentkey');
                
                    //         customEditProvider.selectedWidgetKey=currentkey;
                
                    //         // final result= customEditProvider.checkAndChildByKey(currentkey.toString());
                    //         // print('result: $result');
                          
                    //                         },
                    //     child: widget)).toList()
                    // ]
                    
                    
                    
                    ),
              ),
            )));
  }
}
