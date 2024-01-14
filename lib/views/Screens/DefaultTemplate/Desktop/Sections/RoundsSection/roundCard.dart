import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

// This file was created in order to create the card for the rounds section.
class RoundCard extends StatelessWidget {
  final String title;
  final TextFieldProperties titleTextProperties;
  final int index;
  final void Function()? onTap;
  final String enddate;
   final String startDate;
  final TextFieldProperties endDateTextProperties; 
  final TextFieldProperties startDateTextProperties;
  const RoundCard(
      {super.key,
      required this.title,
      required this.enddate,
      required this.startDate,
      this.onTap,
      required this.index,
      required this.titleTextProperties,
      required this.endDateTextProperties,
      required this.startDateTextProperties});

  @override
  Widget build(BuildContext context) {
    final rulesProvider = Provider.of<RulesProvider>(context);
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);

    return InkWell(
      hoverColor: Colors.white,
      onTap: onTap,
      child: Container(
          // height: scaleHeight(context, 67),
          width: double.infinity,
          margin: EdgeInsets.only(
              bottom: scaleHeight(context, 23),
              left: scaleWidth(context, 47),
              right: scaleWidth(context, 26),
              top: scaleHeight(context, 23)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(rad5_3),
              border: Border.all(
                  color: rulesProvider.selectedIndex == index
                      ? black1
                      : Colors.transparent),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: scaleWidth(context, 25),
                    top: scaleHeight(context, 15)),
                //Title of the round
                child: Text(
                  title,
                  style: GoogleFonts.getFont(
                    titleTextProperties.font, //fontFamily2,
                    fontSize: scaleHeight(
                        context, titleTextProperties.size.toDouble()), //20
                    decoration: titleTextProperties.underline
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    fontStyle: titleTextProperties.italics
                        ? FontStyle.italic
                        : FontStyle.normal,
                    color: defaultTemplateProvider
                        .stringToColor(titleTextProperties.textColor), //black1,
                    height:
                        lineHeight(22.4, titleTextProperties.size.toDouble()),
                    fontWeight: defaultTemplateProvider
                        .fontWeightFromInt(titleTextProperties.fontWeight),
                  ),
                ),
              ),
              //Timeline i.e Start date and End date of the round
              Padding(
                padding: EdgeInsets.only(
                    left: scaleWidth(context, 25),
                    bottom: scaleHeight(context, 6)),
                child: Row(
                  children: [
                    Text(
                      '$startDate - ',
                      style: GoogleFonts.getFont(
                        startDateTextProperties.font, //fontFamily2,
                        fontSize: scaleHeight(context,
                            startDateTextProperties.size.toDouble()), //18
                        decoration: startDateTextProperties.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        fontStyle: startDateTextProperties.italics
                            ? FontStyle.italic
                            : FontStyle.normal,

                        color: defaultTemplateProvider.stringToColor(
                            startDateTextProperties.textColor), //black1,
                        height: lineHeight(
                            22.4, startDateTextProperties.size.toDouble()),
                        fontWeight: defaultTemplateProvider.fontWeightFromInt(
                            startDateTextProperties.fontWeight),
                      ),
                    ),
                    Text(
                      enddate,
                      style: GoogleFonts.getFont(
                        endDateTextProperties.font, //fontFamily2,
                        fontSize: scaleHeight(context,
                            endDateTextProperties.size.toDouble()), //18
                        decoration: endDateTextProperties.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        fontStyle: endDateTextProperties.italics
                            ? FontStyle.italic
                            : FontStyle.normal,

                        color: defaultTemplateProvider.stringToColor(
                            endDateTextProperties.textColor), //black1,
                        height: lineHeight(
                            22.4, endDateTextProperties.size.toDouble()),
                        fontWeight: defaultTemplateProvider.fontWeightFromInt(
                            endDateTextProperties.fontWeight),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
