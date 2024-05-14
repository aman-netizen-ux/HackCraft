import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Column(
      children: [
        Expanded(
          flex:1,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        log(
                            'containerlength before: ${customWidgetsGlobalKeysMap.length}');
                        addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            
                        log(
                            " global key  ${customWidgetsGlobalKeysMap[customWidgetsGlobalKeysMap.length - 1]!}");
            
                        log(
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
            
                        log('json opbject : ${customEditProvider.jsonObject}');
                        log(
                            'containerlength after : ${customWidgetsGlobalKeysMap.length}');
                        log(
                            " customWidgetsGlobalKeysMap length ${customWidgetsGlobalKeysMap.length}");
            
                        log("customWidgetsGlobalKeysMap $customWidgetsGlobalKeysMap");
            
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
                        log(' child added ? $isChildAdded}');
            
                        log(
                            " customWidgetsGlobalKeysMap length ${customWidgetsGlobalKeysMap.length}");
                        log("customWidgetsGlobalKeysMap $customWidgetsGlobalKeysMap");
            
                        log(' json at 85 in side panel : ${customEditProvider.jsonObject}');
                      },
                      child: const Text('Text'))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Row");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Row')),
                  ElevatedButton(onPressed: () {
            
                     addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Column");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Column'))
                ],
              ),
            const SizedBox(height: 10),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Divider");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Divider')),
                  ElevatedButton(onPressed: () {
            
                     addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "VerticalDivider");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('VerticalDivider'))
                ],
              ),
            
              const SizedBox(height: 10),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Icon");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Icon')),
                  ElevatedButton(onPressed: () {
            
                     addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Wrap");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Wrap'))
                ],
              ),
            const SizedBox(height: 10),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Spacer");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Spacer')),
                  ElevatedButton(onPressed: () {
            
                     addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Image");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Image'))
                ],
              ),
            
            
               const SizedBox(height: 10),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "CircleImage");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('CircleImage')),
                  ElevatedButton(onPressed: () {
            
                     addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "SvgPicture");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('SvgPicture'))
                ],
              ),
            
            
            
               const SizedBox(height: 10),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Timeline");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Timeline')),
                  ElevatedButton(onPressed: () {
            
                     addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "FlippableCard");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('FlippableCard'))
                ],
              ),
            
            
            
              const SizedBox(height: 10),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "VideoPlayer");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('VideoPlayer')),
                  ElevatedButton(onPressed: () {
            
                     addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "PDFViewer");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('PDFViewer'))
                ],
              ),
            
            
            const SizedBox(height: 10),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                    customEditProvider.addOrCheckChildByKey(
                            customWidgetsGlobalKeysMap[
                                    customWidgetsGlobalKeysMap.length - 1]!
                                .toString(),
                            customWidgetsGlobalKeysMap.length - 1,
                            customEditProvider.selectedWidgetKey == null
                                ? customColumnKey.toString()
                                : customEditProvider.selectedWidgetKey.toString(),
                            "Tabbar");
                            customEditProvider.dynamicWidgets = customEditProvider
                            .buildWidgetsFromJson(customEditProvider.jsonObject);
                  }, child: const Text('Tabbar')),
                  // ElevatedButton(onPressed: () {
            
                  //    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
                  //   customEditProvider.addOrCheckChildByKey(
                  //           customWidgetsGlobalKeysMap[
                  //                   customWidgetsGlobalKeysMap.length - 1]!
                  //               .toString(),
                  //           customWidgetsGlobalKeysMap.length - 1,
                  //           customEditProvider.selectedWidgetKey == null
                  //               ? customColumnKey.toString()
                  //               : customEditProvider.selectedWidgetKey.toString(),
                  //           "FlippableCard");
                  //           customEditProvider.dynamicWidgets = customEditProvider
                  //           .buildWidgetsFromJson(customEditProvider.jsonObject);
                  // }, child: const Text('FlippableCard'))
                ],
              ),
            
            
              
            
             
            ]),
          ),


        ),

         Expanded(flex:1,child: SingleChildScrollView(child: Column(
           children: [
             SelectableText(customEditProvider.jsonObject.toString()),
             ElevatedButton(onPressed: (){
              
             }, child: Text('UPDATE'))
           ],
         )))
      ],
    );
  }
}
