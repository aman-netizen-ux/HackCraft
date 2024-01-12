import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class ColorWidget extends StatefulWidget {
  const ColorWidget({
    super.key,
  });

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  bool isHover = false;
  // bool isClicked = false;
  void _handleTap() {
    // setState(() {
    //   isClicked = !isClicked;
    // });
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);
    hackathonTextProvider.setIsTextColorSelected();
    if(hackathonTextProvider.isColorPickerSelected){
      hackathonTextProvider.setIsColorPickerSelected();
    }    
    if(hackathonTextProvider.isBoldSelected){
      hackathonTextProvider.setBoldSelection();
    }
  }

  Color? _determineColor() {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);
    if (hackathonTextProvider.isTextColorSelected) {
      return grey5.withOpacity(0.2); // Color when clicked
    } else if (isHover) {
      return grey5.withOpacity(0.1); // Color when hovered
    } else {
      return null; // Normal color
    }
  }

  @override
  Widget build(BuildContext context) {
     final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    return Tooltip(
      message: "Text color",
      verticalOffset: 5,
      decoration: const ShapeDecoration(
        shape: ToolTipCustomDecoration(
          side: TooltipSide.top,
          borderColor: greyish3,
          borderWidth: 0
        ),
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
            // color: Colors.pink[100],
            padding: EdgeInsets.symmetric(
                vertical: scaleHeight(context, 3),
                horizontal: scaleHeight(context, 5)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(rad5_1),
              color: _determineColor(),
            ),
    
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: scaleHeight(context, 20.5),
                  child: SvgPicture.asset(
                      "assets/icons/defaultEditPortal/color.svg"),
                ),
                Container(
                  height: scaleHeight(context, 4.5),
                  //  margin: EdgeInsets.only(
                  //    top: scaleHeight(context, 4)
                  //  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), 
                      color: hackathonTextProvider.selectedTextFieldKey==null
                      ? darkBlue
                      : hackathonTextProvider.stringToColor(
                        hackathonTextProvider.selectedTextFieldKey!
                      )
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
