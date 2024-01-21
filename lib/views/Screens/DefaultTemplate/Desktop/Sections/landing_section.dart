import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
// import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_text.dart';
import 'package:provider/provider.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key, required this.defaultTemplateModel});
  final DefaultTemplateApiResponse? defaultTemplateModel;

  @override
  Widget build(BuildContext context) {
    // final hackathonDetailsProvider =
    //     Provider.of<HackathonDetailsProvider>(context);
    
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
                          child: DefaultTemplateText(
                            name:
                                '${defaultTemplateModel!.hackathons.organisationName} presents',
                            textProperties:
                                defaultTemplateModel!.fields[0].textProperties,
                            height: 22.4,
                          )),
                      SizedBox(
                        height: scaleHeight(context, 42),
                      ),
                      SizedBox(
                        width: scaleWidth(context, 700),
                        height: scaleHeight(context, 54),
                        child: DefaultTemplateText(
                          name: defaultTemplateModel!.hackathons.name,
                          textProperties:
                              defaultTemplateModel!.fields[1].textProperties,
                          height: 22.4,
                        ),
                      ),
                      SizedBox(
                        height: scaleHeight(context, 11),
                      ),
                      SizedBox(
                        height: scaleHeight(context, 95),
                        width: scaleWidth(context, 700),
                        child: DefaultTemplateText(
                          name: defaultTemplateModel!.hackathons.brief,
                          textProperties:
                              defaultTemplateModel!.fields[2].textProperties,
                          maxLines: 4,
                          height: 22.4,
                        ),
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
    
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);

    return Container(
      height: scaleHeight(context, 102),
      width: scaleWidth(context, 159),
      alignment:
          defaultTemplateProvider.getTextAlignForContainer(textProperties.align),
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context, 5),
          vertical: scaleHeight(context, 5)),
      decoration: const BoxDecoration(
          color: black1,
          borderRadius: BorderRadius.all(Radius.circular(rad5_3))),
      child: DefaultTemplateText(
        name: detail,
        textProperties: textProperties,
        height: 22.4,
      ),
    );
  }
}
