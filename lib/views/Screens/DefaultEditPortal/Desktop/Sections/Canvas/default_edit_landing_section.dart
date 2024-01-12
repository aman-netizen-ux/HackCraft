import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:provider/provider.dart';

class DefaultEditLandingSection extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditLandingSection(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  State<DefaultEditLandingSection> createState() =>
      _DefaultEditLandingSectionState();
}

class _DefaultEditLandingSectionState extends State<DefaultEditLandingSection> {
  /*controllers are initialized out of the build so onTap can be used in textFormField without 
  every time updating other textFormFields It will only initialize when init runs and
  gets disposed of when widget will get remove from widget tree*/
  late TextEditingController landingHackathonNameController;
  late TextEditingController hackathonOrganisationController;
  late TextEditingController hackathonDescriptionController;
  late TextEditingController hackathonDateController;
  late TextEditingController hackathonModeController;
  late TextEditingController hackathonFeeController;
  late TextEditingController hackathonTeamSizeController;
  late TextEditingController hackathonVenueController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    hackathonOrganisationController = TextEditingController();
    landingHackathonNameController = TextEditingController();
    hackathonDescriptionController = TextEditingController();
    hackathonDateController = TextEditingController();
    hackathonModeController = TextEditingController();
    hackathonFeeController = TextEditingController();
    hackathonTeamSizeController = TextEditingController();
    hackathonVenueController = TextEditingController();

// HackathonTextPropertiesProvider is for text Field Properties and its methods
    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context, listen: false);

/*  We are passing Global keys like organisationKey, hackathonNameKey defined in utils to set the properties 
    of every text form fields defined with these unique keys and
    we can gwt the properties as well with the same keys*/

    // the values being passed here are the initial values
    hackathonTextPropertiesProvider.textFieldPropertiesMap[organisationKey] =
        TextFieldProperties(
      size: 20,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 500,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF564A4A);',
      underline: false,
      upperCase: false,
    );
    hackathonTextPropertiesProvider.textFieldPropertiesMap[hackathonNameKey] =
        TextFieldProperties(
      size: 54,
      align: 'left',
      font: 'Montserrat',
      fontWeight: 600,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF000100)',
      underline: false,
      upperCase: false,
    );

    if (hackathonDetailsProvider.organisationName.isNotEmpty) {
      hackathonOrganisationController.text =
          hackathonDetailsProvider.organisationName;
    }

    if (hackathonDetailsProvider.hackathonName.isNotEmpty) {
      landingHackathonNameController.text =
          hackathonDetailsProvider.hackathonName;
    }

    if (hackathonDetailsProvider.venue.isNotEmpty) {
      hackathonVenueController.text = hackathonDetailsProvider.venue;
    }
  }

  @override
  void dispose() {
    hackathonOrganisationController.dispose();
    landingHackathonNameController.dispose();
    hackathonDescriptionController.dispose();
    hackathonDateController.dispose();
    hackathonModeController.dispose();
    hackathonFeeController.dispose();
    hackathonTeamSizeController.dispose();
    hackathonVenueController.dispose();

    // ... dispose other controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final hackathonTeamSizeController = TextEditingController();

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    if (hackathonDetailsProvider.brief.isNotEmpty) {
      hackathonDescriptionController.text = hackathonDetailsProvider.brief;
    }

    if (hackathonDetailsProvider.startDateTime.isNotEmpty) {
      hackathonDateController.text = hackathonDetailsProvider.startDateTime;
    }

    if (hackathonDetailsProvider.modeOfConduct.isNotEmpty) {
      hackathonModeController.text = hackathonDetailsProvider.modeOfConduct;
    }

    if (hackathonDetailsProvider.teamSize.isNotEmpty) {
      hackathonTeamSizeController.text = hackathonDetailsProvider.teamSize;
    }

    if (hackathonDetailsProvider.fee.isNotEmpty) {
      hackathonFeeController.text = hackathonDetailsProvider.fee;
    }

    return Padding(
      padding: EdgeInsets.only(
          right: defaultEditScaleWidth(widget.containerWidth, 81),
          left: defaultEditScaleWidth(widget.containerWidth, 81),
          bottom: defaultEditScaleHeight(widget.containerHeight, 39)),
      child: Column(
        children: [
          //NavBar

          SizedBox(
            height: defaultEditScaleHeight(widget.containerHeight, 70),
          ),

          //Landing Section
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: defaultEditScaleHeight(widget.containerHeight, 523),
                width: defaultEditScaleWidth(widget.containerWidth, 1108),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: lavender,
                    borderRadius: BorderRadius.all(Radius.circular(rad5_6))),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:
                            defaultEditScaleWidth(widget.containerWidth, 700),
                        height:
                            defaultEditScaleHeight(widget.containerHeight, 50),
                        child: TextFormField(
                          // the key is passed to fetch the properties of the text form field mapped against this key
                          key: organisationKey,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          controller: hackathonOrganisationController,
                          cursorHeight: defaultEditScaleHeight(
                              widget.containerHeight, 20),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Organisation name',

                            hintStyle: GoogleFonts.getFont(
                                hackathonTextPropertiesProvider
                                    .textFieldPropertiesMap[organisationKey]!
                                    .font,
                                fontStyle: hackathonTextPropertiesProvider
                                        .textFieldPropertiesMap[
                                            organisationKey]!
                                        .italics
                                    ? FontStyle.italic
                                    : FontStyle.normal,
                                fontSize: defaultEditScaleHeight(
                                    widget.containerHeight,
                                    hackathonTextPropertiesProvider
                                        .textFieldPropertiesMap[
                                            organisationKey]!
                                        .size
                                        .toDouble()), //20
                                color: hackathonTextPropertiesProvider.stringToColor(organisationKey),//greyish1
                                fontWeight:hackathonTextPropertiesProvider.getSelectedTextFieldFontWeight(organisationKey),
                                height: lineHeight(
                                    22.4,
                                    hackathonTextPropertiesProvider
                                        .textFieldPropertiesMap[organisationKey]!
                                        .size
                                        .toDouble())), //20 //Line Height is changed because of cursor size, initial line height was 22.4
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            counterText: "",
                          ),
                          maxLength: 300,
                          maxLines: 4,
                          keyboardType: TextInputType.text,
                          style: GoogleFonts.getFont(
                              hackathonTextPropertiesProvider
                                  .textFieldPropertiesMap[organisationKey]!
                                  .font,
                              fontSize: defaultEditScaleHeight(
                                  widget.containerHeight,
                                  hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[organisationKey]!
                                      .size
                                      .toDouble()), //20
                              decoration: hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[organisationKey]!
                                      .underline
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              color: hackathonTextPropertiesProvider.stringToColor(organisationKey),//greyish1
                              fontWeight:hackathonTextPropertiesProvider.getSelectedTextFieldFontWeight(organisationKey),
                              height: lineHeight(
                                  22.4,
                                  hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[organisationKey]!
                                      .size
                                      .toDouble())), //20 //Line Height Changed
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          onTap: () {
                            hackathonTextPropertiesProvider
                                .selectedTextFieldKey = organisationKey;
                            hackathonTextPropertiesProvider
                                .updateSelectedFontFromTextField();
                          },
                          onSaved: (value) {
                            hackathonDetailsProvider.organisationName =
                                value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: defaultEditScaleHeight(
                            widget.containerHeight, 30), //42
                      ),
                      SizedBox(
                        width:
                            defaultEditScaleWidth(widget.containerWidth, 700),
                        height:
                            defaultEditScaleHeight(widget.containerHeight, 54),
                        child: TextFormField(
                          key: hackathonNameKey,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          controller: landingHackathonNameController,
                          cursorHeight: defaultEditScaleHeight(
                              widget.containerHeight, 49),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Your Hackathon Name ',
                            hintStyle: GoogleFonts.getFont(
                                hackathonTextPropertiesProvider
                                    .textFieldPropertiesMap[hackathonNameKey]!
                                    .font,
                                fontSize: defaultEditScaleHeight(
                                    widget.containerHeight,
                                    hackathonTextPropertiesProvider
                                        .textFieldPropertiesMap[
                                            hackathonNameKey]!
                                        .size
                                        .toDouble()), //54
                                color: hackathonTextPropertiesProvider.stringToColor(hackathonNameKey), //black2,
                                fontWeight: hackathonTextPropertiesProvider.getSelectedTextFieldFontWeight(hackathonNameKey),
                                height: lineHeight(
                                    50.4,
                                    hackathonTextPropertiesProvider
                                        .textFieldPropertiesMap[
                                            hackathonNameKey]!
                                        .size
                                        .toDouble())), //54 //Line Height is changed because of cursor size, initial line height was 22.4
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            counterText: "",
                          ),
                          maxLength: 30,
                          keyboardType: TextInputType.text,
                          style: GoogleFonts.getFont(
                              hackathonTextPropertiesProvider
                                  .textFieldPropertiesMap[hackathonNameKey]!
                                  .font,
                              fontSize: defaultEditScaleHeight(
                                  widget.containerHeight,
                                  hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[hackathonNameKey]!
                                      .size
                                      .toDouble()), //54
                              decoration: hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[hackathonNameKey]!
                                      .underline
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              fontStyle: hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[hackathonNameKey]!
                                      .italics
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                              color: hackathonTextPropertiesProvider.stringToColor(hackathonNameKey),// black2
                              fontWeight: hackathonTextPropertiesProvider.getSelectedTextFieldFontWeight(hackathonNameKey),
                              height: lineHeight(
                                  50.4,
                                  hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[hackathonNameKey]!
                                      .size
                                      .toDouble())), //54 //Line Height Changed
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          onTap: () {
                            hackathonTextPropertiesProvider
                                .selectedTextFieldKey = hackathonNameKey;
                            hackathonTextPropertiesProvider
                                .updateSelectedFontFromTextField();
                          },
                          onSaved: (value) {
                            hackathonDetailsProvider.hackathonName =
                                value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height:
                            defaultEditScaleHeight(widget.containerHeight, 11),
                      ),
                      SizedBox(
                        width:
                            defaultEditScaleWidth(widget.containerWidth, 700),
                        height:
                            defaultEditScaleHeight(widget.containerHeight, 95),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          controller: hackathonDescriptionController,
                          cursorHeight: defaultEditScaleHeight(
                              widget.containerHeight, 20),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText:
                                'Give us brief about your hackathon (60 words)',
                            hintStyle: GoogleFonts.getFont(fontFamily2,
                                fontSize: defaultEditScaleHeight(
                                    widget.containerHeight, 18),
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
                              fontSize: defaultEditScaleHeight(
                                  widget.containerHeight, 18),
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
                            hackathonDetailsProvider.brief = value.toString();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -defaultEditScaleHeight(widget.containerHeight, 51),
                child: Container(
                  width: defaultEditScaleWidth(widget.containerWidth, 1108),
                  // padding: EdgeInsets.symmetric(horizontal: defaultEditScaleWidth(containerWidth, 68.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      hackathonDetailContainer(
                        containerHeight: widget.containerHeight,
                        containerWidth: widget.containerWidth,
                        detail: 'Date',
                        controller: hackathonDateController,
                        onSaved: (value) {
                          hackathonDetailsProvider.startDateTime =
                              value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Date',
                      ),
                      hackathonDetailContainer(
                        containerHeight: widget.containerHeight,
                        containerWidth: widget.containerWidth,
                        detail: 'Mode of Conduct',
                        controller: hackathonModeController,
                        onSaved: (value) {
                          hackathonDetailsProvider.modeOfConduct =
                              value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Mode of Conduct',
                      ),
                      hackathonDetailContainer(
                        containerHeight: widget.containerHeight,
                        containerWidth: widget.containerWidth,
                        detail: 'Participation fee',
                        controller: hackathonFeeController,
                        onSaved: (value) {
                          hackathonDetailsProvider.fee = value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Participation fee',
                      ),
                      hackathonDetailContainer(
                          containerHeight: widget.containerHeight,
                          containerWidth: widget.containerWidth,
                          detail: 'Team Size',
                          controller: hackathonTeamSizeController,
                          onSaved: (value) {
                            hackathonDetailsProvider.teamSize =
                                value.toString();
                          },
                          type: TextInputType.number,
                          hint: 'Team Size'),
                      hackathonDetailContainer(
                        containerHeight: widget.containerHeight,
                        containerWidth: widget.containerWidth,
                        detail: 'Venue',
                        controller: hackathonVenueController,
                        onSaved: (value) {
                          hackathonDetailsProvider.venue = value.toString();
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
            height: defaultEditScaleHeight(widget.containerHeight, 90),
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
