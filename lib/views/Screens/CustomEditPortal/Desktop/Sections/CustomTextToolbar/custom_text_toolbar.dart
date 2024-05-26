import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_font_size_widget.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_font_widget.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_text_formatting.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/CustomTextToolbar/custom_text_styling_widget.dart';

class CustomTextPropertiesPanelWidget extends StatelessWidget {
  const CustomTextPropertiesPanelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        //FontWidget(hackathonTextProvider: hackathonTextProvider),
        const CustomFontSizeWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        const CustomFontWidget(),
        // const FontSizeWidget(),
        SizedBox(
          width: scaleWidth(context, 20),
        ),
        // const CustomLetterSpacingWidget(),
        // SizedBox(width: scaleWidth(context, 20)),
        // const CustomLineSpacingWidget(),
        const CustomTextStylingWidget(),
        SizedBox(width: scaleWidth(context, 20)),
        // Padding(
        //   padding: EdgeInsets.only(
        //       left: scaleWidth(context, 16), right: scaleWidth(context, 19)),
        //   child: const VerticalDivider(
        //     color: greyish3,
        //     width: 1,
        //     thickness: 1,
        //   ),
        // ),

         const CustomTextFormattingWidget(),
      ],
    );
  }
}
