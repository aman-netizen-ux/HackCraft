import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_textFormField.dart';
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
  late TextEditingController hackathonDeadlineController;

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
    hackathonDeadlineController = TextEditingController();

// HackathonTextPropertiesProvider is for text Field Properties and its methods
    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context, listen: false);

    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context,
            listen: false);

/*  We are passing Global keys like organisationKey, hackathonNameKey defined in utils to set the properties 
    of every text form fields defined with these unique keys and
    we can gwt the properties as well with the same keys*/

    // the values being passed here are the initial values
    hackathonTextPropertiesProvider.textFieldPropertiesMap[organisationKey] =
        TextFieldProperties(
      size: 20,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 500,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF564A4A)',
      underline: false,
      upperCase: false,
      lineHeight:22,
    );
    hackathonTextPropertiesProvider.textFieldPropertiesMap[hackathonNameKey] =
        TextFieldProperties(
      size: 54,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 600,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF000100)',
      underline: false,
      upperCase: false,
      lineHeight:50,
    );

    hackathonTextPropertiesProvider.textFieldPropertiesMap[briefKey] =
        TextFieldProperties(
      size: 18,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF000100)',
      underline: false,
      upperCase: false,
      lineHeight:22,
    );

    hackathonTextPropertiesProvider
        .textFieldPropertiesMap[hackathonStartDateKey] = TextFieldProperties(
      size: 20,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 600,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1a202c)',
      underline: false,
      upperCase: false,
      lineHeight: 22
    );

    hackathonTextPropertiesProvider
        .textFieldPropertiesMap[hackathonEndingDateKey] = TextFieldProperties(
      size: 20,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 600,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1a202c)',
      underline: false,
      upperCase: false,
      lineHeight:22,
    );

    hackathonTextPropertiesProvider.textFieldPropertiesMap[modeOfConductKey] =
        TextFieldProperties(
      size: 20,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 600,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFFFFFFFF)',
      underline: false,
      upperCase: false,
      lineHeight:22,
    );

    hackathonTextPropertiesProvider
        .textFieldPropertiesMap[participationFeeKey] = TextFieldProperties(
      size: 20,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 600,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFFFFFFFF)',
      underline: false,
      upperCase: false,
      lineHeight:22,
    );

    hackathonTextPropertiesProvider.textFieldPropertiesMap[teamSizeKey] =
        TextFieldProperties(
      size: 20,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 600,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1a202c)',
      underline: false,
      upperCase: false,
      lineHeight:22,
    );

    hackathonTextPropertiesProvider.textFieldPropertiesMap[venueKey] =
        TextFieldProperties(
      size: 20,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 600,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFFFFFFFF)',
      underline: false,
      upperCase: false,
      lineHeight:22,
    );

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[landingContainerKey] =
        ContainerProperties(
            borderColor: 'Color(0xFFFFFFFF)',
            height: 523,
            color: 'Color(0xFFE2CCFF)',
            borderWidth: 0,
            blurRadius: 0.0,
            borderRadius: 30.0,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[dateContainerKey] =
        ContainerProperties(
            borderColor: 'Color(0xFFFFFFFF)',
            height: 170,
            color: 'Color(0xFF1a202c)',
            borderWidth: 0,
            blurRadius: 0.0,
            borderRadius: 10.0,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[modeOfConductContainerKey] =
        ContainerProperties(
            borderColor: 'Color(0xFF1a202c)',
            height: 117,
            color: 'Color(0xFFFFFFFF)',
            borderWidth: 0,
            blurRadius: 0.0,
            borderRadius: 10.0,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[participationFeeContainerKey] =
        ContainerProperties(
            borderColor: 'Color(0xFFFFFFFF)',
            height: 102,
            color: 'Color(0xFF000100)',
            borderWidth: 0,
            blurRadius: 0.0,
            borderRadius: 15.0,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[teamSizeContainerKey] =
        ContainerProperties(
            borderColor: 'Color(0xFFFFFFFF)',
            height: 102,
            color: 'Color(0xFF000100)',
            borderWidth: 0,
            blurRadius: 0.0,
            borderRadius: 15.0,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[registrationCountContainerKey] =
        ContainerProperties(
            borderColor: 'Color(0xFFFFFFFF)',
            height: 102,
            color: 'Color(0xFF000100)',
            borderWidth: 0,
            blurRadius: 0.0,
            borderRadius: 15.0,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

//These limits are optional we have to change them in future
    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[landingContainerKey] =
        LimitContainerHeight(minHeight: 200, maxHeight: 523);

    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[dateContainerKey] =
        LimitContainerHeight(minHeight: 20, maxHeight: 170);

    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[modeOfConductContainerKey] =
        LimitContainerHeight(minHeight: 20, maxHeight: 117);

    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[participationFeeContainerKey] =
        LimitContainerHeight(minHeight: 20, maxHeight: 102);

    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[teamSizeContainerKey] =
        LimitContainerHeight(minHeight: 20, maxHeight: 102);

    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[registrationCountContainerKey] =
        LimitContainerHeight(minHeight: 20, maxHeight: 102);

    if (hackathonDetailsProvider.organisationName.isNotEmpty) {
      hackathonOrganisationController.text =
          hackathonDetailsProvider.organisationName;
    }

    if (hackathonDetailsProvider.hackathonName.isNotEmpty) {
      landingHackathonNameController.text =
          hackathonDetailsProvider.hackathonName;
    }

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

    if (hackathonDetailsProvider.deadline.isNotEmpty) {
      hackathonDeadlineController.text = hackathonDetailsProvider.deadline;
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
    hackathonDeadlineController.dispose();
    hackathonTeamSizeController.dispose();
    hackathonVenueController.dispose();

    // ... dispose other controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    // final hackathonTeamSizeController = TextEditingController();

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    // if (hackathonDetailsProvider.brief.isNotEmpty) {
    //   hackathonDescriptionController.text = hackathonDetailsProvider.brief;
    // }

    // if (hackathonDetailsProvider.startDateTime.isNotEmpty) {
    //   hackathonDateController.text = hackathonDetailsProvider.startDateTime;
    // }

    // if (hackathonDetailsProvider.modeOfConduct.isNotEmpty) {
    //   hackathonModeController.text = hackathonDetailsProvider.modeOfConduct;
    // }

    // if (hackathonDetailsProvider.teamSize.isNotEmpty) {
    //   hackathonTeamSizeController.text = hackathonDetailsProvider.teamSize;
    // }

    // if (hackathonDetailsProvider.fee.isNotEmpty) {
    //   hackathonFeeController.text = hackathonDetailsProvider.fee;
    // }

// ********************* Below are the conditions to make any text in the uppercase ***************
    WidgetsBinding.instance.addPostFrameCallback((_) {
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonOrganisationController, organisationKey);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          landingHackathonNameController, hackathonNameKey);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonDescriptionController, briefKey);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonDateController, hackathonStartDateKey);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonModeController, modeOfConductKey);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonFeeController, participationFeeKey);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonDeadlineController, hackathonEndingDateKey);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonTeamSizeController, teamSizeKey);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonVenueController, venueKey);
    });

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
              //Lavender container widget is wrapped in column, so that sizedbox can be added below this widget
              //so that, it'll give the space to the half of the black box containers row without giving the negative position from the bottom
              //With this, the complete black box will be clickable not the half
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      hackathonContainerPropertiesProvider
                          .selectedContainerKey = landingContainerKey;
                      if (hackathonTextPropertiesProvider
                              .selectedTextFieldKey !=
                          null) {
                        hackathonTextPropertiesProvider.selectedTextFieldKey =
                            null;
                      }
                      if (hackathonTextPropertiesProvider.isTextColorSelected) {
                        hackathonTextPropertiesProvider
                            .setIsTextColorSelected();
                      }
                    },
                    child: Container(
                      key: landingContainerKey,
                      height: defaultEditScaleHeight(
                          widget.containerHeight,
                          hackathonContainerPropertiesProvider
                              .containerPropertiesMap[landingContainerKey]!
                              .height
                              .toDouble()),
                      width: defaultEditScaleWidth(widget.containerWidth, 1108),
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultEditScaleWidth(
                              widget.containerWidth, 100)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color:
                              hackathonContainerPropertiesProvider.stringToColor(
                                  landingContainerKey,
                                  0,
                                  ContainerColorProperties.containerColor),
                          border: Border.all(
                              width: (hackathonContainerPropertiesProvider
                                          .containerPropertiesMap[
                                              landingContainerKey]!
                                          .borderWidth
                                          .toDouble() /
                                      100) *
                                  85,
                              color: hackathonContainerPropertiesProvider
                                  .stringToColor(landingContainerKey, 0,
                                      ContainerColorProperties.containerBorderColor),
                              strokeAlign: BorderSide.strokeAlignCenter),
                          borderRadius: BorderRadius.all(Radius.circular(hackathonContainerPropertiesProvider.containerPropertiesMap[landingContainerKey]!.borderRadius.toDouble())),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: hackathonContainerPropertiesProvider
                                    .containerPropertiesMap[
                                        landingContainerKey]!
                                    .blurRadius
                                    .toDouble(),
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                                color: hackathonContainerPropertiesProvider
                                    .stringToColor(
                                        landingContainerKey,
                                        0,
                                        ContainerColorProperties
                                            .boxShadowColor))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultTemplateTextFormField(
                            hintText: 'Your Organisation Name',
                            fieldKey: organisationKey,
                            controller: hackathonOrganisationController,
                            containerHeight: widget.containerHeight,
                            containerWidth: widget.containerWidth,
                            maxLength: 30,
                            editContainerMaxWidth: 400,
                            isDense: true,
                            defaultEditBoxColorSet: true,
                            cursorHeight: defaultEditScaleHeight(
                                widget.containerHeight, 20),
                            onSaved: (value) {
                              hackathonDetailsProvider.organisationName =
                                  value.toString();
                            },
                          ),
                          SizedBox(
                            height: defaultEditScaleHeight(
                                widget.containerHeight, 15), //42
                          ),
                          DefaultTemplateTextFormField(
                            hintText: 'Your Hackathon Name ',
                            fieldKey: hackathonNameKey,
                            controller: landingHackathonNameController,
                            containerHeight: widget.containerHeight,
                            containerWidth: widget.containerWidth,
                            maxLength: 30,
                            editContainerMaxWidth: 700,
                            defaultEditBoxColorSet: true,
                           //54 //Line Height is changed because of cursor size, initial line height was 22.4
                            cursorHeight: defaultEditScaleHeight(
                                widget.containerHeight, 49),
                            onSaved: (value) {
                              hackathonDetailsProvider.hackathonName =
                                  value.toString();
                            },
                          ),
                          SizedBox(
                            height: defaultEditScaleHeight(
                                widget.containerHeight, 11),
                          ),
                          DefaultTemplateTextFormField(
                            hintText:
                                'Give us brief about your hackathon (60 words)',
                            fieldKey: briefKey,
                            controller: hackathonDescriptionController,
                            containerHeight: widget.containerHeight,
                            containerWidth: widget.containerWidth,
                            editContainerMaxWidth: 700,
                            maxLength: 300,
                            maxLines: 4,
                            isDense: true,
                            defaultEditBoxColorSet: true,
                            //Line Height is changed because of cursor size, initial line height was 22.4
                            cursorHeight: defaultEditScaleHeight(
                                widget.containerHeight, 20),
                            onSaved: (value) {
                              hackathonDetailsProvider.brief = value.toString();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          defaultEditScaleHeight(widget.containerHeight, 85))
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: defaultEditScaleWidth(widget.containerWidth, 1108),
                  height: defaultEditScaleHeight(widget.containerHeight, 170),
                  // padding: EdgeInsets.symmetric(horizontal: defaultEditScaleWidth(containerWidth, 68.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      hackathonDetailContainer(
                          containerHeight: widget.containerHeight,
                          containerWidth: widget.containerWidth,
                          type: TextInputType.text,
                          hint1: "Type here ...",
                          containerKey: dateContainerKey,
                          height: hackathonContainerPropertiesProvider
                              .containerPropertiesMap[dateContainerKey]!.height
                              .toDouble(),
                          containerColor:
                              hackathonContainerPropertiesProvider.stringToColor(
                                  dateContainerKey,
                                  0,
                                  ContainerColorProperties.containerColor),
                          borderWidth: hackathonContainerPropertiesProvider
                              .containerPropertiesMap[dateContainerKey]!
                              .borderWidth
                              .toDouble(),
                          borderRadius: hackathonContainerPropertiesProvider
                              .containerPropertiesMap[dateContainerKey]!
                              .borderRadius
                              .toDouble(),
                          blurRadius: hackathonContainerPropertiesProvider
                              .containerPropertiesMap[dateContainerKey]!
                              .blurRadius
                              .toDouble(),
                          borderColor: hackathonContainerPropertiesProvider.stringToColor(
                              dateContainerKey, 0, ContainerColorProperties.containerBorderColor),
                          boxShadowColor: hackathonContainerPropertiesProvider.stringToColor(dateContainerKey, 0, ContainerColorProperties.boxShadowColor),
                          controller1: hackathonModeController,
                          controller2: hackathonFeeController,
                          controller3: hackathonVenueController,
                          textKey1: modeOfConductKey,
                          textKey2: participationFeeKey,
                          textKey3: venueKey,
                          hint2: "Type here ...",
                          hint3: "Type here ...",
                          onSaved1: (value) {
                            hackathonDetailsProvider.modeOfConduct =
                                value.toString();
                          },
                          onSaved2: (value) {
                            hackathonDetailsProvider.fee = value.toString();
                          },
                          onSaved3: (value) {
                            hackathonDetailsProvider.venue = value.toString();
                          },
                          isSecondContainer: false)
                      // hackathonDetailContainer(
                      //   borderWidth: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[dateContainerKey]!
                      //       .borderWidth
                      //       .toDouble(),
                      //   containerKey: dateContainerKey,
                      //   textKey: hackathonStartDateKey,
                      //   containerColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           dateContainerKey,
                      //           0,
                      //           ContainerColorProperties.containerColor),
                      //   height: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[dateContainerKey]!.height
                      //       .toDouble(),
                      //   containerHeight: widget.containerHeight,
                      //   containerWidth: widget.containerWidth,
                      //   detail: 'Date',
                      //   controller: hackathonDateController,
                      //   borderRadius: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[dateContainerKey]!
                      //       .borderRadius
                      //       .toDouble(),
                      //   blurRadius: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[dateContainerKey]!
                      //       .blurRadius
                      //       .toDouble(),
                      //   borderColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           dateContainerKey,
                      //           0,
                      //           ContainerColorProperties.containerBorderColor),
                      //   boxShadowColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           dateContainerKey,
                      //           0,
                      //           ContainerColorProperties.boxShadowColor),
                      //   onSaved: (value) {
                      //     hackathonDetailsProvider.startDateTime =
                      //         value.toString();
                      //   },
                      //   type: TextInputType.text,
                      //   hint: 'Date',
                      // ),
                      // hackathonDetailContainer(
                      //   borderWidth: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[modeOfConductContainerKey]!
                      //       .borderWidth
                      //       .toDouble(),
                      //   containerKey: modeOfConductContainerKey,
                      //   textKey: modeOfConductKey,
                      //   containerColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           modeOfConductContainerKey,
                      //           0,
                      //           ContainerColorProperties.containerColor),
                      //   height: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[modeOfConductContainerKey]!
                      //       .height
                      //       .toDouble(),
                      //   containerHeight: widget.containerHeight,
                      //   containerWidth: widget.containerWidth,
                      //   detail: 'Mode of Conduct',
                      //   borderRadius: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[modeOfConductContainerKey]!
                      //       .borderRadius
                      //       .toDouble(),
                      //   blurRadius: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[modeOfConductContainerKey]!
                      //       .blurRadius
                      //       .toDouble(),
                      //   borderColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           modeOfConductContainerKey,
                      //           0,
                      //           ContainerColorProperties.containerBorderColor),
                      //   boxShadowColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           modeOfConductContainerKey,
                      //           0,
                      //           ContainerColorProperties.boxShadowColor),
                      //   controller: hackathonModeController,
                      //   onSaved: (value) {
                      //     hackathonDetailsProvider.modeOfConduct =
                      //         value.toString();
                      //   },
                      //   type: TextInputType.text,
                      //   hint: 'Mode of Conduct',
                      // ),
                      // hackathonDetailContainer(
                      //   borderWidth: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[
                      //           participationFeeContainerKey]!
                      //       .borderWidth
                      //       .toDouble(),
                      //   containerKey: participationFeeContainerKey,
                      //   textKey: participationFeeKey,
                      //   containerColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           participationFeeContainerKey,
                      //           0,
                      //           ContainerColorProperties.containerColor),
                      //   height: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[
                      //           participationFeeContainerKey]!
                      //       .height
                      //       .toDouble(),
                      //   borderRadius: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[
                      //           participationFeeContainerKey]!
                      //       .borderRadius
                      //       .toDouble(),
                      //   blurRadius: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[
                      //           participationFeeContainerKey]!
                      //       .blurRadius
                      //       .toDouble(),
                      //   containerHeight: widget.containerHeight,
                      //   containerWidth: widget.containerWidth,
                      //   detail: 'Participation fee',
                      //   controller: hackathonFeeController,
                      //   borderColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           participationFeeContainerKey,
                      //           0,
                      //           ContainerColorProperties.containerBorderColor),
                      //   boxShadowColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           participationFeeContainerKey,
                      //           0,
                      //           ContainerColorProperties.boxShadowColor),
                      //   onSaved: (value) {
                      //     hackathonDetailsProvider.fee = value.toString();
                      //   },
                      //   type: TextInputType.text,
                      //   hint: 'Participation fee',
                      // ),
                      // hackathonDetailContainer(
                      //     borderWidth: hackathonContainerPropertiesProvider
                      //         .containerPropertiesMap[teamSizeContainerKey]!
                      //         .borderWidth
                      //         .toDouble(),
                      //     containerKey: teamSizeContainerKey,
                      //     containerColor: hackathonContainerPropertiesProvider.stringToColor(
                      //         teamSizeContainerKey,
                      //         0,
                      //         ContainerColorProperties.containerColor),
                      //     textKey: teamSizeKey,
                      //     height: hackathonContainerPropertiesProvider
                      //         .containerPropertiesMap[teamSizeContainerKey]!
                      //         .height
                      //         .toDouble(),
                      //     borderRadius: hackathonContainerPropertiesProvider
                      //         .containerPropertiesMap[teamSizeContainerKey]!
                      //         .borderRadius
                      //         .toDouble(),
                      //     containerHeight: widget.containerHeight,
                      //     containerWidth: widget.containerWidth,
                      //     detail: 'Team Size',
                      //     controller: hackathonTeamSizeController,
                      //     blurRadius: hackathonContainerPropertiesProvider
                      //         .containerPropertiesMap[teamSizeContainerKey]!
                      //         .blurRadius
                      //         .toDouble(),
                      //     borderColor: hackathonContainerPropertiesProvider.stringToColor(
                      //         teamSizeContainerKey, 0, ContainerColorProperties.containerBorderColor),
                      //     boxShadowColor: hackathonContainerPropertiesProvider.stringToColor(teamSizeContainerKey, 0, ContainerColorProperties.boxShadowColor),
                      //     onSaved: (value) {
                      //       hackathonDetailsProvider.teamSize =
                      //           value.toString();
                      //     },
                      //     type: TextInputType.number,
                      //     hint: 'Team Size'),
                      // hackathonDetailContainer(
                      //   borderWidth: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[
                      //           registrationCountContainerKey]!
                      //       .borderWidth
                      //       .toDouble(),
                      //   containerColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           registrationCountContainerKey,
                      //           0,
                      //           ContainerColorProperties.containerColor),
                      //   height: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[
                      //           registrationCountContainerKey]!
                      //       .height
                      //       .toDouble(),
                      //   borderRadius: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[
                      //           registrationCountContainerKey]!
                      //       .borderRadius
                      //       .toDouble(),
                      //   borderColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           registrationCountContainerKey,
                      //           0,
                      //           ContainerColorProperties.containerBorderColor),
                      //   boxShadowColor:
                      //       hackathonContainerPropertiesProvider.stringToColor(
                      //           registrationCountContainerKey,
                      //           0,
                      //           ContainerColorProperties.boxShadowColor),
                      //   containerKey: registrationCountContainerKey,
                      //   textKey: venueKey,
                      //   containerHeight: widget.containerHeight,
                      //   containerWidth: widget.containerWidth,
                      //   detail: 'Venue',
                      //   controller: hackathonVenueController,
                      //   blurRadius: hackathonContainerPropertiesProvider
                      //       .containerPropertiesMap[
                      //           registrationCountContainerKey]!
                      //       .blurRadius
                      //       .toDouble(),
                      //   onSaved: (value) {
                      //     hackathonDetailsProvider.venue = value.toString();
                      //   },
                      //   type: TextInputType.text,
                      //   hint: 'Venue',
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //spacing
          SizedBox(
            height: defaultEditScaleHeight(widget.containerHeight, 90),
          ),

          Container(
              width: defaultEditScaleWidth(widget.containerWidth, 1108),
              height: defaultEditScaleHeight(widget.containerHeight, 117),
              padding:
                  EdgeInsets.symmetric(horizontal: scaleWidth(context, 47)),
              child: hackathonDetailContainer(
                containerHeight: widget.containerHeight,
                containerWidth: widget.containerWidth,
                type: TextInputType.text,
                hint1: "Type here ...",
                containerKey: modeOfConductContainerKey,
                height: hackathonContainerPropertiesProvider
                    .containerPropertiesMap[modeOfConductContainerKey]!.height
                    .toDouble(),
                containerColor:
                    hackathonContainerPropertiesProvider.stringToColor(
                        modeOfConductContainerKey,
                        0,
                        ContainerColorProperties.containerColor),
                borderWidth: hackathonContainerPropertiesProvider
                    .containerPropertiesMap[modeOfConductContainerKey]!
                    .borderWidth
                    .toDouble(),
                borderRadius: hackathonContainerPropertiesProvider
                    .containerPropertiesMap[modeOfConductContainerKey]!
                    .borderRadius
                    .toDouble(),
                blurRadius: hackathonContainerPropertiesProvider
                    .containerPropertiesMap[modeOfConductContainerKey]!
                    .blurRadius
                    .toDouble(),
                borderColor: hackathonContainerPropertiesProvider.stringToColor(
                    modeOfConductContainerKey,
                    0,
                    ContainerColorProperties.containerBorderColor),
                boxShadowColor:
                    hackathonContainerPropertiesProvider.stringToColor(
                        modeOfConductContainerKey,
                        0,
                        ContainerColorProperties.boxShadowColor),
                controller1: hackathonDateController,
                controller2: hackathonTeamSizeController,
                controller3: hackathonDeadlineController,
                textKey1: hackathonStartDateKey,
                textKey2: teamSizeKey,
                textKey3: hackathonEndingDateKey,
                hint2: "Type here ...",
                hint3: "Type here ...",
                isSecondContainer: true,
                onSaved1: (value) {
                  hackathonDetailsProvider.startDateTime = value.toString();
                },
                onSaved2: (value) {
                  hackathonDetailsProvider.teamSize = value.toString();
                },
                onSaved3: (value) {
                  hackathonDetailsProvider.deadline = value.toString();
                },
              ))
        ],
      ),
    );
  }
}

class hackathonDetailContainer extends StatelessWidget {
  final GlobalKey textKey1;
  final GlobalKey textKey2;
  final GlobalKey textKey3;
  final GlobalKey containerKey;
  final double height;
  final double borderWidth;
  final Color containerColor;
  final double containerHeight;
  final double containerWidth;
  final double blurRadius;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final void Function(dynamic)? onSaved1;
  final void Function(dynamic)? onSaved2;
  final void Function(dynamic)? onSaved3;
  final TextInputType type;
  final String hint1;
  final String hint2;
  final String hint3;
  final double borderRadius;
  final Color boxShadowColor;
  final Color borderColor;
  final bool isSecondContainer;

  const hackathonDetailContainer({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    this.onSaved1,
    required this.type,
    required this.hint1,
    required this.containerKey,
    required this.height,
    required this.containerColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.blurRadius,
    required this.boxShadowColor,
    required this.borderColor,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.textKey1,
    required this.textKey2,
    required this.textKey3,
    required this.hint2,
    required this.hint3,
    required this.isSecondContainer,
    this.onSaved2,
    this.onSaved3,
  });

  @override
  Widget build(BuildContext context) {
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    return InkWell(
      onTap: () {
        hackathonContainerPropertiesProvider.selectedContainerKey =
            containerKey;
        if (hackathonTextPropertiesProvider.selectedTextFieldKey != null) {
          hackathonTextPropertiesProvider.selectedTextFieldKey = null;
        }

        if (hackathonTextPropertiesProvider.isTextColorSelected) {
          hackathonTextPropertiesProvider.setIsTextColorSelected();
        }
      },
      child: Container(
        height: defaultEditScaleHeight(containerHeight, height),
        width: defaultEditScaleWidth(containerWidth, 991),
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: defaultEditScaleWidth(containerWidth, 43),
            vertical: defaultEditScaleHeight(
                containerHeight, isSecondContainer ? 27 : 50)),
        decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
                width: borderWidth / 100 * 15,
                color: borderColor,
                strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            boxShadow: [
              BoxShadow(
                  blurRadius: blurRadius,
                  offset: const Offset(0, 0),
                  spreadRadius: 0,
                  color: boxShadowColor)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultTemplateTextFormField(
                  hintText: hint1,
                  fieldKey: textKey1,
                  controller: controller1,
                  containerHeight: containerHeight,
                  containerWidth: containerWidth,
                  maxLength: 15,
                  // height:
                  //     22.4, //Line Height is changed because of cursor size, initial line height was 22.4
                  cursorHeight: defaultEditScaleHeight(containerHeight, 17),
                  isDense: true,
                  defaultEditBoxColorSet: true,
                  onSaved: onSaved1,
                  cursorColor: const Color(0xFFFFFFFF),
                  keyboardType: type,
                ),
                SizedBox(
                    height: scaleHeight(context, isSecondContainer ? 6 : 8)),
                Text(
                  isSecondContainer ? 'Reg Start Date' : 'Mode Of Conduct',
                  textAlign: hackathonTextPropertiesProvider.getTextAlign(
                      hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey1]!.align),
                  style: GoogleFonts.getFont(
                      hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey1]!.font,
                      fontStyle: hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[textKey1]!.italics
                          ? FontStyle.italic
                          : FontStyle.normal,
                      letterSpacing: hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey1]!.letterSpacing
                          .toDouble(),
                      decoration: TextDecoration.combine([
                        hackathonTextPropertiesProvider
                                .textFieldPropertiesMap[textKey1]!.strikethrogh
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        hackathonTextPropertiesProvider
                                .textFieldPropertiesMap[textKey1]!.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ]),
                      fontSize: defaultEditScaleHeight(
                              containerHeight,
                              hackathonTextPropertiesProvider
                                  .textFieldPropertiesMap[textKey1]!.size
                                  .toDouble()) -
                          2,
                      color: hackathonTextPropertiesProvider
                          .stringToColor(textKey1),
                      fontWeight: FontWeight.w300,
                      height: lineHeight(
                          hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[textKey1]!.lineHeight.toDouble(), hackathonTextPropertiesProvider.textFieldPropertiesMap[textKey1]!.size.toDouble())),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultTemplateTextFormField(
                  hintText: hint2,
                  fieldKey: textKey2,
                  controller: controller2,
                  containerHeight: containerHeight,
                  containerWidth: containerWidth,
                  maxLength: 15,
                  // height:
                  //     22.4, //Line Height is changed because of cursor size, initial line height was 22.4
                  cursorHeight: defaultEditScaleHeight(containerHeight, 17),
                  isDense: true,
                  defaultEditBoxColorSet: true,
                  onSaved: onSaved2,
                  cursorColor: const Color(0xFFFFFFFF),
                  keyboardType: type,
                ),
                SizedBox(
                    height: scaleHeight(context, isSecondContainer ? 6 : 8)),
                Text(
                  isSecondContainer ? 'Team Size' : 'Participation Fee',
                  textAlign: hackathonTextPropertiesProvider.getTextAlign(
                      hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey2]!.align),
                  style: GoogleFonts.getFont(
                      hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey2]!.font,
                      fontStyle: hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[textKey2]!.italics
                          ? FontStyle.italic
                          : FontStyle.normal,
                      letterSpacing: hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey2]!.letterSpacing
                          .toDouble(),
                      decoration: TextDecoration.combine([
                        hackathonTextPropertiesProvider
                                .textFieldPropertiesMap[textKey2]!.strikethrogh
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        hackathonTextPropertiesProvider
                                .textFieldPropertiesMap[textKey2]!.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ]),
                      fontSize: defaultEditScaleHeight(
                              containerHeight,
                              hackathonTextPropertiesProvider
                                  .textFieldPropertiesMap[textKey2]!.size
                                  .toDouble()) -
                          2,
                      color: hackathonTextPropertiesProvider
                          .stringToColor(textKey2),
                      fontWeight: FontWeight.w300,
                      height: lineHeight(
                          hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[textKey2]!.lineHeight.toDouble(), hackathonTextPropertiesProvider.textFieldPropertiesMap[textKey2]!.size.toDouble())),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultTemplateTextFormField(
                  hintText: hint3,
                  fieldKey: textKey3,
                  controller: controller3,
                  containerHeight: containerHeight,
                  containerWidth: containerWidth,
                  maxLength: 15,
                  // height:
                  //     22.4, //Line Height is changed because of cursor size, initial line height was 22.4
                  cursorHeight: defaultEditScaleHeight(containerHeight, 17),
                  isDense: true,
                  defaultEditBoxColorSet: true,
                  onSaved: onSaved3,
                  cursorColor: const Color(0xFFFFFFFF),
                  keyboardType: type,
                ),
                SizedBox(
                    height: scaleHeight(context, isSecondContainer ? 6 : 8)),
                Text(
                  isSecondContainer ? 'Reg Ending Date' : 'Venue',
                  textAlign: hackathonTextPropertiesProvider.getTextAlign(
                      hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey3]!.align),
                  style: GoogleFonts.getFont(
                      hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey3]!.font,
                      fontStyle: hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[textKey3]!.italics
                          ? FontStyle.italic
                          : FontStyle.normal,
                      letterSpacing: hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[textKey3]!.letterSpacing
                          .toDouble(),
                      decoration: TextDecoration.combine([
                        hackathonTextPropertiesProvider
                                .textFieldPropertiesMap[textKey3]!.strikethrogh
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        hackathonTextPropertiesProvider
                                .textFieldPropertiesMap[textKey3]!.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ]),
                      fontSize: defaultEditScaleHeight(
                              containerHeight,
                              hackathonTextPropertiesProvider
                                  .textFieldPropertiesMap[textKey3]!.size
                                  .toDouble()) -
                          2,
                      color: hackathonTextPropertiesProvider
                          .stringToColor(textKey3),
                      fontWeight: FontWeight.w300,
                      height: lineHeight(
                          hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[textKey3]!.lineHeight.toDouble(), hackathonTextPropertiesProvider.textFieldPropertiesMap[textKey3]!.size.toDouble())),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


// class hackathonDetailContainer extends StatelessWidget {
//   final GlobalKey textKey;
//   final GlobalKey containerKey;
//   final double height;
//   final double borderWidth;
//   final Color containerColor;
//   final double containerHeight;
//   final double containerWidth;
//   final double blurRadius;
//   final TextEditingController controller;
//   final void Function(dynamic)? onSaved;
//   final TextInputType type;
//   final String hint;
//   final double borderRadius;
//   final Color boxShadowColor;
//   final Color borderColor;

//   const hackathonDetailContainer({
//     super.key,
//     required this.detail,
//     required this.containerHeight,
//     required this.containerWidth,
//     required this.controller,
//     this.onSaved,
//     required this.type,
//     required this.hint,
//     required this.textKey,
//     required this.containerKey,
//     required this.height,
//     required this.containerColor,
//     required this.borderWidth,
//     required this.borderRadius,
//     required this.blurRadius,
//     required this.boxShadowColor,
//     required this.borderColor,
//     // required this.key,
//   });

//   final String detail;

//   @override
//   Widget build(BuildContext context) {
//     final hackathonContainerPropertiesProvider =
//         Provider.of<HackathonContainerPropertiesProvider>(context);
//     final hackathonTextPropertiesProvider =
//         Provider.of<HackathonTextPropertiesProvider>(context);
//     return InkWell(
//       onTap: () {
//         hackathonContainerPropertiesProvider.selectedContainerKey =
//             containerKey;
//         if (hackathonTextPropertiesProvider.selectedTextFieldKey != null) {
//           hackathonTextPropertiesProvider.selectedTextFieldKey = null;
//         }

//         if (hackathonTextPropertiesProvider.isTextColorSelected) {
//           hackathonTextPropertiesProvider.setIsTextColorSelected();
//         }
//       },
//       child: Container(
//         height: defaultEditScaleHeight(containerHeight, height),
//         width: defaultEditScaleWidth(containerWidth, 159),
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(
//             horizontal: defaultEditScaleWidth(containerWidth, 5),
//             vertical: defaultEditScaleHeight(containerHeight, 5)),
//         decoration: BoxDecoration(
//             color: containerColor,
//             border: Border.all(
//                 width: borderWidth / 100 * 15,
//                 color: borderColor,
//                 strokeAlign: BorderSide.strokeAlignOutside),
//             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//             boxShadow: [
//               BoxShadow(
//                   blurRadius: blurRadius,
//                   offset: const Offset(0, 0),
//                   spreadRadius: 0,
//                   color: boxShadowColor)
//             ]),
//         child: DefaultTemplateTextFormField(
//           hintText: hint,
//           fieldKey: textKey,
//           controller: controller,
//           containerHeight: containerHeight,
//           containerWidth: containerWidth,
//           maxLength: 15,
//           height:
//               22.4, //Line Height is changed because of cursor size, initial line height was 22.4
//           cursorHeight: defaultEditScaleHeight(containerHeight, 17),
//           isDense: true,
//           defaultEditBoxColorSet: true,
//           onSaved: onSaved,
//           cursorColor: Color(0xFFFFFFFF),
//           keyboardType: type,
//         ),
//       ),
//     );
//   }
// }
