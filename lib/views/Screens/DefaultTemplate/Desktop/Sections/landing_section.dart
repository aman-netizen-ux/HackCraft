import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:provider/provider.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key, required this.defaultTemplateModel});
      final DefaultTemplateApiResponse? defaultTemplateModel;


  @override
  Widget build(BuildContext context) {
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${ defaultTemplateModel!.hackathons.organisationName} presents',
                          style: GoogleFonts.getFont(defaultTemplateModel!.fields[0].textProperties.font,
                              fontSize: scaleHeight(context, 
                              defaultTemplateModel!.fields[0].textProperties.size.toDouble()//20
                              ),
                              fontStyle: defaultTemplateModel!.fields[0].textProperties.italics ? FontStyle.italic : FontStyle.normal,
                              decoration: defaultTemplateModel!.fields[0].textProperties.underline ? TextDecoration.underline : TextDecoration.none,
                              color: greyish1,
                              fontWeight: defaultTemplateProvider.fontWeightFromInt(defaultTemplateModel!.fields[0].textProperties.fontWeight),
                              height: lineHeight(22.4, 
                              defaultTemplateModel!.fields[0].textProperties.size.toDouble()
                              ))),
                      SizedBox(
                        height: scaleHeight(context, 42),
                      ),
                      Text(
                          // 'Your Hackathon Name',
                          defaultTemplateModel!.hackathons.name,
                          // hackathonDetailsProvider.hackathonName,
                          style: GoogleFonts.getFont(defaultTemplateModel!.fields[1].textProperties.font,
                              fontSize: scaleHeight(context, 
                              defaultTemplateModel!.fields[1].textProperties.size.toDouble()//54
                              ),
                              decoration: defaultTemplateModel!.fields[1].textProperties.underline ? TextDecoration.underline : TextDecoration.none,
                              fontStyle: defaultTemplateModel!.fields[1].textProperties.italics ? FontStyle.italic : FontStyle.normal,
                              color: black2,
                              fontWeight: defaultTemplateProvider.fontWeightFromInt(defaultTemplateModel!.fields[1].textProperties.fontWeight),
                              height: lineHeight(22.4, 
                              defaultTemplateModel!.fields[1].textProperties.size.toDouble()
                              ))),
                      SizedBox(
                        height: scaleHeight(context, 11),
                      ),
                      SizedBox(
                        height: scaleHeight(context, 95),
                        width: scaleWidth(context, 700),
                        child: Text(
                          defaultTemplateModel!.hackathons.brief,
                            // hackathonDetailsProvider.hackathonDescription,
                            textAlign:TextAlign.center,
                            maxLines: 4,
                            style: GoogleFonts.getFont(fontFamily2,
                                fontSize: scaleHeight(context, 18),
                                color: greyish1,
                                fontWeight: FontWeight.w400,
                                height: lineHeight(22.4, 18))),
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
                          detail:defaultTemplateModel!.hackathons.startDateTime==''
                          ? ''
                          :extractDate(defaultTemplateModel!.hackathons.startDateTime)),
                      hackathonDetailContainer(
                          detail: defaultTemplateModel!.hackathons.modeOfConduct),
                      hackathonDetailContainer(
                          detail: defaultTemplateModel!.hackathons.fee),
                      hackathonDetailContainer(
                          detail: defaultTemplateModel!.hackathons.teamSize),
                      hackathonDetailContainer(
                          detail: defaultTemplateModel!.hackathons.venue),
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
  String date = "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  return date;
}
}

class hackathonDetailContainer extends StatelessWidget {
  const hackathonDetailContainer({
    super.key,
    required this.detail,
  });

  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(context, 102),
      width: scaleWidth(context, 159),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context, 5),
          vertical: scaleHeight(context, 5)),
      decoration: const BoxDecoration(
          color: black1,
          borderRadius: BorderRadius.all(Radius.circular(rad5_3))),
      child: Text(detail,
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(fontFamily2,
              fontSize: scaleHeight(context, 20),
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: lineHeight(22.4, 20))),
    );
  }
}
