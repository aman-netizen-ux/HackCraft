import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
// import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:provider/provider.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key, required this.defaultTemplateModel});
  final DefaultTemplateApiResponse? defaultTemplateModel;

  @override
  Widget build(BuildContext context) {
    // final hackathonDetailsProvider =
    //     Provider.of<HackathonDetailsProvider>(context);
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    return Padding(
      key: home,
      padding: EdgeInsets.only(
          right: scaleWidth(context, 81),
          left: scaleWidth(context, 81),
          bottom: scaleHeight(context, 39)),
      child: Column(
        children: [
          //NavBar

          SizedBox(
            height: scaleHeight(context, 70),
          ),

          //Landing Section
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: scaleHeight(context, 523),
                width: scaleWidth(context, 1108),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: lavender,
                    borderRadius: BorderRadius.all(Radius.circular(rad5_6))),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: scaleWidth(context, 700),
                        height: scaleHeight(context, 50),
                        child: Text(
                            defaultTemplateModel!.fields[0].textProperties.upperCase
                                ? '${defaultTemplateModel!.hackathons.organisationName} presents'
                                    .toUpperCase()
                                : '${defaultTemplateModel!.hackathons.organisationName} presents',
                            textAlign: hackathonTextProvider.getTextAlign(
                                defaultTemplateModel!
                                    .fields[0].textProperties.align),
                            style: GoogleFonts.getFont(
                                defaultTemplateModel!
                                    .fields[0].textProperties.font,
                                letterSpacing: defaultTemplateModel!
                                    .fields[0].textProperties.letterSpacing
                                    .toDouble(),
                                fontSize: scaleHeight(
                                    context,
                                    defaultTemplateModel!.fields[0].textProperties.size
                                        .toDouble() //20
                                    ),
                                fontStyle: defaultTemplateModel!.fields[0].textProperties.italics
                                    ? FontStyle.italic
                                    : FontStyle.normal,
                                decoration: TextDecoration.combine([
                                  defaultTemplateModel!
                                          .fields[0].textProperties.underline
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  defaultTemplateModel!
                                          .fields[0].textProperties.strikethrogh
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none
                                ]),
                                color: defaultTemplateProvider.stringToColor(
                                    defaultTemplateModel!.fields[0].textProperties.textColor),
                                fontWeight: defaultTemplateProvider.fontWeightFromInt(defaultTemplateModel!.fields[0].textProperties.fontWeight),
                                height: lineHeight(22.4, defaultTemplateModel!.fields[0].textProperties.size.toDouble()))),
                      ),
                      SizedBox(
                        height: scaleHeight(context, 42),
                      ),
                      SizedBox(
                        width: scaleWidth(context, 700),
                        height: scaleHeight(context, 54),
                        child: Text(
                            // 'Your Hackathon Name',
                            defaultTemplateModel!.fields[1].textProperties.upperCase
                                ? defaultTemplateModel!.hackathons.name
                                    .toUpperCase()
                                : defaultTemplateModel!.hackathons.name,
                            textAlign: hackathonTextProvider.getTextAlign(
                                defaultTemplateModel!
                                    .fields[1].textProperties.align),
                            // hackathonDetailsProvider.hackathonName,
                            style: GoogleFonts.getFont(
                                defaultTemplateModel!
                                    .fields[1].textProperties.font,
                                letterSpacing: defaultTemplateModel!
                                    .fields[1].textProperties.letterSpacing
                                    .toDouble(),
                                fontSize: scaleHeight(
                                    context,
                                    defaultTemplateModel!.fields[1].textProperties.size
                                        .toDouble() //54
                                    ),
                                decoration: TextDecoration.combine([
                                  defaultTemplateModel!
                                          .fields[1].textProperties.underline
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  defaultTemplateModel!
                                          .fields[1].textProperties.strikethrogh
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none
                                ]),
                                fontStyle: defaultTemplateModel!
                                        .fields[1].textProperties.italics
                                    ? FontStyle.italic
                                    : FontStyle.normal,
                                color: defaultTemplateProvider.stringToColor(
                                    defaultTemplateModel!.fields[1].textProperties.textColor),
                                fontWeight: defaultTemplateProvider.fontWeightFromInt(defaultTemplateModel!.fields[1].textProperties.fontWeight),
                                height: lineHeight(22.4, defaultTemplateModel!.fields[1].textProperties.size.toDouble()))),
                      ),
                      SizedBox(
                        height: scaleHeight(context, 11),
                      ),
                      SizedBox(
                        height: scaleHeight(context, 95),
                        width: scaleWidth(context, 700),
                        child: Text(
                            defaultTemplateModel!.fields[2].textProperties.upperCase
                                ? defaultTemplateModel!.hackathons.brief
                                    .toUpperCase()
                                : defaultTemplateModel!.hackathons.brief,
                            textAlign: hackathonTextProvider.getTextAlign(
                                defaultTemplateModel!
                                    .fields[2].textProperties.align),
                            maxLines: 4,
                            style: GoogleFonts.getFont(
                                defaultTemplateModel!
                                    .fields[2].textProperties.font,
                                letterSpacing: defaultTemplateModel!
                                    .fields[2].textProperties.letterSpacing
                                    .toDouble(),
                                fontSize: scaleHeight(
                                    context,
                                    defaultTemplateModel!.fields[2].textProperties.size
                                        .toDouble()),
                                decoration: TextDecoration.combine([
                                  defaultTemplateModel!
                                          .fields[2].textProperties.underline
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  defaultTemplateModel!
                                          .fields[2].textProperties.strikethrogh
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none
                                ]),
                                fontStyle: defaultTemplateModel!
                                        .fields[2].textProperties.italics
                                    ? FontStyle.italic
                                    : FontStyle.normal,
                                color: defaultTemplateProvider.stringToColor(defaultTemplateModel!.fields[2].textProperties.textColor),
                                fontWeight: defaultTemplateProvider.fontWeightFromInt(defaultTemplateModel!.fields[2].textProperties.fontWeight),
                                height: lineHeight(22.4, defaultTemplateModel!.fields[2].textProperties.size.toDouble()))),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -scaleHeight(context, 51),
                child: Container(
                  width: scaleWidth(context, 1108),
                  // padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 68.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      hackathonDetailContainer(
                          detail:
                              defaultTemplateModel!.hackathons.startDateTime ==
                                      ''
                                  ? ''
                                  : extractDate(defaultTemplateModel!
                                      .hackathons.startDateTime),
                          textProperties:
                              defaultTemplateModel!.fields[3].textProperties),
                      hackathonDetailContainer(
                          detail:
                              defaultTemplateModel!.hackathons.modeOfConduct,
                          textProperties:
                              defaultTemplateModel!.fields[4].textProperties),
                      hackathonDetailContainer(
                          detail: defaultTemplateModel!.hackathons.fee,
                          textProperties:
                              defaultTemplateModel!.fields[5].textProperties),
                      hackathonDetailContainer(
                          detail: defaultTemplateModel!.hackathons.teamSize,
                          textProperties:
                              defaultTemplateModel!.fields[6].textProperties),
                      hackathonDetailContainer(
                          detail: defaultTemplateModel!.hackathons.venue,
                          textProperties:
                              defaultTemplateModel!.fields[7].textProperties),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //spacing
          SizedBox(
            height: scaleHeight(context, 90),
          )
        ],
      ),
    );
  }

  String extractDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    // Construct the date string
    String date =
        "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    return date;
  }
}

class hackathonDetailContainer extends StatelessWidget {
  const hackathonDetailContainer({
    super.key,
    required this.detail,
    required this.textProperties,
  });

  final String detail;
  final TextFieldProperties textProperties;

  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);

    return Container(
      height: scaleHeight(context, 102),
      width: scaleWidth(context, 159),
      alignment:  hackathonTextProvider.getTextAlignForContainer(textProperties.align),
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context, 5),
          vertical: scaleHeight(context, 5)),
      decoration: const BoxDecoration(
          color: black1,
          borderRadius: BorderRadius.all(Radius.circular(rad5_3))),
      child: Text(detail,
          textAlign: hackathonTextProvider.getTextAlign(textProperties.align),
          style: GoogleFonts.getFont(textProperties.font,
          letterSpacing: textProperties.letterSpacing.toDouble(),
              fontSize: scaleHeight(context, textProperties.size.toDouble()),
              decoration: TextDecoration.combine([
                textProperties.underline
                    ? TextDecoration.underline
                    : TextDecoration.none,
                textProperties.strikethrogh
                    ? TextDecoration.lineThrough
                    : TextDecoration.none
              ]),
              fontStyle:
                  textProperties.italics ? FontStyle.italic : FontStyle.normal,
              color: defaultTemplateProvider
                  .stringToColor(textProperties.textColor),
              fontWeight: defaultTemplateProvider
                  .fontWeightFromInt(textProperties.fontWeight),
              height: lineHeight(22.4, textProperties.size.toDouble()))),
    );
  }
}
