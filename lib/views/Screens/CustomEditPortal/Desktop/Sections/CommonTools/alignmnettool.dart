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

class AlignmentTool extends StatefulWidget {
  const AlignmentTool({
    super.key,
  });

  @override
  State<AlignmentTool> createState() => _AlignmentToolState();
}

class _AlignmentToolState extends State<AlignmentTool> {
  bool isHover = false;
  void _handleTap() {
    final customEditTemplateProvider =
        Provider.of<CustomEditPortal>(context, listen: false);
    customEditTemplateProvider.setIsAlignmentSelected();
    debugPrint(
        " Alignment set to ${customEditTemplateProvider.isAlignemntSelected}");
  }

  Color? _determineColor() {
    final customEditTemplateProvider =
        Provider.of<CustomEditPortal>(context, listen: false);
    if (customEditTemplateProvider.isAlignemntSelected) {
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
      message: "Alignment",
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
                child: const Icon(Icons.align_horizontal_center_rounded,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class AlignmentValuesWidget extends StatefulWidget {
  const AlignmentValuesWidget({super.key});

  @override
  State<AlignmentValuesWidget> createState() => _AlignmentValuesWidgetState();
}

class _AlignmentValuesWidgetState extends State<AlignmentValuesWidget> {
  int isHover = -1;
  final Map<int, List<dynamic>> iconMap = {
    1: [-1, -1, Icons.fork_left],
    2: [0, -1, Icons.align_vertical_top_rounded],
    3: [1, -1, Icons.fork_right],
    4: [-1, 0, Icons.align_horizontal_left_rounded],
    5: [0, 0, Icons.align_horizontal_center_rounded],
    6: [1, 0, Icons.align_horizontal_right_rounded],
    7: [-1, 1, Icons.fork_left],
    8: [0, 1, Icons.align_vertical_bottom_rounded],
    9: [1, 1, Icons.fork_right],
  };

  Color? _determineColor(bool isSelected, bool isHovertrue) {
   
    if (isHovertrue) {
      return grey5.withOpacity(0.1); // Color when hovered
    } else if(isSelected) {
      return grey5.withOpacity(0.2);  // Normal color
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
     List<int> currAlignment=[];
     if (customEditPortalProvider.selectedWidgetKey != null) {

       currAlignment = customEditPortalProvider.getPropertyValue(
          customEditPortalProvider.jsonObject,
          customEditPortalProvider.selectedWidgetKey.toString(),
         "alignment");

         print("currAlignment $currAlignment");
     }
    return Container(
        height: scaleHeight(context, 250),
        width: scaleWidth(context, 250),
        padding: EdgeInsets.all(scaleWidth(context, 10)),
        decoration:
            BoxDecoration(color: grey3, border: Border.all(color: greyish3)),
        child: Column(
          children: List.generate(3, (column) {
            return Expanded(
              flex: 1,
              child: Row(
                  children: List.generate(3, (row) {
                int i = column * 3 + row + 1;
                List<int> iconAlignment= [iconMap[i]![0], iconMap[i]![1]];
                print("iconAlignment $iconAlignment ${currAlignment[0]==iconAlignment[0]} ${currAlignment[1]==iconAlignment[1]}");
                return Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          print("updated alignmnet: $iconAlignment}");
                          customEditPortalProvider.addPropertyByKey(
                              customEditPortalProvider.selectedWidgetKey == null
                                  ? customColumnKey.toString()
                                  : customEditPortalProvider.selectedWidgetKey
                                      .toString(),
                              "alignment",
                              iconAlignment);
                          customEditPortalProvider.dynamicWidgets =
                              customEditPortalProvider.buildWidgetsFromJson(
                                  customEditPortalProvider.jsonObject);
                          customEditPortalProvider.triggerUIUpdate();
                        },
                        child: MouseRegion(
                          onEnter: (_) => setState(() => isHover = i),
                          onExit: (_) => setState(() => isHover = -1),
                          child: Container(
                            padding: EdgeInsets.all(scaleWidth(context, 4)),
                            decoration:  BoxDecoration(
                                color: _determineColor(currAlignment[0]==iconAlignment[0] && currAlignment[1]==iconAlignment[1],
                                isHover==i
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              iconMap[i]![2],
                              color: Colors.white,
                            ),
                          ),
                        )));
              })),
            );
          }),
        ));
  }
}
