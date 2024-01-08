import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class StackedToolBar extends StatefulWidget {
  const StackedToolBar({super.key});

  @override
  State<StackedToolBar> createState() => _StackedToolBarState();
}

class _StackedToolBarState extends State<StackedToolBar> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: scaleHeight(context, 60),
        width: scaleWidth(context, 735),
        decoration: BoxDecoration(
            color: grey3,
            borderRadius: BorderRadius.circular(rad5_2),
            border: Border.all(color: greyish3)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(width: scaleWidth(context, 13)),
          boldName('Thin', context),
          const VerticalDivider(
            color: greyish3,
            indent: 10.0,
            endIndent: 10.0,
          ),
          boldName('Extra Light', context),
          const VerticalDivider(
            color: greyish3,
            indent: 10.0,
            endIndent: 10.0,
          ),
          boldName('Light', context),
          const VerticalDivider(
            color: greyish3,
            indent: 10.0,
            endIndent: 10.0,
          ),
          boldName('Regular', context),
          const VerticalDivider(
            color: greyish3,
            indent: 10.0,
            endIndent: 10.0,
          ),
          boldName("Medium", context),
          const VerticalDivider(
            color: greyish3,
            indent: 10.0,
            endIndent: 10.0,
          ),
          boldName('Semi Bold', context),
          const VerticalDivider(
            color: greyish3,
            indent: 10.0,
            endIndent: 10.0,
          ),
          boldName('Bold', context),
          const VerticalDivider(
            color: greyish3,
            indent: 10.0,
            endIndent: 10.0,
          ),
          boldName('Extra Bold', context),
          const VerticalDivider(
            color: greyish3,
            indent: 10.0,
            endIndent: 10.0,
          ),
          boldName('Black', context)
        ]));
  }

  Widget boldName(String name, BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    return InkWell(
      onTap: ()=> hackathonTextProvider.updateFontWeight(name),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.format_bold, color: hackathonTextProvider.isFontWeightSelected(name) ? Colors.blue : Colors.white),
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
