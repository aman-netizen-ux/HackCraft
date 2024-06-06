import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
// import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class PaddingTool extends StatefulWidget {
  const PaddingTool({
    super.key,
  });

  @override
  State<PaddingTool> createState() => _PaddingToolState();
}

class _PaddingToolState extends State<PaddingTool> {
  bool isHover = false;
  void _handleTap() {
    final customEditTemplateProvider =
        Provider.of<CustomEditPortal>(context, listen: false);
    customEditTemplateProvider.setPaddingSelected();
    debugPrint(
        " padding set to ${customEditTemplateProvider.isPaddingSelected}");
  }

  Color? _determineColor() {
    final customEditTemplateProvider =
        Provider.of<CustomEditPortal>(context, listen: false);
    if (customEditTemplateProvider.isPaddingSelected) {
      return grey5.withOpacity(0.2); // Color when clicked
    } else if (isHover) {
      return grey5.withOpacity(0.1); // Color when hovered
    } else {
      return null; // Normal color
    }
  }

  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return Tooltip(
      message: "Padding",
      verticalOffset: 5,
      decoration: const ShapeDecoration(
        shape: ToolTipCustomDecoration(
            side: TooltipSide.top, borderColor: greyish3, borderWidth: 0),
        color: greyish7,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: InkWell(
          onTap: _handleTap,
          child: Container(
            height: scaleHeight(context, 37),
            width: scaleHeight(context, 37),
            padding: EdgeInsets.symmetric(
                vertical: scaleHeight(context, 3),
                horizontal: scaleHeight(context, 5)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(rad5_1),
              color: _determineColor(),
            ),
            child: Container(
                height: scaleHeight(context, 30),
                width: scaleHeight(context, 30),
                child: const Icon(Icons.padding, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class PaddingValuesWidget extends StatefulWidget {
  const PaddingValuesWidget({super.key, required this.property});
  final String property;

  @override
  State<PaddingValuesWidget> createState() => _PaddingValuesWidgetState();
}

class _PaddingValuesWidgetState extends State<PaddingValuesWidget> {
  late TextEditingController leftPadding;
   late TextEditingController rightPadding;
   late TextEditingController topPadding;
   late TextEditingController bottomPadding;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leftPadding = TextEditingController();
     rightPadding = TextEditingController();
      topPadding = TextEditingController();
       bottomPadding = TextEditingController();
  }

  @override
  void dispose() {
    leftPadding.dispose();
    rightPadding.dispose();
    topPadding.dispose();
    bottomPadding.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    if (customEditPortalProvider.selectedWidgetKey != null) {
      List<int> currHeightList = customEditPortalProvider.getPropertyValue(
          customEditPortalProvider.jsonObject,
          customEditPortalProvider.selectedWidgetKey.toString(),
          widget.property);

          print("currHeightList  $currHeightList");

          leftPadding.text=currHeightList[0].toString();
           topPadding.text=currHeightList[1].toString();
            rightPadding.text=currHeightList[2].toString();
             bottomPadding.text=currHeightList[3].toString();

             if(leftPadding.text=="0"){
              leftPadding.text="";
             }
              if(topPadding.text=="0"){
              topPadding.text="";
             }
              if(rightPadding.text=="0"){
              rightPadding.text="";
             }
              if(bottomPadding.text=="0"){
              bottomPadding.text="";
             }

      
      
    }
    return Container(
        height: scaleHeight(context, 200),
        width: scaleWidth(context, 150),
        decoration: BoxDecoration(
            color: grey3,
            // borderRadius: BorderRadius.circular(rad5_2),
            border: Border.all(color: greyish3)),
        child: Column(
          children: [
            const Icon(Icons.padding, color: Colors.white),
            paddingTexts("T", topPadding),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.padding, color: Colors.white),
                paddingTexts("L", leftPadding),
                const Spacer(),
                paddingTexts("R", rightPadding),
                const Icon(Icons.padding, color: Colors.white),
              ],
            ),
            const Spacer(),
            paddingTexts("B", bottomPadding),
            const Icon(Icons.padding, color: Colors.white),
          ],
        ));
  }

  Widget paddingTexts(String paddingSide, TextEditingController? controller) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return Expanded(
      flex: 1,
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: paddingSide,
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
          List<int> paddingValues = customEditPortalProvider.getPropertyValue(
              customEditPortalProvider.jsonObject,
              customEditPortalProvider.selectedWidgetKey.toString(),
              widget.property);
          print("paddinggggggggggggggggggg before$paddingValues");

          paddingSide == "L"
              ? paddingValues[0] = int.tryParse(value) ?? 0
              : paddingSide == "T"
                  ? paddingValues[1] = int.tryParse(value) ?? 0
                  : paddingSide == "R"
                      ? paddingValues[2] = int.tryParse(value) ?? 0
                      : paddingValues[3] = int.tryParse(value) ?? 0;

          print("paddinggggggggggggggggggg$paddingValues");
          // double? height = double.tryParse(value);
          customEditPortalProvider.addPropertyByKey(
              customEditPortalProvider.selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : customEditPortalProvider.selectedWidgetKey.toString(),
              widget.property,
              paddingValues);
          customEditPortalProvider.dynamicWidgets = customEditPortalProvider
              .buildWidgetsFromJson(customEditPortalProvider.jsonObject);
          customEditPortalProvider.triggerUIUpdate();
        },
      ),
    );
  }
}
