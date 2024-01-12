import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class LetterSpacingWidget extends StatefulWidget {
  const LetterSpacingWidget({
    super.key,
  });

  @override
  State<LetterSpacingWidget> createState() => _LetterSpacingWidgetState();
}

class _LetterSpacingWidgetState extends State<LetterSpacingWidget> {
  late TextEditingController lineSpacingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lineSpacingController = TextEditingController();
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);
    if (hackathonTextProvider.selectedTextFieldKey != null) {
      int currentSpacing = hackathonTextProvider.getLetterSpacing();
      lineSpacingController.text = currentSpacing.toString();
    }
  }

  @override
  void dispose() {
    lineSpacingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void handleLineSpacingChanged(int value) {
    setState(() {
      lineSpacingController.text = value.toString();
    });
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);
    // Update the provider with the new line spacing value
    hackathonTextProvider.setLetterSpacing(value);
  }

  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    return Tooltip(
      verticalOffset: 5,
      decoration: const ShapeDecoration(
        shape: ToolTipCustomDecoration(
          side: TooltipSide.top,
          borderColor: greyish3,
          borderWidth: 0
        ),
        color: greyish7,
      ),
      message: "Letter Spacing",
      child: Row(
        children: [
          Container(
            height: scaleHeight(context, 37),
            width: scaleHeight(context, 57),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(rad5_1),
                border: Border.all(color: greyish3, width: 1)),
            child: TextField(
              controller: lineSpacingController,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: '1',
                hintStyle: GoogleFonts.getFont(fontFamily1,
                    fontSize: scaleHeight(context, 20),
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    height: lineHeight(23, 20)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                counterText: "",
              ),
              maxLength: 2,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              style: GoogleFonts.getFont(fontFamily1,
                  fontSize: scaleHeight(context, 20),
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  height: lineHeight(23, 20)),
              onSubmitted: (value) {
                int? letterSpacing = int.tryParse(value);
                if (letterSpacing != null) {
                  handleLineSpacingChanged(letterSpacing);
                }
              },
              onTap: () {
                int currentSpacing = hackathonTextProvider.getLetterSpacing();
                // Assuming you have a way to access the LetterSpacingWidget's controller
                lineSpacingController.text = currentSpacing.toString();
              },
            ),
          ),
          Container(
            height: scaleHeight(context, 37),
            width: scaleHeight(context, 37),
            padding: EdgeInsets.symmetric(
                vertical: scaleHeight(context, 7),
                horizontal: scaleHeight(context, 7)),
            child: SvgPicture.asset(
                "assets/icons/defaultEditPortal/letterSpacing.svg"),
          ),
        ],
      ),
    );
  }
}
