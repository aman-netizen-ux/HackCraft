import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

enum ColorToolsButtonSide { topleft, bottomright, topright, bottomleft }

class ColorToolsButton extends StatefulWidget {
  const ColorToolsButton({
    super.key,
    required this.child,
    required this.side,
    required this.message,
    this.onTap,
    required this.tabIndex
  });

  final Widget child;
  final ColorToolsButtonSide side;
  final String message;
  final void Function()? onTap;
  final int tabIndex;
  

  @override
  State<ColorToolsButton> createState() => _ColorToolsButtonState();
}

class _ColorToolsButtonState extends State<ColorToolsButton> {
  bool isHover = false;
  bool isClicked = false;
  void _handleTap() {
    if (widget.tabIndex == 1 || widget.tabIndex == 2) {
    } else {
      setState(() {
        isClicked = !isClicked;
      });
    }

    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  Color? _determineColor(HackathonTextPropertiesProvider textProvider, HackathonContainerPropertiesProvider containerProvider) {
    if (widget.tabIndex == 1 || widget.tabIndex == 2) {
      if (widget.tabIndex ==
         textProvider.selectedColorTool || widget.tabIndex ==
         containerProvider.selectedContainerColorTool ) {
        return grey5.withOpacity(0.2);
      } else if (isHover) {
        return grey5.withOpacity(0.1); // Color when hovered
      } else {
        return null; // Normal color
      }
    } else {
      if (isClicked) {
        return grey5.withOpacity(0.2); // Color when clicked
      } else if (isHover) {
        return grey5.withOpacity(0.1); // Color when hovered
      } else {
        return null; // Normal color
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

        final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    return Tooltip(
      message: widget.message,
      verticalOffset: 0, //-20
      margin: EdgeInsets.only(
        right: widget.side == ColorToolsButtonSide.topleft ||
                widget.side == ColorToolsButtonSide.bottomleft
            ? scaleWidth(context, 100)
            : 0,
        left: widget.side == ColorToolsButtonSide.topleft ||
                widget.side == ColorToolsButtonSide.bottomleft
            ? 0
            : scaleWidth(context, 120),
      ),
      decoration: ShapeDecoration(
        shape: ToolTipCustomDecoration(
            side: widget.side == ColorToolsButtonSide.topleft ||
                    widget.side == ColorToolsButtonSide.bottomleft
                ? TooltipSide.right
                : TooltipSide.left,
            borderColor: greyish3,
            borderWidth: 0),
        color: greyish7,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: InkWell(
          onTap: _handleTap,
          child: Container(
            padding: EdgeInsets.all(scaleWidth(context, 4)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      widget.side == ColorToolsButtonSide.topleft ? rad5_2 : 0),
                  topRight: Radius.circular(
                      widget.side == ColorToolsButtonSide.topright
                          ? rad5_2
                          : 0),
                  bottomLeft: Radius.circular(
                      widget.side == ColorToolsButtonSide.bottomleft
                          ? rad5_2
                          : 0),
                  bottomRight: Radius.circular(
                      widget.side == ColorToolsButtonSide.bottomright
                          ? rad5_2
                          : 0)),
              color: _determineColor(hackathonTextProvider, hackathonContainerPropertiesProvider),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
