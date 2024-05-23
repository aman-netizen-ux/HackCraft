import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class CustomSidePanel extends StatefulWidget {
  const CustomSidePanel({super.key});

  @override
  State<CustomSidePanel> createState() => _CustomSidePanelState();
}

class _CustomSidePanelState extends State<CustomSidePanel> {
  final List<String> widgets = [
    "Container",
    "Text",
    "Row",
    "Column",
    "Divider",
    "VerticalDivider",
    "Icon",
    "Wrap",
    "Spacer",
    "Image",
    "CircleImage",
    "SvgPicture",
    "Timeline",
    "FlippableCard",
    "VideoPlayer",
    "PDFViewer",
    "Tabbar"
  ];
  @override
  Widget build(BuildContext context) {
    final customEditProvider = Provider.of<CustomEditPortal>(context);
    return Column(
      children: [
        Container(
          color: const Color(0xff313030),
          height: scaleHeight(context, 820),
          padding: EdgeInsets.only(
              top: scaleHeight(context, 45),
              left: scaleWidth(context, 24),
              right: scaleWidth(context, 24)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                height: scaleHeight(context, 60),
                width: scaleWidth(context, 253),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: const Color(0xff2c2c2c),
                    border: Border.all(color: const Color(0xff5a5959))),
                padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(context, 14),
                    vertical: scaleHeight(context, 18)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     //SvgPicture.asset('assets/icons/defaultEditPortal/Menu.svg',height: scaleHeight(context, 29), width: scaleWidth(context, 30)),
                    // SizedBox(width: scaleWidth(context, 7)),
                    SizedBox(
                      width: scaleWidth(context, 163),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search your component',
                          hintStyle: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleWidth(context, 14),
                              color: const Color(0xffffffff).withOpacity(0.4),
                              height: lineHeight(19.2, 14),
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                )),
            SizedBox(height: scaleHeight(context, 30)),
            //  ElevatedButton(onPressed: (){
              
            //   customEditProvider.addPropertyByKey(customEditProvider.selectedWidgetKey == null ? customColumnKey.toString() : customEditProvider.selectedWidgetKey.toString(), 'mainAxisAlignment', MainAxisAlignment.center);
            //   customEditProvider.dynamicWidgets = customEditProvider.buildWidgetsFromJson(customEditProvider.jsonObject);
            //   debugPrint('dynamic widgets : ${customEditProvider.dynamicWidgets}');
            //  }, child: Text('UPDATE')),
            SizedBox(
              height: scaleHeight(context, 680),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: scaleWidth(
                        context, 13), // Horizontal space between items
                    mainAxisSpacing: scaleHeight(
                        context, 12), // Vertical space between items
                  ),
                  itemCount: widgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildWidgetContainer(
                        context, widgets[index], widgets[index], "");
                  }),
            ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             log('containerlength before: ${customWidgetsGlobalKeysMap.length}');
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);

            //             log(" global key  ${customWidgetsGlobalKeysMap[customWidgetsGlobalKeysMap.length - 1]!}");

            //             log(" customEditProvider.selectedWidgetKey.toString() ${customEditProvider.selectedWidgetKey.toString()}");

            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Container");

            //             log('json opbject : ${customEditProvider.jsonObject}');
            //             log('containerlength after : ${customWidgetsGlobalKeysMap.length}');
            //             log(" customWidgetsGlobalKeysMap length ${customWidgetsGlobalKeysMap.length}");

            //             log("customWidgetsGlobalKeysMap $customWidgetsGlobalKeysMap");

            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Container')),
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);

            //             final isChildAdded =
            //                 customEditProvider.addOrCheckChildByKey(
            //                     customWidgetsGlobalKeysMap[
            //                             customWidgetsGlobalKeysMap.length - 1]!
            //                         .toString(),
            //                     customWidgetsGlobalKeysMap.length - 1,
            //                     customEditProvider.selectedWidgetKey == null
            //                         ? customColumnKey.toString()
            //                         : customEditProvider.selectedWidgetKey
            //                             .toString(),
            //                     "Text");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //             log(' child added ? $isChildAdded}');

            //             log(" customWidgetsGlobalKeysMap length ${customWidgetsGlobalKeysMap.length}");
            //             log("customWidgetsGlobalKeysMap $customWidgetsGlobalKeysMap");

            //             log(' json at 85 in side panel : ${customEditProvider.jsonObject}');
            //           },
            //           child: const Text('Text'))
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Row");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Row')),
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Column");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Column'))
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Divider");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Divider')),
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "VerticalDivider");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('VerticalDivider'))
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Icon");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Icon')),
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Wrap");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Wrap'))
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Spacer");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Spacer')),
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Image");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Image'))
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "CircleImage");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('CircleImage')),
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "SvgPicture");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('SvgPicture'))
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Timeline");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Timeline')),
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "FlippableCard");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('FlippableCard'))
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "VideoPlayer");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('VideoPlayer')),
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "PDFViewer");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('PDFViewer'))
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //             customEditProvider.addOrCheckChildByKey(
            //                 customWidgetsGlobalKeysMap[
            //                         customWidgetsGlobalKeysMap.length - 1]!
            //                     .toString(),
            //                 customWidgetsGlobalKeysMap.length - 1,
            //                 customEditProvider.selectedWidgetKey == null
            //                     ? customColumnKey.toString()
            //                     : customEditProvider.selectedWidgetKey
            //                         .toString(),
            //                 "Tabbar");
            //             customEditProvider.dynamicWidgets =
            //                 customEditProvider.buildWidgetsFromJson(
            //                     customEditProvider.jsonObject);
            //           },
            //           child: const Text('Tabbar')),
            //       // ElevatedButton(onPressed: () {

            //       //    addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            //       //   customEditProvider.addOrCheckChildByKey(
            //       //           customWidgetsGlobalKeysMap[
            //       //                   customWidgetsGlobalKeysMap.length - 1]!
            //       //               .toString(),
            //       //           customWidgetsGlobalKeysMap.length - 1,
            //       //           customEditProvider.selectedWidgetKey == null
            //       //               ? customColumnKey.toString()
            //       //               : customEditProvider.selectedWidgetKey.toString(),
            //       //           "FlippableCard");
            //       //           customEditProvider.dynamicWidgets = customEditProvider
            //       //           .buildWidgetsFromJson(customEditProvider.jsonObject);
            //       // }, child: const Text('FlippableCard'))
            //     ],
            //   ),
          ]),
        ),

        //  Expanded(flex:1,child: SingleChildScrollView(child: Column(
        //    children: [
        //      SelectableText(customEditProvider.jsonObject.toString()),
            
        //    ],
        //  )))
      ],
    );
  }
}

Widget buildWidgetContainer(
    BuildContext context, String widgetType, String label, String icon) {
  final customEditProvider = Provider.of<CustomEditPortal>(context);
  return InkWell(
    onTap: () {
      log('containerlength before: ${customWidgetsGlobalKeysMap.length}');
      addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);

      log(" global key  ${customWidgetsGlobalKeysMap[customWidgetsGlobalKeysMap.length - 1]!}");

      log(" customEditProvider.selectedWidgetKey.toString() ${customEditProvider.selectedWidgetKey.toString()}");

      customEditProvider.addOrCheckChildByKey(
          customWidgetsGlobalKeysMap[customWidgetsGlobalKeysMap.length - 1]!
              .toString(),
          customWidgetsGlobalKeysMap.length - 1,
          customEditProvider.selectedWidgetKey == null
              ? customColumnKey.toString()
              : customEditProvider.selectedWidgetKey.toString(),
          widgetType);

      log('json opbject : ${customEditProvider.jsonObject}');
      log('containerlength after : ${customWidgetsGlobalKeysMap.length}');
      log(" customWidgetsGlobalKeysMap length ${customWidgetsGlobalKeysMap.length}");

      log("customWidgetsGlobalKeysMap $customWidgetsGlobalKeysMap");

      customEditProvider.dynamicWidgets = customEditProvider
          .buildWidgetsFromJson(customEditProvider.jsonObject);
    },
    child: Container(
      height: scaleHeight(context, 111),
      width: scaleWidth(context, 120),
      decoration: BoxDecoration(
        color: const Color(0xff373636),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
