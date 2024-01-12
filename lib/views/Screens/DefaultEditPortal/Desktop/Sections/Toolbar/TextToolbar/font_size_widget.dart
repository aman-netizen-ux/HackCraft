import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class FontSizeWidget extends StatefulWidget {
  const FontSizeWidget({
    super.key,
  });

  @override
  State<FontSizeWidget> createState() => _FontSizeWidgetState();
}

class _FontSizeWidgetState extends State<FontSizeWidget> {
  late TextEditingController fontSizeController;

  bool subtractHover = false;
  bool addHover = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fontSizeController = TextEditingController();
  }

  @override
  void dispose() {
    fontSizeController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rad5_1),
          border: Border.all(color: greyish3, width: 1)),
      child: Row(
        children: [
          Tooltip(
            message: "Decrease Font Size",
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
                  hackathonTextProvider.decreaseFontSize();
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
            message: "Font Size",
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
                controller: fontSizeController,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
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
              ),
            ),
          ),
          const VerticalDivider(
            color: greyish3,
            width: 1,
            thickness: 1,
          ),
          Tooltip(
            message: "Increase Font Size",
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
                  hackathonTextProvider.increaseFontSize();
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
