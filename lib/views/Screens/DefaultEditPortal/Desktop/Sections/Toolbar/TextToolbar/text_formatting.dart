import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/customToolWidget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/letter_spacing_widget.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/TextToolbar/line_spacing_widget.dart';

class TextFormattingWidget extends StatelessWidget {
  const TextFormattingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomToolWidget(
          child: SvgPicture.asset("assets/icons/defaultEditPortal/alignLeft.svg"),
          message: "Align",
          onTap: () {
            print('align');
          },
        ),
        SizedBox(
          width: scaleWidth(context, 2),
        ),
        // CustomToolWidget(
        //   child: SvgPicture.asset("assets/icons/defaultEditPortal/.svg"),
        //   message: "List",
        //   onTap: () {
        //     print('bullets');
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