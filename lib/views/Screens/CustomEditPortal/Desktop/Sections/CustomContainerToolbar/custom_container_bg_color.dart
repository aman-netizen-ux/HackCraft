import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class CustomContainerBgColorWidget extends StatefulWidget {
  const CustomContainerBgColorWidget({
    super.key, required this.index, required this.title, required this.property,
  });
 final int index;
  final String title;
  final String property;
 

  @override
  State<CustomContainerBgColorWidget> createState() => _CustomContainerBgColorWidgetState();
}

class _CustomContainerBgColorWidgetState extends State<CustomContainerBgColorWidget> {
  bool isHover = false;
   void _handleTap() {
    final customEditTemplateProvider =
        Provider.of<CustomEditPortal>(context, listen: false);
    // customEditTemplateProvider.setIsColorSelected();
    // if(customEditTemplateProvider.isColorPickerSelected){
    //   customEditTemplateProvider.setIsColorPickerSelected();
    // }  
    
    
    if (customEditTemplateProvider.activeIndex == widget.index) {
      if (customEditTemplateProvider.isColorPickerSelected) {

        customEditTemplateProvider
            .setIsColorPickerSelected();
      }
      customEditTemplateProvider.setActiveIndex(-1);
    }  else{
      customEditTemplateProvider.setActiveIndex(widget.index);
   
    customEditTemplateProvider.setPropertyType(widget.property);
   
    }








    // if(customEditTemplateProvider.isBoldSelected){
    //   customEditTemplateProvider.setBoldSelection();
    // }
  }

  Color? _determineColor() {
    final customEditTemplateProvider =
        Provider.of<CustomEditPortal>(context, listen: false);
    if (customEditTemplateProvider.activeIndex == widget.index) {
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
      message: widget.title,
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: customEditPortalProvider
                              .selectedWidgetKey ==
                          null
                      ? darkBlue
                      : customEditPortalProvider.stringToColor(
                          customEditPortalProvider.getPropertyValue(
                      customEditPortalProvider.jsonObject,
                      customEditPortalProvider.selectedWidgetKey.toString(),
                      widget.property))),
            ),
          ),
        ),
      ),
    );
  }
}
