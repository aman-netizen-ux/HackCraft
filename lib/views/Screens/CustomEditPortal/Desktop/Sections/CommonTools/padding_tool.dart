import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
// import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
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
              child: const Icon(Icons.padding, color: Colors.white)
            ),
          ),
        ),
      ),
    );
  }
}
