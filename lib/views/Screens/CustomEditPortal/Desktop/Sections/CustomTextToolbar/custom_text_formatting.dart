import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/customToolWidget.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_letter_spacing_widget.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_line_spacing_widget.dart';
import 'package:provider/provider.dart';

class CustomTextFormattingWidget extends StatelessWidget {
  const CustomTextFormattingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomToolWidget(

            // **************** RIGHT NOW I HAVE COMMENTED THIS SVG ASSET, BUT AFTERWARDS THIS SVG WILL CHANGE INSTEAD OF ICON *****
            //SvgPicture.asset("assets/icons/defaultEditPortal/alignLeft.svg"),
            message: "Align",
            onTap: () {
              customEditPortalProvider.toggleTextAlignment();
              customEditPortalProvider.dynamicWidgets =
                      customEditPortalProvider.buildWidgetsFromJson(
                          customEditPortalProvider.jsonObject);
            },
            isWidgetClicked: false,
            child: Icon(
              customEditPortalProvider.getAlignmentIcon(),
              color: Colors.white,
            )),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        // CustomToolWidget(
        //   child: SvgPicture.asset("assets/icons/defaultEditPortal/.svg"),
        //   message: "List",
        //   onTap: () {
        //     var logger = Logger();
        //     logger.i('bullets');
        //   },
        // ),
        // SizedBox(
        //   width: scaleWidth(context, 2),
        // ),
        const CustomLineSpacingWidget(), //line height

        SizedBox(
          width: scaleWidth(context, 5),
        ),
        const CustomLetterSpacingWidget()
      ],
    );
  }
}
