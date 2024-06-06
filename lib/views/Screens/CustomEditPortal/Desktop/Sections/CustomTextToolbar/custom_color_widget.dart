import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class CustomColorWidget extends StatefulWidget {
  const CustomColorWidget({
    super.key,
  });

  @override
  State<CustomColorWidget> createState() => _CustomColorWidgetState();
}

class _CustomColorWidgetState extends State<CustomColorWidget> {
  bool isHover = false;
  
  void _handleTap() {
    final customEditPortalProvider =  Provider.of<CustomEditPortal>(context, listen: false);
    customEditPortalProvider.setIsColorSelected();
    if(customEditPortalProvider.isColorSelected){
      customEditPortalProvider.setPropertyType("color");
    }else{
      customEditPortalProvider.setPropertyType("");
    }
    if(customEditPortalProvider.isColorPickerSelected){
      customEditPortalProvider.setIsColorPickerSelected();
    }    
    if(customEditPortalProvider.isBoldSelected){
      customEditPortalProvider.setBoldSelection();
    }
  }

  Color? _determineColor() {
   final customEditPortalProvider =  Provider.of<CustomEditPortal>(context, listen: false);
    if (customEditPortalProvider.isColorSelected) {
      return grey5.withOpacity(0.2); 
    } else if (isHover) {
      return grey5.withOpacity(0.1); 
    } else {
      return null; 
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final hackathonTextProvider =
    //     Provider.of<HackathonTextPropertiesProvider>(context);
        final customEditPortalProvider =  Provider.of<CustomEditPortal>(context);
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
                      color: customEditPortalProvider.selectedWidgetKey==null
                      ? darkBlue
                      : customEditPortalProvider.stringToColor(
                        customEditPortalProvider.getPropertyValue(
                      customEditPortalProvider.jsonObject,
                      customEditPortalProvider.selectedWidgetKey.toString(),
                      "color")
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
