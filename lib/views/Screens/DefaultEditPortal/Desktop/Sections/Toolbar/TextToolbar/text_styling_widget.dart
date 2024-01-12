import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/customToolWidget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/color_widget.dart';
import 'package:provider/provider.dart';

class TextStylingWidget extends StatelessWidget {
  const TextStylingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    return Row(
      children: [
        const ColorWidget(),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget(
          message: "Bold",
          onTap: () {
             hackathonTextProvider.setBoldSelection();
          },
          isWidgetClicked: true,  
          child: SvgPicture.asset("assets/icons/defaultEditPortal/bold.svg"),
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget(
          message: "Italics",
          onTap: () {
           hackathonTextProvider.toggleItalicsForSelectedTextField();
          },
          isWidgetClicked: hackathonTextProvider.selectedTextFieldKey != null ? 
          hackathonTextProvider.textFieldPropertiesMap[hackathonTextProvider.selectedTextFieldKey]!.italics : false,
          child: SvgPicture.asset("assets/icons/defaultEditPortal/italics.svg"),
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget( 
          message: "Underline",
          onTap: () {
            hackathonTextProvider.toggleUnderlineForSelectedTextField();
          },
          isWidgetClicked: hackathonTextProvider.selectedTextFieldKey != null ? 
          hackathonTextProvider.textFieldPropertiesMap[hackathonTextProvider.selectedTextFieldKey]!.underline : false,
          child: SvgPicture.asset("assets/icons/defaultEditPortal/underline.svg"),
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget( 
          message: "Strikethrough",
          onTap: () {
            hackathonTextProvider.toggleStrikeThroughForSelectedTextField();
          },
          isWidgetClicked: hackathonTextProvider.selectedTextFieldKey != null ? 
          hackathonTextProvider.textFieldPropertiesMap[hackathonTextProvider.selectedTextFieldKey]!.strikethrogh : false,
          child: SvgPicture.asset("assets/icons/defaultEditPortal/strikeThrough.svg"),
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget(
          message: "All Caps",
          child: SvgPicture.asset("assets/icons/defaultEditPortal/allCaps.svg"),
          onTap: () {
            hackathonTextProvider.toggleAllCapsForSelectedTextField();
          },
          isWidgetClicked: hackathonTextProvider.selectedTextFieldKey != null ? 
          hackathonTextProvider.textFieldPropertiesMap[hackathonTextProvider.selectedTextFieldKey]!.upperCase : false,
        ),
      ],
    );
  }
}