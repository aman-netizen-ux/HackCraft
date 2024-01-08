import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/font_size_widget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/font_widget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/text_formatting.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/text_styling_widget.dart';

class TextPropertiesPanelWidget extends StatelessWidget {
  const TextPropertiesPanelWidget({
    super.key,
    required this.hackathonTextProvider,
  });

  final HackathonTextPropertiesProvider hackathonTextProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // InkWell(
        //   onTap: () {
        //     final hackathonTextPropertiesProvider =
        //         Provider.of<HackathonTextPropertiesProvider>(context,
        //             listen: false);
        //     hackathonTextPropertiesProvider.increaseFontSize();
        //   },
        //   child: Container(
        //     height: 30,
        //     width: 30,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(8),
        //         color: Colors.white),
        //   ),
        // ),
        //SizedBox(width: scaleWidth(context, 20)),
        FontWidget(hackathonTextProvider: hackathonTextProvider),
        SizedBox(width: scaleWidth(context, 20)),
        const FontSizeWidget(),
        SizedBox(
          width: scaleWidth(context, 7),
        ),
        const TextStylingWidget(),
        Padding(
          padding: EdgeInsets.only(
              left: scaleWidth(context, 16), right: scaleWidth(context, 19)),
          child: const VerticalDivider(
            color: greyish3,
            width: 1,
            thickness: 1,
          ),
        ),

        const TextFormattingWidget(),
        // InkWell(
        //     onTap: () {
        //       //hackathonTextProvider.toggleUnderlineForSelectedTextField();
        //       hackathonTextProvider.setBoldSelection();
        //     },
        //     child: Icon(
        //       Icons.format_bold_sharp,
        //       color: hackathonTextProvider
        //               .isBoldSelected
        //           ? Colors.blue // Highlighted when underline is enabled
        //           : Colors.white,
        //     )),
        //     SizedBox(width: scaleWidth(context, 20)),
        // InkWell(
        //     onTap: () {
        //       hackathonTextProvider.toggleItalicsForSelectedTextField();
        //     },
        //     child: Icon(
        //       Icons.format_italic,
        //       color: hackathonTextProvider
        //               .isItalicsEnabledForSelectedTextField()
        //           ? Colors.blue // Highlighted when italics is enabled
        //           : Colors.white,
        //     )),
        // SizedBox(width: scaleWidth(context, 20)),
        // InkWell(
        //     onTap: () {
        //       hackathonTextProvider.toggleUnderlineForSelectedTextField();
        //     },
        //     child: Icon(
        //       Icons.format_underline,
        //       color: hackathonTextProvider
        //               .isUnderlineEnabledForSelectedTextField()
        //           ? Colors.blue // Highlighted when underline is enabled
        //           : Colors.white,
        //     ))
      ],
    );
  }
}