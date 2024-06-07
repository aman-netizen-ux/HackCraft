import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class CustomDividerThicknessWidget extends StatefulWidget {
  const CustomDividerThicknessWidget({
    super.key,
  });

  @override
  State<CustomDividerThicknessWidget> createState() =>
      _CustomDividerThicknessWidgetState();
}

class _CustomDividerThicknessWidgetState
    extends State<CustomDividerThicknessWidget> {
  late TextEditingController thicknessController;

  @override
  void initState() {
    super.initState();
    thicknessController = TextEditingController();
  }

  @override
  void dispose() {
    thicknessController.dispose();
    super.dispose();
  }

  void handleDividerThicknessChanged(int value) {
    setState(() {
      thicknessController.text = value.toString();
    });
    final customEditPortalProvider =
        Provider.of<CustomEditPortal>(context, listen: false);
    // Update the provider with the new line spacing value
    customEditPortalProvider.addPropertyByKey(
        customEditPortalProvider.selectedWidgetKey == null
            ? customColumnKey.toString()
            : customEditPortalProvider.selectedWidgetKey.toString(),
        "thickness",
        value);
    customEditPortalProvider.dynamicWidgets = customEditPortalProvider
        .buildWidgetsFromJson(customEditPortalProvider.jsonObject);
    customEditPortalProvider.triggerUIUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    if (customEditPortalProvider.selectedWidgetKey != null) {
      int currentSpacing = customEditPortalProvider.getPropertyValue(
          customEditPortalProvider.jsonObject,
          customEditPortalProvider.selectedWidgetKey.toString(),
          "thickness");
      thicknessController.text = currentSpacing.toString();
    }
    return Tooltip(
      message: "Thickness",
      verticalOffset: 5,
      decoration: const ShapeDecoration(
        shape: ToolTipCustomDecoration(
            side: TooltipSide.top, borderColor: greyish3, borderWidth: 0),
        color: greyish7,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: scaleHeight(context, 37),
            width: scaleHeight(context, 37),
            padding: EdgeInsets.symmetric(
                vertical: scaleHeight(context, 7),
                horizontal: scaleHeight(context, 7)),
            child: const Icon(Icons.swap_vert, color: Colors.white),
          ),
          Container(
            height: scaleHeight(context, 37),
            width: scaleHeight(context, 57),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(rad5_1),
                border: Border.all(color: greyish3, width: 1)),
            child: TextField(
              controller: thicknessController,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(bottom: scaleHeight(context, 22)),
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
              maxLength: 3,
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
                  handleDividerThicknessChanged(spacingValue);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
