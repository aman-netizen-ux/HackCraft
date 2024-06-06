import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/api/post_default_hackathon.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/snackBar.dart';
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
            Row(
              children: [
                const CustomMenu(),
                SizedBox(
                  width: scaleWidth(context, 20),
                ),
                Expanded(
                  child: Container(
                      height: scaleHeight(context, 60),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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

                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search your component',
                                hintStyle: GoogleFonts.getFont(fontFamily2,
                                    fontSize: scaleWidth(context, 14),
                                    color: const Color(0xffffffff)
                                        .withOpacity(0.4),
                                    height: lineHeight(19.2, 14),
                                    fontWeight: FontWeight.w400),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
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

class CustomMenu extends StatelessWidget {
  const CustomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        offset: Offset(scaleWidth(context, 50), 0),
        onSelected: (String result) async {
          if (result == 'SavePreview') {
          } else if (result == 'Save') {
            //TODO
          } else if (result == 'Host') {
            // if (widget.formKey.currentState!.validate() &&
            //     galleryProvider.logoFile.isNotEmpty) {
            //   widget.formKey.currentState!.save();

            //   hostHackathon(
            //       rulesProvider,
            //       hackathonDetailsProvider,
            //       hackathonTextPropertiesProvider,
            //       hackathonContainerPropertiesProvider);
            // } else if (galleryProvider.logoFile.isEmpty) {
            //   print("logo fill kro");
            //   galleryProvider.logoError = true;
            // }

            debugPrint(" clicked on hackathon hosting");

            hostHackathon(context);
          } else {
            Navigator.pop(context);
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Back',
                child: Text('Back'),
              ),
              const PopupMenuItem<String>(
                value: 'Save',
                child: Text('Save and Back'),
              ),
              const PopupMenuItem<String>(
                value: 'SavePreview',
                child: Text('Preview'),
              ),
              const PopupMenuItem<String>(
                value: 'Host',
                child: Text('Host Hackathon'),
              ),
            ],
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ));
  }

  void hostHackathon(BuildContext context) async {
    debugPrint(" hola");
    final customEditPortalProvider =
        Provider.of<CustomEditPortal>(context, listen: false);
        final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context, listen: false);
    Timer? timer;
    timer = Timer(const Duration(seconds: 20), ()  {
      debugPrint(" hola from timer");
        if (hackathonDetailsProvider.loadingPostHackathon) {
        showSnackBar(
            "Error !! Hackthon not created",
            red2,
            const Icon(
              Icons.report_gmailerrorred_outlined,
              color: white,
            ),
            context);
      }
    });
    if (hackathonDetailsProvider.loadingPostHackathon) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
    }
      final hackathonId = await CreateHackathon().postCustomSingleHackathon(
        {
          "hackathon": {
            "created_by": "notebox101@gmail.com",
            "logo": "it is a logo",
            "name": "name",
            "organisation_name": "poll presents",
            "deadline": "2023-10-10",
            "team_size_min": 1,
            "team_size_max": 7,
            "start_date_time":
                "2023-10-10T00:00:00Z",
            "brief": "hackathonDetailsProvider.brief",
            "fee": "200",
            "total_number_rounds": 3
          },
          "custom": {
            "widget": {
              "id": 78,
              "key": customColumnKey.toString(),
              "children": customEditPortalProvider.jsonObject["children"],
            }
          }
        },
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
