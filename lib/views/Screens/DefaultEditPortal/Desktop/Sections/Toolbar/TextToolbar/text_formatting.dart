import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/customToolWidget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/letter_spacing_widget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/line_spacing_widget.dart';
import 'package:provider/provider.dart';

class TextFormattingWidget extends StatelessWidget {
  const TextFormattingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    return Row(
      children: [
        CustomToolWidget(
          
  // **************** RIGHT NOW I HAVE COMMENTED THIS SVG ASSET, BUT AFTERWARDS THIS SVG WILL CHANGE INSTEAD OF ICON *****
          //SvgPicture.asset("assets/icons/defaultEditPortal/alignLeft.svg"),
          message: "Align",
          onTap: () {
            hackathonTextProvider.toggleTextAlignment();
          },
          isWidgetClicked: false,
          child: Icon(hackathonTextProvider.getAlignmentIcon(), color: Colors.white,)
        ),
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
        const LineSpacingWidget(),

        SizedBox(
          width: scaleWidth(context, 5),
        ),
        const LetterSpacingWidget()
      ],
    );
  }
}