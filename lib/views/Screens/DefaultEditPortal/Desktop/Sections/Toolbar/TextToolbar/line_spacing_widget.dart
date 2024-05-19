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

class LineSpacingWidget extends StatefulWidget {
  const LineSpacingWidget({
    super.key,
  });

  @override
  State<LineSpacingWidget> createState() => _LineSpacingWidgetState();
}

class _LineSpacingWidgetState extends State<LineSpacingWidget> {
  late TextEditingController lineSpacingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lineSpacingController = TextEditingController();
  }

  @override
  void dispose() {
    lineSpacingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void handleLineHeightChanged(int value) {
    setState(() {
      lineSpacingController.text = value.toString();
    });
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);
    // Update the provider with the new line spacing value
   hackathonTextProvider.setLineSpacing(value);
  }

  

  
    


  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

        if (hackathonTextProvider.selectedTextFieldKey != null) {
      int currentSpacing = hackathonTextProvider.getLineSpacing();
      lineSpacingController.text = currentSpacing.toString();
    }
    return Tooltip(
      message: "Line Spacing",
      verticalOffset: 5,
      decoration: const ShapeDecoration(
        shape: ToolTipCustomDecoration(
            side: TooltipSide.top, borderColor: greyish3, borderWidth: 0),
        color: greyish7,
      ),
      child: Row(
        children: [
          Container(
            height: scaleHeight(context, 37),
            width: scaleHeight(context, 37),
            padding: EdgeInsets.symmetric(
                vertical: scaleHeight(context, 7),
                horizontal: scaleHeight(context, 7)),
            child: SvgPicture.asset(
                "assets/icons/defaultEditPortal/lineSpacing.svg"),
          ),
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
                int? spacingValue = int.tryParse(value);
                if (spacingValue != null) {
                  handleLineHeightChanged(spacingValue);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

