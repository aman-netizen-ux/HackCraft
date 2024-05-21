import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class ContainerBlurRadiusWidget extends StatefulWidget {
  const ContainerBlurRadiusWidget({
    super.key,
  });

  @override
  State<ContainerBlurRadiusWidget> createState() => _ContainerBlurRadiusWidgetState();
}

class _ContainerBlurRadiusWidgetState extends State<ContainerBlurRadiusWidget> {
  late TextEditingController containerBlurRadiusController;

  bool subtractHover = false;
  bool addHover = false;

  @override
  void initState() {
    super.initState();
    containerBlurRadiusController = TextEditingController();
  }

  @override
  void dispose() {
    containerBlurRadiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    if (hackathonContainerPropertiesProvider.selectedContainerKey != null) {

      if (hackathonContainerPropertiesProvider
              .containerPropertiesMap[
                  hackathonContainerPropertiesProvider.selectedContainerKey]!.blurRadius >= 0) {
        containerBlurRadiusController.text = hackathonContainerPropertiesProvider
            .containerPropertiesMap[hackathonContainerPropertiesProvider.selectedContainerKey]!
            .blurRadius
            .toString();
      }
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rad5_1),
          border: Border.all(color: greyish3, width: 1)),
      child: Row(
        children: [
          Tooltip(
            message: "Container Blur Radius",
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
                controller: containerBlurRadiusController,
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
                maxLength: 2,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                style: GoogleFonts.getFont(fontFamily1,
                    fontSize: scaleHeight(context, 20),
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    height: lineHeight(23, 20)),
                onSubmitted: (value) {
                  hackathonContainerPropertiesProvider.setContainerBlurRadius(value);

                },
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
