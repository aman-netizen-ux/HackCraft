import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class CustomDividerHeightWidget extends StatefulWidget {
  const CustomDividerHeightWidget({
    super.key,
  });

  @override
  State<CustomDividerHeightWidget> createState() =>
      _CustomDividerHeightWidgetState();
}

class _CustomDividerHeightWidgetState extends State<CustomDividerHeightWidget> {
  late TextEditingController customDividerHeightController;

  bool subtractHover = false;
  bool addHover = false;

  @override
  void initState() {
    super.initState();
    customDividerHeightController = TextEditingController();
  }

  @override
  void dispose() {
    customDividerHeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);

    if (customEditPortalProvider.selectedWidgetKey != null) {
      final currHeight = customEditPortalProvider.getPropertyValue(
          customEditPortalProvider.jsonObject,
          customEditPortalProvider.selectedWidgetKey.toString(),
          "dividerHeight");
      if (currHeight > 0) {
        customDividerHeightController.text = currHeight.toString();
      }
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rad5_1),
          border: Border.all(color: greyish3, width: 1)),
      child: Row(
        children: [
          Tooltip(
            message: "Decrease Divider Height",
            verticalOffset: 5,
            decoration: const ShapeDecoration(
              shape: ToolTipCustomDecoration(
                  side: TooltipSide.top, borderColor: greyish3, borderWidth: 0),
              color: greyish7,
            ),
            child: MouseRegion(
              onEnter: (_) => setState(() => subtractHover = true),
              onExit: (_) => setState(() => subtractHover = false),
              child: InkWell(
                onTap: () {
                  final currHeight = customEditPortalProvider.getPropertyValue(
                      customEditPortalProvider.jsonObject,
                      customEditPortalProvider.selectedWidgetKey.toString(),
                      "dividerHeight");
                  if (currHeight - 2 > 0) {
                    customEditPortalProvider.addPropertyByKey(
                        customEditPortalProvider.selectedWidgetKey == null
                            ? customColumnKey.toString()
                            : customEditPortalProvider.selectedWidgetKey
                                .toString(),
                        'dividerHeight',
                        currHeight - 2);
                  }

                  customEditPortalProvider.dynamicWidgets =
                      customEditPortalProvider.buildWidgetsFromJson(
                          customEditPortalProvider.jsonObject);
                  customEditPortalProvider.triggerUIUpdate();
                },
                child: Container(
                    height: scaleHeight(context, 37),
                    width: scaleHeight(context, 37),
                    padding: EdgeInsets.symmetric(
                        horizontal: scaleHeight(context, 10)),
                    color: subtractHover ? grey5.withOpacity(0.1) : null,
                    child: SvgPicture.asset(
                        "assets/icons/defaultEditPortal/subtract.svg")),
              ),
            ),
          ),
          const VerticalDivider(
            color: greyish3,
            width: 1,
            thickness: 1,
          ),
          Tooltip(
            message: "Divider Height",
            verticalOffset: 5,
            decoration: const ShapeDecoration(
              shape: ToolTipCustomDecoration(
                  side: TooltipSide.top, borderColor: greyish3, borderWidth: 0),
              color: greyish7,
            ),
            child: SizedBox(
              height: scaleHeight(context, 37),
              width: scaleHeight(context, 56),
              child: TextField(
                controller: customDividerHeightController,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                decoration: InputDecoration(   
                  contentPadding: EdgeInsets.only(bottom: scaleHeight(context, 22)),
                  hintText: "",
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
                  double? height = double.tryParse(value);
                  customEditPortalProvider.addPropertyByKey(
                      customEditPortalProvider.selectedWidgetKey == null
                          ? customColumnKey.toString()
                          : customEditPortalProvider.selectedWidgetKey
                              .toString(),
                      'dividerHeight',
                      height);
                  customEditPortalProvider.dynamicWidgets =
                      customEditPortalProvider.buildWidgetsFromJson(
                          customEditPortalProvider.jsonObject);
                  customEditPortalProvider.triggerUIUpdate();
                },
              ),
            ),
          ),
          const VerticalDivider(
            color: greyish3,
            width: 1,
            thickness: 1,
          ),
          Tooltip(
            message: "Increase Divider Height",
            verticalOffset: 5,
            decoration: const ShapeDecoration(
              shape: ToolTipCustomDecoration(
                  side: TooltipSide.top, borderColor: greyish3, borderWidth: 0),
              color: greyish7,
            ),
            child: MouseRegion(
              onEnter: (_) => setState(() => addHover = true),
              onExit: (_) => setState(() => addHover = false),
              child: InkWell(
                onTap: () {
                  final currHeight = customEditPortalProvider.getPropertyValue(
                      customEditPortalProvider.jsonObject,
                      customEditPortalProvider.selectedWidgetKey.toString(),
                      "dividerHeight");
                  customEditPortalProvider.addPropertyByKey(
                      customEditPortalProvider.selectedWidgetKey == null
                          ? customColumnKey.toString()
                          : customEditPortalProvider.selectedWidgetKey
                              .toString(),
                      'dividerHeight',
                      currHeight + 2);
                  customEditPortalProvider.dynamicWidgets =
                      customEditPortalProvider.buildWidgetsFromJson(
                          customEditPortalProvider.jsonObject);
                  customEditPortalProvider.triggerUIUpdate();
                },
                child: Container(
                    height: scaleHeight(context, 37),
                    width: scaleHeight(context, 37),
                    padding: EdgeInsets.symmetric(
                        horizontal: scaleHeight(context, 5)),
                    color: addHover ? grey5.withOpacity(0.1) : null,
                    child: SvgPicture.asset(
                        "assets/icons/defaultEditPortal/add.svg")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
