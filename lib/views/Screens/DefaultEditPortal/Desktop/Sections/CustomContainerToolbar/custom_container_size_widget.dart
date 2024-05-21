import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class CustomContainerSizeWidget extends StatefulWidget {
  const CustomContainerSizeWidget({
    super.key,
  });

  @override
  State<CustomContainerSizeWidget> createState() =>
      _CustomContainerSizeWidgetState();
}

class _CustomContainerSizeWidgetState extends State<CustomContainerSizeWidget> {
  late TextEditingController containerHeightController;

  bool subtractHover = false;
  bool addHover = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    containerHeightController = TextEditingController();
  }

  @override
  void dispose() {
    containerHeightController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    // final hackathonContainerPropertiesProvider =
    //     Provider.of<HackathonContainerPropertiesProvider>(context);
    // if (hackathonContainerPropertiesProvider.selectedContainerKey != null) {
    //   if (hackathonContainerPropertiesProvider
    //           .containerPropertiesMap[
    //               hackathonContainerPropertiesProvider.selectedContainerKey]!.height > 0) {
    //     containerHeightController.text = hackathonContainerPropertiesProvider
    //         .containerPropertiesMap[hackathonContainerPropertiesProvider.selectedContainerKey]!
    //         .height
    //         .toString();
    //   }
    // }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rad5_1),
          border: Border.all(color: greyish3, width: 1)),
      child: Row(
        children: [
          Tooltip(
            message: "Decrease Container Height",
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
                              customEditPortalProvider.selectedWidgetKey
                                  .toString(),
                              "height") ;
                  customEditPortalProvider.addPropertyByKey(
                      customEditPortalProvider.selectedWidgetKey == null
                          ? customColumnKey.toString()
                          : customEditPortalProvider.selectedWidgetKey
                              .toString(),
                      'height',
                      currHeight -
                          30);
                          
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
            message: "Container Height",
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
                controller: containerHeightController,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
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
                  //  hackathonContainerPropertiesProvider.setContainerHeight(value);
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
            message: "Increase Container Height",
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
                  // hackathonContainerPropertiesProvider.increaseContainerHeight();
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
