import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/separator.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/Canvas/custom_canvas.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/Canvas/CustomToolbar/custom_toolbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomStackedToolbar/custom_stacked_toolbar.dart';
import 'package:provider/provider.dart';

class CustomRightPanel extends StatefulWidget {
  const CustomRightPanel({super.key});

  @override
  State<CustomRightPanel> createState() => _CustomRightPanelState();
}

class _CustomRightPanelState extends State<CustomRightPanel> {
  @override
  Widget build(BuildContext context) {   
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(
          left: scaleWidth(context, 110),
          right: scaleWidth(context, 94),
          top: scaleHeight(context, 44)),
      decoration: const BoxDecoration(
          color: Color(0xff1e1e1e),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), bottomLeft: Radius.circular(40))),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 0774, child: Container()),
              Expanded(flex: 0528, child: Container()),
              const CustomCanvas(
                  // formKey: widget.formKey,
                  // textinput: widget.textinput,
                  )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.only(top: scaleHeight(context, 0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomToolBar(),
                    Visibility(visible: customEditPortalProvider.isColorSelected &&
                    customEditPortalProvider.selectedWidgetKey != null, child: const CustomStackedToolBar()),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                bottom: scaleHeight(context, 60),
              ),
              width: double.infinity, // Set the width to double.infinity
              child: const Separator(),
            ),
          )
        ],
      ),
    );
    // Container(
    //   height: scaleHeight(context, 820),
    //   decoration: const BoxDecoration(
    //     color : Color(0xff1e1e1e),
    //     borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomLeft: Radius.circular(40))
    //   ),
    //   child: Align(
    //       alignment: Alignment.topCenter,
    //       child: SingleChildScrollView(
    //           child: InkWell(
    //         onTap: () {
    //           customEditProvider.selectedWidgetKey = null;
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.all(100.0),
    //           child: Column(mainAxisAlignment: MainAxisAlignment.start, children:
    //               // [dynamicWidgets]

    //               [
    //             // ...customEditProvider.customWidgetList.mapIndexed((index,widget) => InkWell(
    //             //   onTap: (){
    //             //     print('index $index in right panel');
    //             //     final currentkey= customWidgetsGlobalKeysMap[
    //             //       index]!["globalKey"];
    //             //       print('currentkey: $currentkey');

    //             //       customEditProvider.selectedWidgetKey=currentkey;

    //             //       // final result= customEditProvider.checkAndChildByKey(currentkey.toString());
    //             //       // print('result: $result');

    //             //                       },
    //             //   child: widget)).toList(),

    //             //   Container(height:300, width:100, color:Colors.purple.shade300),

    //             ...customEditProvider.dynamicWidgets,

    //           ]),
    //         ),
    //       ))),
    // );
  }
}
