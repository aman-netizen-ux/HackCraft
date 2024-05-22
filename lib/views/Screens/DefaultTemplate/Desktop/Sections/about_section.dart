import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/state/getHackathon/getSingleHackathonProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_text.dart';

import 'package:provider/provider.dart';

class About extends StatelessWidget {
  const About(
      {super.key, required this.defaultTemplateModel, required this.isEdit});
  final DefaultTemplateApiResponse? defaultTemplateModel;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);
    return Padding(
      key: aboutUs,
      padding: EdgeInsets.only(top: scaleHeight(context, 67)),
      child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            //This container will show the complete description of the hackathon, including rounds, rules, and many other things.
            //The height of the container will automatically increase based on the size of the text being entered.

            Column(
              children: [
                InkWell(
                  onTap: () {
                    if (!isEdit) {
                      final singleHackathonProvider =
                          Provider.of<SingleHackathonProvider>(context,
                              listen: false);
                      String userType = singleHackathonProvider.userType;

                      if (userType == "leader" || userType == "member") {
                        logger.i("participant details screen");
                      } else {
                        //go to form screen

                        Navigator.pushNamed(
                          context,
                          '/getRegistration',
                          arguments: {
                            'hackathonId': defaultTemplateModel!.hackathons.id,
                            'userType': userType,
                            'hackathonName':
                                defaultTemplateModel!.hackathons.name
                          },
                        );
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: scaleWidth(context, 512)),
                    height: scaleHeight(
                        context,
                        defaultTemplateModel!
                            .containers[7].containerProperties.height
                            .toDouble()),
                    width: scaleWidth(context, 256),
                    decoration: BoxDecoration(
                        color: defaultTemplateProvider.stringToColor(defaultTemplateModel!
                            .containers[7].containerProperties.color),
                        borderRadius: BorderRadius.circular(defaultTemplateModel!
                            .containers[7].containerProperties.borderRadius
                            .toDouble()),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: defaultTemplateModel!
                                  .containers[7].containerProperties.blurRadius
                                  .toDouble(),
                              offset: const Offset(0, 0),
                              spreadRadius: 0,
                              color: defaultTemplateProvider.stringToColor(
                                  defaultTemplateModel!.containers[7]
                                      .containerProperties.boxShadowColor))
                        ],
                        border: Border.all(
                            color: defaultTemplateProvider.stringToColor(defaultTemplateModel!
                                .containers[7].containerProperties.borderColor),
                            width: scaleWidth(
                                context,
                                defaultTemplateModel!.containers[7]
                                    .containerProperties.borderWidth
                                    .toDouble()),
                            strokeAlign: BorderSide.strokeAlignOutside)),
                    child: Text("Get Registered",
                        style: GoogleFonts.getFont(fontFamily2,
                            fontWeight: FontWeight.w600,
                            fontSize: scaleWidth(context, 21),
                            height: lineHeight(22.4, 21),
                            color: black1)),
                  ),
                ),
                SizedBox(height: scaleWidth(context, 20)),
                Container(
                    width: double.infinity,
                    height: scaleHeight(
                        context,
                        defaultTemplateModel!
                            .containers[6].containerProperties.height
                            .toDouble()),
                    padding: EdgeInsets.only(
                      left: scaleWidth(context, 44),
                      right: scaleWidth(context, 44),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: scaleWidth(context, 37)),
                    decoration: BoxDecoration(
                        color: defaultTemplateProvider.stringToColor(
                            defaultTemplateModel!
                                .containers[6].containerProperties.color),
                        borderRadius: BorderRadius.circular(defaultTemplateModel!
                            .containers[6].containerProperties.borderRadius
                            .toDouble()),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: defaultTemplateModel!
                                  .containers[6].containerProperties.blurRadius
                                  .toDouble(),
                              offset: const Offset(0, 0),
                              spreadRadius: 0,
                              color: defaultTemplateProvider.stringToColor(
                                  defaultTemplateModel!.containers[6]
                                      .containerProperties.boxShadowColor))
                        ],
                        border: Border.all(
                            color: defaultTemplateProvider.stringToColor(
                                defaultTemplateModel!.containers[6]
                                    .containerProperties.borderColor),
                            width: scaleWidth(context, defaultTemplateModel!.containers[6].containerProperties.borderWidth.toDouble() / 100 * 40),
                            strokeAlign: BorderSide.strokeAlignOutside)),
                    child: DefaultTemplateText(
                      name: defaultTemplateModel!.hackathons.about,
                      // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis velit nec justo fermentum dignissim. Sed lacinia ex eu mi malesuada, sed interdum metus posuere. Vivamus auctor sapien in eleifend. Fusce nec est eget lorem ultrices facilisis a eget dolor. Integer eget velit sit amet lorem gravida vestibulum. Proin eget vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur eget tellus ut odio facilisis bibendum nec nec tortor. Vivamus iaculis, turpis et tincidunt mattis, est arcu laoreet urna, nec dignissim nisl odio a nunc. Phasellus fermentum tristique orci, vel convallis tortor vehicula nec.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis velit nec justo fermentum dignissim. Sed lacinia ex eu mi malesuada, sed interdum metus posuere. Vivamus auctor sapien in eleifend. Fusce nec est eget lorem ultrices facilisis a eget dolor. Integer eget velit sit amet lorem gravida vestibulum. Proin eget vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur eget tellus ut odio facilisis bibendum nec nec tortor. Vivamus iaculis, turpis et tincidunt mattis, est arcu laoreet urna, nec dignissim nisl odio a nunc. Phasellus fermentum tristique orci, vel convallis tortor vehicula nec.Suspendisse potenti. Donec ullamcorper consectetur nunc, ut aliquam nulla blandit eget. Nunc pharetra diam ac turpis viverra varius. Sed ut erat justo. Fusce in tellus ut sapien venenatis volutpat. Nam eu sapien nec enim rhoncus volutpat vel eu libero. Nam vel augue sit amet odio malesuada mattis eget eu sapien. Integer ut nisi vitae libero gravida pharetra. Nunc varius tincidunt justo, a vehicula justo rhoncus ut. Sed bibendum, risus at euismod venenatis, purus metus tincidunt libero, a facilisis justo justo id libero. Maecenas ultricies augue a hendrerit iaculis.',
                      textProperties:
                          defaultTemplateModel!.fields[9].textProperties,
                    )),
                SizedBox(
                  width: double.infinity,
                  height: scaleHeight(context, 125),
                  // color: Colors.blue,
                ),
              ],
            ),
            //The register button is positioned accordingly so that it starts before the container and goes until the container starts.
            //When you run the code, you'll understand what's written here.
            //  ,
            //This container is used to show the prize section. It's also positioned like the above container,
            //but the difference is that the above one was positioned from the top and this one was positioned from the bottom.
            //Run the code once, and you'll understand.
            // Positioned(
            //   bottom: scaleWidth(context, 0), //120
            //   child: Container(
            //       // color: lavender,
            //       height: scaleHeight(context, 400), //240
            //       width: scaleWidth(context, 1118),
            //       margin:
            //           EdgeInsets.symmetric(horizontal: scaleWidth(context, 81)),
            //       child: SvgPicture.asset(
            //           'assets/icons/defaultEditPortal/about.svg',
            //           fit: BoxFit.fill)),
            // ),
          ]),
          // SizedBox(
          //   height: scaleHeight(context, 0), //153
          // )
        ],
      ),
    );
  }
}
