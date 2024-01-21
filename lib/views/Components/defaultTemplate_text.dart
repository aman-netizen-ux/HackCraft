import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class DefaultTemplateText extends StatelessWidget {
  const DefaultTemplateText({super.key,  required this.name, required this.height, this.maxLines, required this.textProperties});

  final TextFieldProperties textProperties;
  final String name;
  final double height; // later change;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);
    return Text(
        textProperties.upperCase
            ? name.toUpperCase()
            : name,

        textAlign: defaultTemplateProvider
            .getTextAlign(textProperties.align),

        maxLines: maxLines,
        style: GoogleFonts.getFont(
            textProperties.font,
            letterSpacing: textProperties.letterSpacing
                .toDouble(),
            fontSize: scaleHeight(
                context,
                textProperties.size
                    .toDouble() 
                ),
            fontStyle: textProperties.italics
                ? FontStyle.italic
                : FontStyle.normal,
            decoration: TextDecoration.combine([
              textProperties.underline
                  ? TextDecoration.underline
                  : TextDecoration.none,
              textProperties.strikethrogh
                  ? TextDecoration.lineThrough
                  : TextDecoration.none
            ]),
            color: defaultTemplateProvider.stringToColor(
                textProperties.textColor),
            fontWeight: defaultTemplateProvider.fontWeightFromInt(
                textProperties.fontWeight),
            height: lineHeight(
                height,
                textProperties.size
                    .toDouble())));
  }
}
