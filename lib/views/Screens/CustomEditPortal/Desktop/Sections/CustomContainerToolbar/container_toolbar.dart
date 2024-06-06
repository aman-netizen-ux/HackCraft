import 'package:flutter/material.dart';
// import 'package:major_project__widget_testing/constants/enums.dart';
// import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/alignmnettool.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/marginTool.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CommonTools/padding_tool.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/custom_container_bg_color.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/custom_container_height_widget.dart'; import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomContainerToolbar/custom_container_width.dart';
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
    return Row(
      children: [
        const CustomContainerHeightWidget(),
         SizedBox(width: scaleWidth(context, 20)),
         const CustomContainerWidthWidget(),
         SizedBox(width: scaleWidth(context, 20)),
         const CustomContainerBgColorWidget(),
         SizedBox(width: scaleWidth(context, 20)),
         const PaddingTool(),
          SizedBox(width: scaleWidth(context, 20)),
         const MarginTool(),
            SizedBox(width: scaleWidth(context, 20)),
         const AlignmentTool()
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
