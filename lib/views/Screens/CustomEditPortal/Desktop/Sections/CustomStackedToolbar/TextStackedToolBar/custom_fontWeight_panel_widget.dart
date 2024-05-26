import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class CustomFontWeightPanelWidget extends StatefulWidget {
  const CustomFontWeightPanelWidget({super.key});

  @override
  State<CustomFontWeightPanelWidget> createState() => _CustomFontWeightPanelWidgetState();
}

class _CustomFontWeightPanelWidgetState extends State<CustomFontWeightPanelWidget> {
  final List<String> fontWeights = [
    'Thin',
    'Extra Light',
    'Light',
    'Regular',
    'Medium',
    'Semi Bold',
    'Bold',
    'Extra Bold',
    'Black',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: scaleHeight(context, 60),
        //width: scaleWidth(context, 770),
        decoration: BoxDecoration(
            color: grey3,
            borderRadius: BorderRadius.circular(rad5_2),
            border: Border.all(color: greyish3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(
            fontWeights.length * 2 - 1,
            (index) => index % 2 == 0
                ? FontWeightItem(
                    name: fontWeights[index ~/ 2],
                    index: (index ~/ 2) + 1,
                    assetPath:
                        "assets/icons/defaultEditPortal/boldIcons/bold${(index ~/ 2) + 1}.svg")
                : const VerticalDivider(
                    color: greyish3,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
          ),
        ));
  }
}

class FontWeightItem extends StatefulWidget {
  const FontWeightItem(
      {super.key,
      required this.name,
      required this.assetPath,
      required this.index});
  final String name;
  final String assetPath;
  final int index;

  @override
  State<FontWeightItem> createState() => _FontWeightItemState();
}

class _FontWeightItemState extends State<FontWeightItem> {
  bool isHover = false;
  Color? _determineColor(bool isClicked) {
    if (isClicked) {
      return grey5.withOpacity(0.2); // Color when clicked
    } else if (isHover) {
      return grey5.withOpacity(0.1); // Color when hovered
    } else {
      return null; // Normal color
    }
  }

  @override
  Widget build(BuildContext context) {
    // final hackathonTextProvider =
    //     Provider.of<HackathonTextPropertiesProvider>(context);
    final customEditPortalProvider =
        Provider.of<CustomEditPortal>(context);
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: InkWell(
        onTap: () => customEditPortalProvider.updateFontWeight(widget.name),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
              vertical: scaleWidth(context, 6),
              ),
          padding: EdgeInsets.symmetric(
              // vertical: scaleWidth(context, 2),
              horizontal: scaleWidth(context, 6)),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(rad5_1)),
            color: _determineColor(
                customEditPortalProvider.isFontWeightSelected(widget.name)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.assetPath,
              ),
              SizedBox(
                width: scaleWidth(context, 2),
              ),
              Text(widget.name,
                  style: GoogleFonts.getFont(
                      customEditPortalProvider.getPropertyValue(
                      customEditPortalProvider.jsonObject,
                      customEditPortalProvider.selectedWidgetKey.toString(),
                      "font"),
                      fontWeight: customEditPortalProvider
                          .fontWeightFromInt(widget.index * 100),
                      fontSize: scaleHeight(context, 14),
                      height: lineHeight(22.4, 14),
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
