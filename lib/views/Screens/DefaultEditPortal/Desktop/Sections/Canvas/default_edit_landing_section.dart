import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:provider/provider.dart';

class DefaultEditLandingSection extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditLandingSection(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    final landingHackathonNameController = TextEditingController();
    final hackathonDescriptionController = TextEditingController();
    final HackathonDateController = TextEditingController();
    final hackathonModeController = TextEditingController();
    final hackathonFeeController = TextEditingController();
    final hackathonTeamSizeController = TextEditingController();
    final hackathonVenueController = TextEditingController();

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);

    if (hackathonDetailsProvider.hackathonName.isNotEmpty) {
      landingHackathonNameController.text =
          hackathonDetailsProvider.hackathonName;
    }

    if (hackathonDetailsProvider.hackathonDescription.isNotEmpty) {
      hackathonDescriptionController.text =
          hackathonDetailsProvider.hackathonDescription;
    }

    if (hackathonDetailsProvider.hackathonDate.isNotEmpty) {
      HackathonDateController.text = hackathonDetailsProvider.hackathonDate;
    }

    if (hackathonDetailsProvider.hackathonMode.isNotEmpty) {
      hackathonModeController.text = hackathonDetailsProvider.hackathonMode;
    }

    hackathonDescriptionController.text =
        hackathonDetailsProvider.hackathonDescription;

    if (hackathonDetailsProvider.hackathonVenue.isNotEmpty) {
      hackathonVenueController.text = hackathonDetailsProvider.hackathonVenue;
    }

    if (hackathonDetailsProvider.hackathonfee.isNotEmpty) {
      hackathonFeeController.text = hackathonDetailsProvider.hackathonfee;
    }

    return Padding(
      padding: EdgeInsets.only(
          right: defaultEditScaleWidth(containerWidth, 81),
          left: defaultEditScaleWidth(containerWidth, 81),
          bottom: defaultEditScaleHeight(containerHeight, 39)),
      child: Column(
        children: [
          //NavBar

          SizedBox(
            height: defaultEditScaleHeight(containerHeight, 70),
          ),

          //Landing Section
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: defaultEditScaleHeight(containerHeight, 523),
                width: defaultEditScaleWidth(containerWidth, 1108),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: lavender,
                    borderRadius: BorderRadius.all(Radius.circular(rad5_6))),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Organisation name presents',
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize:
                                  defaultEditScaleHeight(containerHeight, 20),
                              color: greyish1,
                              fontWeight: FontWeight.w500,
                              height: lineHeight(22.4, 20))),
                      SizedBox(
                        height: defaultEditScaleHeight(containerHeight, 42),
                      ),
                      Container(
                        color: Colors.green[100],
                        width: defaultEditScaleWidth(containerWidth, 700),
                        height: defaultEditScaleHeight(containerHeight, 54),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          controller: landingHackathonNameController,
                          cursorHeight:
                              defaultEditScaleHeight(containerHeight, 49),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Your Hackathon Name ',
                            hintStyle: GoogleFonts.getFont(fontFamily2,
                                fontSize:
                                    defaultEditScaleHeight(containerHeight, 54),
                                color: black2,
                                fontWeight: FontWeight.w600,
                                height: lineHeight(50.4,
                                    54)), //Line Height is changed because of cursor size, initial line height was 22.4
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            counterText: "",
                          ),
                          maxLength: 30,
                          keyboardType: TextInputType.text,
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize:
                                  defaultEditScaleHeight(containerHeight, 54),
                              color: black2,
                              fontWeight: FontWeight.w600,
                              height:
                                  lineHeight(50.4, 54)), //Line Height Changed
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            hackathonDetailsProvider.hackathonName =
                                value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: defaultEditScaleHeight(containerHeight, 11),
                      ),

                      SizedBox(
                        width: defaultEditScaleWidth(containerWidth, 700),
                        height: defaultEditScaleHeight(containerHeight, 95),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          controller: hackathonDescriptionController,
                          cursorHeight:
                              defaultEditScaleHeight(containerHeight, 20),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText:
                                'Give us brief about your hackathon (60 words)',
                            hintStyle: GoogleFonts.getFont(fontFamily2,
                                fontSize:
                                    defaultEditScaleHeight(containerHeight, 18),
                                color: black2,
                                fontWeight: FontWeight.w400,
                                height: lineHeight(22.4,
                                    18)), //Line Height is changed because of cursor size, initial line height was 22.4
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            counterText: "",
                          ),
                          maxLength: 300,
                          maxLines: 4,
                          keyboardType: TextInputType.text,
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize:
                                  defaultEditScaleHeight(containerHeight, 18),
                              color: black2,
                              fontWeight: FontWeight.w400,
                              height:
                                  lineHeight(22.4, 18)), //Line Height Changed
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            hackathonDetailsProvider.hackathonDescription =
                                value.toString();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -defaultEditScaleHeight(containerHeight, 51),
                child: Container(
                  width: defaultEditScaleWidth(containerWidth, 1108),
                  // padding: EdgeInsets.symmetric(horizontal: defaultEditScaleWidth(containerWidth, 68.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      hackathonDetailContainer(
                        containerHeight: containerHeight,
                        containerWidth: containerWidth,
                        detail: 'Date',
                        controller: HackathonDateController,
                        onSaved: (value) {
                          hackathonDetailsProvider.hackathonDate =
                              value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Date',
                      ),
                      hackathonDetailContainer(
                        containerHeight: containerHeight,
                        containerWidth: containerWidth,
                        detail: 'Mode of Conduct',
                        controller: hackathonModeController,
                        onSaved: (value) {
                          hackathonDetailsProvider.hackathonMode =
                              value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Mode of Conduct',
                      ),
                      hackathonDetailContainer(
                        containerHeight: containerHeight,
                        containerWidth: containerWidth,
                        detail: 'Participation fee',
                        controller: hackathonFeeController,
                        onSaved: (value) {
                          hackathonDetailsProvider.hackathonfee =
                              value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Participation fee',
                      ),
                      hackathonDetailContainer(
                          containerHeight: containerHeight,
                          containerWidth: containerWidth,
                          detail: 'Team Size',
                          controller: hackathonTeamSizeController,
                          onSaved: (value) {
                            hackathonDetailsProvider.hackathonTeamSize =
                                int.tryParse(value ?? '') ?? 0;
                          },
                          type: TextInputType.number,
                          hint: 'Team Size'),
                      hackathonDetailContainer(
                        containerHeight: containerHeight,
                        containerWidth: containerWidth,
                        detail: 'Venue',
                        controller: hackathonVenueController,
                        onSaved: (value) {
                          hackathonDetailsProvider.hackathonVenue =
                              value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Venue',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //spacing
          SizedBox(
            height: defaultEditScaleHeight(containerHeight, 90),
          )
        ],
      ),
    );
  }
}

class hackathonDetailContainer extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final TextEditingController controller;
  final void Function(dynamic)? onSaved;
  final TextInputType type;
  final String hint;
  const hackathonDetailContainer({
    super.key,
    required this.detail,
    required this.containerHeight,
    required this.containerWidth,
    required this.controller,
    this.onSaved,
    required this.type,
    required this.hint,
  });

  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultEditScaleHeight(containerHeight, 102),
      width: defaultEditScaleWidth(containerWidth, 159),
      //alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: defaultEditScaleWidth(containerWidth, 5),
          vertical: defaultEditScaleHeight(containerHeight, 5)),
      decoration: const BoxDecoration(
          color: black1,
          borderRadius: BorderRadius.all(Radius.circular(rad5_3))),
      child: TextFormField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          cursorHeight: defaultEditScaleHeight(containerHeight, 17),
          cursorColor: Colors.white,
          keyboardType: type,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.getFont(fontFamily2,
                fontSize: defaultEditScaleHeight(containerHeight, 20),
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: lineHeight(22.4, 20)),
            //Line Height is changed because of cursor size, initial line height was 22.4
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            counterText: "",
          ),
          maxLength: 15,
          style: GoogleFonts.getFont(fontFamily2,
              fontSize: defaultEditScaleHeight(containerHeight, 20),
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: lineHeight(22.4, 20)), //Line Height Changed
          validator: (value) {
            if (value!.isEmpty) {
              return '';
            }
            return null;
          },
          onSaved: onSaved),

    );
  }
}
