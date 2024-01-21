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
      ],
    );
  }
}