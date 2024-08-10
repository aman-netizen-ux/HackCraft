import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
// import 'package:major_project__widget_testing/constants/enums.dart';
// import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/alignmnettool.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/deleteWidget.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/marginTool.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/padding_tool.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/container_border_width.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/continer_shape.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/custom_container_bg_color.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/custom_container_height_widget.dart'; import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/custom_container_width.dart';
import 'package:provider/provider.dart';
// import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/ContainerToolbar/container_bg_color.dart';
// import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/ContainerToolbar/container_blur_radius.dart';
// import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/ContainerToolbar/container_border_radius.dart';
// import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/ContainerToolbar/container_border_width.dart';
// import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/ContainerToolbar/container_size_widget.dart';

class CustomContainerPropertiesPanelWidget extends StatelessWidget {
  const CustomContainerPropertiesPanelWidget({
    super.key,
    //required this.hackathonContainerProvider,
  });

  //final HackathonContainerPropertiesProvider hackathonContainerProvider;

  @override
  Widget build(BuildContext context) {
     final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    String shape= customEditPortalProvider.getPropertyValue(
              customEditPortalProvider.jsonObject,
              customEditPortalProvider.selectedWidgetKey.toString(),
             "shape");

             print("shapeeeeeee$shape");
    return Wrap(
      children: [
        const   ContainerShapeTool(),
         SizedBox(width: scaleWidth(context, 20)),
       
         CustomContainerHeightWidget(title: shape=="circle"?"Diameter": "Container Height"),
         SizedBox(width: scaleWidth(context, 20)),
        shape=="circle"?  Container():const CustomContainerWidthWidget(property: "width",title: "Container Width",),
          shape=="circle"? Container():SizedBox(width: scaleWidth(context, 20)),
         const CustomContainerBgColorWidget(
          index: 0,
          property: "color",
          title: "Container Color",
         ),
         SizedBox(width: scaleWidth(context, 20)),
         const PaddingTool(),
          SizedBox(width: scaleWidth(context, 20)),
         const MarginTool(),
            SizedBox(width: scaleWidth(context, 20)),
         const AlignmentTool(),
        //  SizedBox(width: scaleWidth(context, 20)),
        //  const ContainerBorderWidthWidget(),
         SizedBox(width: scaleWidth(context, 20)),
         const CustomContainerWidthWidget(property: "borderWidth",title: "Border Width" ,),
        shape=="circle"?  Container():  SizedBox(width: scaleWidth(context, 20)),
         shape=="circle"?  Container():const CustomContainerWidthWidget(property: "borderRadius",title: "Border Radius" ,),

         SizedBox(width: scaleWidth(context, 20)),
         
       const CustomContainerBgColorWidget(
          index: 1,
          property: "borderColor",
          title: "Border Color",
         ),


          SizedBox(width: scaleWidth(context, 20)),
         
       const CustomContainerBgColorWidget(
          index: 2,
          property: "shadowColor",
          title: "Shadow Color",
         ),
         SizedBox(width: scaleWidth(context, 20)),
const DeleteWidget()

         
      ],
    );
    // int colorNumber = hackathonContainerProvider.countElements(
    //     hackathonContainerProvider
    //         .containerPropertiesMap[
    //             hackathonContainerProvider.selectedContainerKey]!
    //         .color);


    // int borderColorCount = hackathonContainerProvider.countElements(
    //                 hackathonContainerProvider
    //                     .containerPropertiesMap[
    //                         hackathonContainerProvider.selectedContainerKey]!
    //                     .borderColor);
    // return Row(
    //   children: [
    //     const ContainerBorderWidthWidget(),
    //     SizedBox(width: scaleWidth(context, 20)),
    //     const ContainerSizeWidget(),
    //     SizedBox(width: scaleWidth(context, 20)),
    //     Row(
    //         children: List.generate(
    //             hackathonContainerProvider.countElements(
    //                 hackathonContainerProvider
    //                     .containerPropertiesMap[
    //                         hackathonContainerProvider.selectedContainerKey]!
    //                     .color), (index) {
    //       return ContainerBgColorWidget(
    //           colorIndex: index,
    //           type: ContainerColorProperties.containerColor,
    //           index: index);
    //     })),
    //     SizedBox(width: scaleWidth(context, 20)),
    //     const ContainerBorderRadiusWidget(),
    //     SizedBox(width: scaleWidth(context, 20)),
    //     const ContainerBlurRadiusWidget(),
    //     SizedBox(width: scaleWidth(context, 20)),
    //     Row(
    //         children: List.generate(
    //             hackathonContainerProvider.countElements(
    //                 hackathonContainerProvider
    //                     .containerPropertiesMap[
    //                         hackathonContainerProvider.selectedContainerKey]!
    //                     .borderColor), (index) {
    //       return ContainerBgColorWidget(
    //           colorIndex: index,
    //           type: ContainerColorProperties.containerBorderColor,
    //           index: colorNumber + index );
    //     })),

    //     SizedBox(width: scaleWidth(context, 20)),
    //     Row(
    //         children: List.generate(
    //             hackathonContainerProvider.countElements(
    //                 hackathonContainerProvider
    //                     .containerPropertiesMap[
    //                         hackathonContainerProvider.selectedContainerKey]!
    //                     .focusedBorderColor), (index) {
    //       return ContainerBgColorWidget(
    //           colorIndex: index,
    //           type: ContainerColorProperties.containerFocusedBorderColor,
    //           index: colorNumber + borderColorCount);
    //     })),

    //     SizedBox(width: scaleWidth(context, 20)),
    //     Row(
    //         children: List.generate(
    //             hackathonContainerProvider.countElements(
    //                 hackathonContainerProvider
    //                     .containerPropertiesMap[
    //                         hackathonContainerProvider.selectedContainerKey]!
    //                     .boxShadowColor), (index) {
    //       return ContainerBgColorWidget(
    //           colorIndex: index,
    //           type: ContainerColorProperties.boxShadowColor,
    //           index: colorNumber + borderColorCount +1);
    //     })),

    //     // SizedBox(
    //     //   width: scaleWidth(context, 7),
    //     // ),
    //     // const TextStylingWidget(),
    //     // Padding(
    //     //   padding: EdgeInsets.only(
    //     //       left: scaleWidth(context, 16), right: scaleWidth(context, 19)),
    //     //   child: const VerticalDivider(
    //     //     color: greyish3,
    //     //     width: 1,
    //     //     thickness: 1,
    //     //   ),
    //     // ),

    //     // const TextFormattingWidget(),
    //   ],
    // );
  }
}
