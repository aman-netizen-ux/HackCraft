import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class ContainerBgColorWidget extends StatefulWidget {
  final ContainerColorProperties type;
  const ContainerBgColorWidget({
    super.key,
    required this.index,
    required this.type,
    required this.colorIndex,
  });

  final int index;
  final int colorIndex;

  @override
  State<ContainerBgColorWidget> createState() => _ContainerBgColorWidgetState();
}

class _ContainerBgColorWidgetState extends State<ContainerBgColorWidget> {
  bool isHover = false;
  // bool isClicked = false;
  void _handleTap() {
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context,
            listen: false);



          
    
    if (hackathonContainerPropertiesProvider.activeIndex == widget.index) {
      if (hackathonContainerPropertiesProvider.isContainerColorPickerSelected) {

        hackathonContainerPropertiesProvider
            .setIsContainerColorPickerSelected();
      }
      hackathonContainerPropertiesProvider.setActiveIndex(-1);
    }else{
      hackathonContainerPropertiesProvider.setActiveIndex(widget.index);
   
    hackathonContainerPropertiesProvider.colorIndex = widget.colorIndex;
    hackathonContainerPropertiesProvider.setType(widget.type);
   
    }

    // if (hackathonContainerPropertiesProvider.isContainerColorSelected) {
    //   hackathonContainerPropertiesProvider.colorIndex = -1;
    //   hackathonContainerPropertiesProvider.setIsContainerColorSelected();
    // } else {
    //   hackathonContainerPropertiesProvider.setIsContainerColorSelected();
    //   hackathonContainerPropertiesProvider.colorIndex = widget.colorIndex;
    // }
  }

  Color? _determineColor() {
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context,
            listen: false);
    if (hackathonContainerPropertiesProvider.activeIndex == widget.index) {
      return grey5.withOpacity(0.2); // Color when clicked
    } else if (isHover) {
      return grey5.withOpacity(0.1); // Color when hovered
    } else {
      return null; // Normal color
    }
  }

  String getTooltipMessage(ContainerColorProperties type){
    switch(type) {
      case ContainerColorProperties.containerBorderColor :
        return 'Border Color';
      case ContainerColorProperties.containerFocusedBorderColor :
        return 'Focused Border Color';
      case ContainerColorProperties.boxShadowColor :
        return 'Box Shadow Color';
      default: 
        return 'Container Color';
    }
  }

  @override
  Widget build(BuildContext context) {
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    return Tooltip(
      message: getTooltipMessage(widget.type),
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
                  color: hackathonContainerPropertiesProvider
                              .selectedContainerKey ==
                          null
                      ? darkBlue
                      : hackathonContainerPropertiesProvider.stringToColor(
                          hackathonContainerPropertiesProvider
                              .selectedContainerKey!,
                          widget.colorIndex,
                          widget.type)),
            ),
          ),
        ),
      ),
    );
  }
}
