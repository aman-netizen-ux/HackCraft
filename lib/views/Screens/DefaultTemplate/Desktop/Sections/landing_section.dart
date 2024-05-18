import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_text.dart';
import 'package:provider/provider.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key, required this.defaultTemplateModel});
  final DefaultTemplateApiResponse? defaultTemplateModel;

  @override
  Widget build(BuildContext context) {
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
                height: scaleHeight(
                    context,
                    defaultTemplateModel!
                        .containers[0].containerProperties.height
                        .toDouble()),
                width: scaleWidth(context, 1108),
                alignment: Alignment.center,
                padding:
                    EdgeInsets.symmetric(horizontal: scaleWidth(context, 100)),
                decoration: BoxDecoration(
                    color: defaultTemplateProvider.stringToColor(defaultTemplateModel!
                        .containers[0].containerProperties.color),
                    border: Border.all(
                        width: defaultTemplateModel!
                            .containers[0].containerProperties.borderWidth
                            .toDouble(),
                        color: defaultTemplateProvider.stringToColor(defaultTemplateModel!
                            .containers[0].containerProperties.borderColor),
                        strokeAlign: BorderSide.strokeAlignCenter),
                    borderRadius: BorderRadius.all(Radius.circular(defaultTemplateModel!
                        .containers[0].containerProperties.borderRadius
                        .toDouble())),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: defaultTemplateModel!
                              .containers[0].containerProperties.blurRadius
                              .toDouble(),
                          offset: const Offset(0, 0),
                          spreadRadius: 0,
                          color: defaultTemplateProvider.stringToColor(
                              defaultTemplateModel!.containers[0]
                                  .containerProperties.boxShadowColor))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTemplateText(
                      name:
                          '${defaultTemplateModel!.hackathons.organisationName} presents',
                      textProperties:
                          defaultTemplateModel!.fields[0].textProperties,
                      height: 22.4,
                    ),
                    SizedBox(
                      height: scaleHeight(context, 42),
                    ),
                    DefaultTemplateText(
                      name: defaultTemplateModel!.hackathons.name,
                      textProperties:
                          defaultTemplateModel!.fields[1].textProperties,
                      height: 22.4,
                    ),
                    SizedBox(
                      height: scaleHeight(context, 11),
                    ),
                    DefaultTemplateText(
                      name: defaultTemplateModel!.hackathons.brief,
                      textProperties:
                          defaultTemplateModel!.fields[2].textProperties,
                      maxLines: 4,
                      height: 22.4,
                    ),
                  ],
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
                          detail1:
                              defaultTemplateModel!.hackathons.modeOfConduct,
                          textProperties1:
                              defaultTemplateModel!.fields[3].textProperties,
                          containerProperties: defaultTemplateModel!
                              .containers[1].containerProperties,
                          isSecondContainer: false,
                          textProperties2:
                              defaultTemplateModel!.fields[4].textProperties,
                          textProperties3:
                              defaultTemplateModel!.fields[5].textProperties,
                          detail2: defaultTemplateModel!.hackathons.fee,
                          detai3: defaultTemplateModel!.hackathons.venue)
                      // hackathonDetailContainer(
                      //     detail:
                      //         defaultTemplateModel!.hackathons.startDateTime ==
                      //                 ''
                      //             ? ''
                      //             : extractDate(defaultTemplateModel!
                      //                 .hackathons.startDateTime),
                      //     textProperties:
                      //         defaultTemplateModel!.fields[3].textProperties,
                      //     containerProperties: defaultTemplateModel!
                      //         .containers[1].containerProperties),
                      // hackathonDetailContainer(
                      //     detail:
                      //         "Mode : ${defaultTemplateModel!.hackathons.modeOfConduct}",
                      //     textProperties:
                      //         defaultTemplateModel!.fields[4].textProperties,
                      //     containerProperties: defaultTemplateModel!
                      //         .containers[2].containerProperties),
                      // hackathonDetailContainer(
                      //     detail: "Fee : ${defaultTemplateModel!.hackathons.fee}",
                      //     textProperties:
                      //         defaultTemplateModel!.fields[5].textProperties,
                      //     containerProperties: defaultTemplateModel!
                      //         .containers[3].containerProperties),
                      // hackathonDetailContainer(
                      //     detail: "Team Size: ${defaultTemplateModel!.hackathons.teamSize}",
                      //     textProperties:
                      //         defaultTemplateModel!.fields[6].textProperties,
                      //     containerProperties: defaultTemplateModel!
                      //         .containers[4].containerProperties),
                      // hackathonDetailContainer(
                      //     detail: "Venue: ${defaultTemplateModel!.hackathons.venue}",
                      //     textProperties:
                      //         defaultTemplateModel!.fields[7].textProperties,
                      //     containerProperties: defaultTemplateModel!
                      //         .containers[5].containerProperties),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //spacing
          SizedBox(
            height: scaleHeight(context, 90),
          ),
          hackathonDetailContainer(
              detail1: defaultTemplateModel!.hackathons.startDateTime,
              textProperties1: defaultTemplateModel!.fields[6].textProperties,
              containerProperties:
                  defaultTemplateModel!.containers[2].containerProperties,
              isSecondContainer: true,
              textProperties2: defaultTemplateModel!.fields[7].textProperties,
              textProperties3: defaultTemplateModel!.fields[8].textProperties,
              detail2: defaultTemplateModel!.hackathons.teamSize,
              detai3: defaultTemplateModel!.hackathons.deadline)
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
    required this.detail1,
    required this.textProperties1,
    required this.containerProperties,
    required this.isSecondContainer,
    required this.textProperties2,
    required this.textProperties3,
    required this.detail2,
    required this.detai3,
  });

  final String detail1;
  final String detail2;
  final String detai3;
  final TextFieldProperties textProperties1;
  final TextFieldProperties textProperties2;
  final TextFieldProperties textProperties3;
  final ContainerProperties containerProperties;
  final bool isSecondContainer;

  @override
  Widget build(BuildContext context) {
    print('label1 : $detail1, $detail2, $detai3');
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);

    return Container(
      height: scaleHeight(context, containerProperties.height.toDouble()),
      width: scaleWidth(context, 991),
      // alignment: defaultTemplateProvider
      //     .getTextAlignForContainer(textProperties.align),
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context, 43),
          vertical: scaleHeight(context, isSecondContainer ? 27 : 50)),
      decoration: BoxDecoration(
          color:
              defaultTemplateProvider.stringToColor(containerProperties.color),
          borderRadius: BorderRadius.all(
              Radius.circular(containerProperties.borderRadius.toDouble())),
          border: Border.all(
              width: containerProperties.borderWidth.toDouble() / 100 * 15,
              color: defaultTemplateProvider
                  .stringToColor(containerProperties.borderColor),
              strokeAlign: BorderSide.strokeAlignCenter),
          boxShadow: [
            BoxShadow(
                blurRadius: containerProperties.blurRadius.toDouble(),
                offset: const Offset(0, 0),
                spreadRadius: 0,
                color: defaultTemplateProvider
                    .stringToColor(containerProperties.boxShadowColor))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTemplateText(
                name: detail1,
                textProperties: textProperties1,
                height: 22.4,
              ),
              SizedBox(height: scaleHeight(context, isSecondContainer ? 6 : 8)),
              Text(isSecondContainer ? 'Reg Start Date' : 'Mode Of Conduct',
                  style: GoogleFonts.getFont(textProperties1.font,
                      letterSpacing: textProperties1.letterSpacing.toDouble(),
                      fontSize: scaleHeight(
                              context, textProperties1.size.toDouble()) -
                          2,
                      fontStyle: textProperties1.italics
                          ? FontStyle.italic
                          : FontStyle.normal,
                      decoration: TextDecoration.combine([
                        textProperties1.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        textProperties1.strikethrogh
                            ? TextDecoration.lineThrough
                            : TextDecoration.none
                      ]),
                      color: defaultTemplateProvider
                          .stringToColor(textProperties1.textColor),
                      fontWeight: FontWeight.w300,
                      height:
                          lineHeight(22.4, textProperties1.size.toDouble())))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTemplateText(
                name: detail2,
                textProperties: textProperties2,
                height: 22.4,
              ),
              SizedBox(height: scaleHeight(context, isSecondContainer ? 6 : 8)),
              Text(isSecondContainer ? 'Team Size' : 'Participation Fee',
                  style: GoogleFonts.getFont(textProperties2.font,
                      letterSpacing: textProperties2.letterSpacing.toDouble(),
                      fontSize: scaleHeight(
                              context, textProperties2.size.toDouble()) -
                          2,
                      fontStyle: textProperties2.italics
                          ? FontStyle.italic
                          : FontStyle.normal,
                      decoration: TextDecoration.combine([
                        textProperties2.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        textProperties2.strikethrogh
                            ? TextDecoration.lineThrough
                            : TextDecoration.none
                      ]),
                      color: defaultTemplateProvider
                          .stringToColor(textProperties2.textColor),
                      fontWeight: FontWeight.w300,
                      height:
                          lineHeight(22.4, textProperties2.size.toDouble())))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTemplateText(
                name: detai3,
                textProperties: textProperties3,
                height: 22.4,
              ),
              SizedBox(height: scaleHeight(context, isSecondContainer ? 6 : 8)),
              Text(isSecondContainer ? 'Reg Ending Date' : 'Venue',
                  style: GoogleFonts.getFont(textProperties3.font,
                      letterSpacing: textProperties3.letterSpacing.toDouble(),
                      fontSize: scaleHeight(
                              context, textProperties3.size.toDouble()) -
                          2,
                      fontStyle: textProperties3.italics
                          ? FontStyle.italic
                          : FontStyle.normal,
                      decoration: TextDecoration.combine([
                        textProperties3.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        textProperties3.strikethrogh
                            ? TextDecoration.lineThrough
                            : TextDecoration.none
                      ]),
                      color: defaultTemplateProvider
                          .stringToColor(textProperties3.textColor),
                      fontWeight: FontWeight.w300,
                      height:
                          lineHeight(22.4, textProperties3.size.toDouble())))
            ],
          ),
        ],
      ),
    );
  }
}


// class hackathonDetailContainer extends StatelessWidget {
//   const hackathonDetailContainer({
//     super.key,
//     required this.detail,
//     required this.textProperties,
//     required this.containerProperties,
//   });

//   final String detail;
//   final TextFieldProperties textProperties;
//   final ContainerProperties containerProperties;

//   @override
//   Widget build(BuildContext context) {
//     final defaultTemplateProvider =
//         Provider.of<DefaultTemplateProvider>(context);
//     print('border wieght : ${containerProperties.borderWidth.toDouble()}');

//     return Container(
//       height: scaleHeight(context, containerProperties.height.toDouble()),
//       width: scaleWidth(context, 159),
//       alignment: defaultTemplateProvider
//           .getTextAlignForContainer(textProperties.align),
//       padding: EdgeInsets.symmetric(
//           horizontal: scaleWidth(context, 5),
//           vertical: scaleHeight(context, 5)),
//       decoration: BoxDecoration(
//           color:
//               defaultTemplateProvider.stringToColor(containerProperties.color),
//           borderRadius: BorderRadius.all(
//               Radius.circular(containerProperties.borderRadius.toDouble())),
//           border: Border.all(
//               width: containerProperties.borderWidth.toDouble() / 100 * 15,
//               color: defaultTemplateProvider
//                   .stringToColor(containerProperties.borderColor),
//               strokeAlign: BorderSide.strokeAlignCenter),
//           boxShadow: [
//             BoxShadow(
//                 blurRadius: containerProperties.blurRadius.toDouble(),
//                 offset: const Offset(0, 0),
//                 spreadRadius: 0,
//                 color: defaultTemplateProvider
//                     .stringToColor(containerProperties.boxShadowColor))
//           ]),
//       child: DefaultTemplateText(
//         name: detail,
//         textProperties: textProperties,
//         height: 22.4,
//       ),
//     );
//   }
// }
