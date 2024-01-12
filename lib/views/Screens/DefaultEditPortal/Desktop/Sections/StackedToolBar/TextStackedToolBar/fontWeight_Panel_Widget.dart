import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class FontWeightPanelWidget extends StatefulWidget {
  const FontWeightPanelWidget({super.key});

  @override
  State<FontWeightPanelWidget> createState() => _FontWeightPanelWidgetState();
}

class _FontWeightPanelWidgetState extends State<FontWeightPanelWidget> {
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
        width: scaleWidth(context, 735),
        decoration: BoxDecoration(
            color: grey3,
            borderRadius: BorderRadius.circular(rad5_2),
            border: Border.all(color: greyish3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            fontWeights.length * 2 - 1,
            (index) => index % 2 == 0
                ? fontWeightItem(fontWeights[index ~/ 2], context, "assets/icons/defaultEditPortal/boldIcons/bold${(index ~/ 2)+1}.svg" )
                : const VerticalDivider(
                    color: greyish3,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
          ),
        ));
  }

  Widget fontWeightItem(String name, BuildContext context, String assetPath) {
    final hackathonTextProvider = Provider.of<HackathonTextPropertiesProvider>(context);
    return InkWell(
      onTap: () => hackathonTextProvider.updateFontWeight(name),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SvgPicture.asset(
            assetPath,
            color: hackathonTextProvider.isFontWeightSelected(name)
                  ? Colors.blue
                  : Colors.white
          ),

          SizedBox(width: scaleWidth(context, 2),),
          
          Text(name,
              style: GoogleFonts.capriola(
                  fontWeight: FontWeight.w400,
                  fontSize: scaleHeight(context, 14),
                  height: lineHeight(22.4, 14),
                  color: Colors.white)),
        ],
      ),
    );
  }
}
