import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/customToolWidget.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_color_widget.dart';
import 'package:provider/provider.dart';

class CustomTextStylingWidget extends StatelessWidget {
  const CustomTextStylingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final hackathonTextProvider =
    //     Provider.of<HackathonTextPropertiesProvider>(context);

    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomColorWidget(),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget(
          message: "Bold",
          onTap: () {
            customEditPortalProvider.setBoldSelection();
            // TODO: Need to do this thing
            // if (customEditPortalProvider.isTextColorSelected) {
            //   customEditPortalProvider.setIsTextColorSelected();
            // }
            if (customEditPortalProvider.isColorPickerSelected) {
              customEditPortalProvider.setIsColorPickerSelected();
            }
          },
          isWidgetClicked: customEditPortalProvider.isBoldSelected,
          child: customEditPortalProvider.selectedWidgetKey == null
              ? SvgPicture.asset("assets/icons/defaultEditPortal/bold.svg")
              : SvgPicture.asset(
                  "assets/icons/defaultEditPortal/boldIcons/bold${(customEditPortalProvider.getPropertyValue(
          customEditPortalProvider.jsonObject,
          customEditPortalProvider.selectedWidgetKey.toString(),
          "fontWeight")) / 100}.svg"),
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget(
          message: "Italics",
          onTap: () {
            //hackathonTextProvider.toggleItalicsForSelectedTextField();
            customEditPortalProvider.addPropertyByKey(
                customEditPortalProvider.selectedWidgetKey == null
                    ? customColumnKey.toString()
                    : customEditPortalProvider.selectedWidgetKey.toString(),
                "italics",
                !customEditPortalProvider.getPropertyValue(
                    customEditPortalProvider.jsonObject,
                    customEditPortalProvider.selectedWidgetKey.toString(),
                    "italics"));
          },
          isWidgetClicked: customEditPortalProvider.selectedWidgetKey != null
              ? customEditPortalProvider.getPropertyValue(
                  customEditPortalProvider.jsonObject,
                  customEditPortalProvider.selectedWidgetKey.toString(),
                  "italics")
              : false,
          child: SvgPicture.asset("assets/icons/defaultEditPortal/italics.svg"),
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget(
          message: "Underline",
          onTap: () {
            customEditPortalProvider.addPropertyByKey(
                customEditPortalProvider.selectedWidgetKey == null
                    ? customColumnKey.toString()
                    : customEditPortalProvider.selectedWidgetKey.toString(),
                "underline",
                !customEditPortalProvider.getPropertyValue(
                    customEditPortalProvider.jsonObject,
                    customEditPortalProvider.selectedWidgetKey.toString(),
                    "underline"));
          },
          isWidgetClicked: customEditPortalProvider.selectedWidgetKey != null
              ? customEditPortalProvider.getPropertyValue(
                  customEditPortalProvider.jsonObject,
                  customEditPortalProvider.selectedWidgetKey.toString(),
                  "underline")
              : false,
          child:
              SvgPicture.asset("assets/icons/defaultEditPortal/underline.svg"),
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget(
          message: "Strikethrough",
          onTap: () {
            customEditPortalProvider.addPropertyByKey(
                customEditPortalProvider.selectedWidgetKey == null
                    ? customColumnKey.toString()
                    : customEditPortalProvider.selectedWidgetKey.toString(),
                "strikethrough",
                !customEditPortalProvider.getPropertyValue(
                    customEditPortalProvider.jsonObject,
                    customEditPortalProvider.selectedWidgetKey.toString(),
                    "strikethrough"));
          },
          isWidgetClicked: customEditPortalProvider.selectedWidgetKey != null
              ? customEditPortalProvider.getPropertyValue(
                  customEditPortalProvider.jsonObject,
                  customEditPortalProvider.selectedWidgetKey.toString(),
                  "strikethrough")
              : false,
          child: SvgPicture.asset(
              "assets/icons/defaultEditPortal/strikeThrough.svg"),
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        CustomToolWidget(
          message: "All Caps",
          onTap: () {
            customEditPortalProvider.addPropertyByKey(
                customEditPortalProvider.selectedWidgetKey == null
                    ? customColumnKey.toString()
                    : customEditPortalProvider.selectedWidgetKey.toString(),
                "uppercase",
                !customEditPortalProvider.getPropertyValue(
                    customEditPortalProvider.jsonObject,
                    customEditPortalProvider.selectedWidgetKey.toString(),
                    "uppercase"));
          },
          isWidgetClicked: customEditPortalProvider.selectedWidgetKey != null
              ? customEditPortalProvider.getPropertyValue(
                  customEditPortalProvider.jsonObject,
                  customEditPortalProvider.selectedWidgetKey.toString(),
                  "uppercase")
              : false,
          child: SvgPicture.asset("assets/icons/defaultEditPortal/allCaps.svg"),
        ),
      ],
    );
  }
}
