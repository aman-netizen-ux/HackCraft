import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
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
      textColor: 'Color(0xFFFFFFFF)',
      underline: false,
      upperCase: false,
      lineHeight:22,
    );

    hackathonTextPropertiesProvider.textFieldPropertiesMap[modeOfConductKey] =
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
      textColor: 'Color(0xFFFFFFFF)',
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
            height: 102,
            color: 'Color(0xFF000100)',
            borderWidth: 0,
            blurRadius: 0.0,
            borderRadius: 15.0,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[modeOfConductContainerKey] =
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
        LimitContainerHeight(minHeight: 20, maxHeight: 102);

    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[modeOfConductContainerKey] =
        LimitContainerHeight(minHeight: 20, maxHeight: 102);

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
                          defaultEditScaleHeight(widget.containerHeight, 51))
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: defaultEditScaleWidth(widget.containerWidth, 1108),
                  height: defaultEditScaleHeight(widget.containerHeight, 102),
                  // padding: EdgeInsets.symmetric(horizontal: defaultEditScaleWidth(containerWidth, 68.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      hackathonDetailContainer(
                        borderWidth: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[dateContainerKey]!
                            .borderWidth
                            .toDouble(),
                        containerKey: dateContainerKey,
                        textKey: hackathonStartDateKey,
                        containerColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                dateContainerKey,
                                0,
                                ContainerColorProperties.containerColor),
                        height: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[dateContainerKey]!.height
                            .toDouble(),
                        containerHeight: widget.containerHeight,
                        containerWidth: widget.containerWidth,
                        detail: 'Date',
                        controller: hackathonDateController,
                        borderRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[dateContainerKey]!
                            .borderRadius
                            .toDouble(),
                        blurRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[dateContainerKey]!
                            .blurRadius
                            .toDouble(),
                        borderColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                dateContainerKey,
                                0,
                                ContainerColorProperties.containerBorderColor),
                        boxShadowColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                dateContainerKey,
                                0,
                                ContainerColorProperties.boxShadowColor),
                        onSaved: (value) {
                          hackathonDetailsProvider.startDateTime =
                              value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Date',
                      ),
                      hackathonDetailContainer(
                        borderWidth: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[modeOfConductContainerKey]!
                            .borderWidth
                            .toDouble(),
                        containerKey: modeOfConductContainerKey,
                        textKey: modeOfConductKey,
                        containerColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                modeOfConductContainerKey,
                                0,
                                ContainerColorProperties.containerColor),
                        height: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[modeOfConductContainerKey]!
                            .height
                            .toDouble(),
                        containerHeight: widget.containerHeight,
                        containerWidth: widget.containerWidth,
                        detail: 'Mode of Conduct',
                        borderRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[modeOfConductContainerKey]!
                            .borderRadius
                            .toDouble(),
                        blurRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[modeOfConductContainerKey]!
                            .blurRadius
                            .toDouble(),
                        borderColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                modeOfConductContainerKey,
                                0,
                                ContainerColorProperties.containerBorderColor),
                        boxShadowColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                modeOfConductContainerKey,
                                0,
                                ContainerColorProperties.boxShadowColor),
                        controller: hackathonModeController,
                        onSaved: (value) {
                          hackathonDetailsProvider.modeOfConduct =
                              value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Mode of Conduct',
                      ),
                      hackathonDetailContainer(
                        borderWidth: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[
                                participationFeeContainerKey]!
                            .borderWidth
                            .toDouble(),
                        containerKey: participationFeeContainerKey,
                        textKey: participationFeeKey,
                        containerColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                participationFeeContainerKey,
                                0,
                                ContainerColorProperties.containerColor),
                        height: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[
                                participationFeeContainerKey]!
                            .height
                            .toDouble(),
                        borderRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[
                                participationFeeContainerKey]!
                            .borderRadius
                            .toDouble(),
                        blurRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[
                                participationFeeContainerKey]!
                            .blurRadius
                            .toDouble(),
                        containerHeight: widget.containerHeight,
                        containerWidth: widget.containerWidth,
                        detail: 'Participation fee',
                        controller: hackathonFeeController,
                        borderColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                participationFeeContainerKey,
                                0,
                                ContainerColorProperties.containerBorderColor),
                        boxShadowColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                participationFeeContainerKey,
                                0,
                                ContainerColorProperties.boxShadowColor),
                        onSaved: (value) {
                          hackathonDetailsProvider.fee = value.toString();
                        },
                        type: TextInputType.text,
                        hint: 'Participation fee',
                      ),
                      hackathonDetailContainer(
                          borderWidth: hackathonContainerPropertiesProvider
                              .containerPropertiesMap[teamSizeContainerKey]!
                              .borderWidth
                              .toDouble(),
                          containerKey: teamSizeContainerKey,
                          containerColor: hackathonContainerPropertiesProvider.stringToColor(
                              teamSizeContainerKey,
                              0,
                              ContainerColorProperties.containerColor),
                          textKey: teamSizeKey,
                          height: hackathonContainerPropertiesProvider
                              .containerPropertiesMap[teamSizeContainerKey]!
                              .height
                              .toDouble(),
                          borderRadius: hackathonContainerPropertiesProvider
                              .containerPropertiesMap[teamSizeContainerKey]!
                              .borderRadius
                              .toDouble(),
                          containerHeight: widget.containerHeight,
                          containerWidth: widget.containerWidth,
                          detail: 'Team Size',
                          controller: hackathonTeamSizeController,
                          blurRadius: hackathonContainerPropertiesProvider
                              .containerPropertiesMap[teamSizeContainerKey]!
                              .blurRadius
                              .toDouble(),
                          borderColor: hackathonContainerPropertiesProvider.stringToColor(
                              teamSizeContainerKey, 0, ContainerColorProperties.containerBorderColor),
                          boxShadowColor: hackathonContainerPropertiesProvider.stringToColor(teamSizeContainerKey, 0, ContainerColorProperties.boxShadowColor),
                          onSaved: (value) {
                            hackathonDetailsProvider.teamSize =
                                value.toString();
                          },
                          type: TextInputType.number,
                          hint: 'Team Size'),
                      hackathonDetailContainer(
                        borderWidth: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[
                                registrationCountContainerKey]!
                            .borderWidth
                            .toDouble(),
                        containerColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                registrationCountContainerKey,
                                0,
                                ContainerColorProperties.containerColor),
                        height: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[
                                registrationCountContainerKey]!
                            .height
                            .toDouble(),
                        borderRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[
                                registrationCountContainerKey]!
                            .borderRadius
                            .toDouble(),
                        borderColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                registrationCountContainerKey,
                                0,
                                ContainerColorProperties.containerBorderColor),
                        boxShadowColor:
                            hackathonContainerPropertiesProvider.stringToColor(
                                registrationCountContainerKey,
                                0,
                                ContainerColorProperties.boxShadowColor),
                        containerKey: registrationCountContainerKey,
                        textKey: venueKey,
                        containerHeight: widget.containerHeight,
                        containerWidth: widget.containerWidth,
                        detail: 'Venue',
                        controller: hackathonVenueController,
                        blurRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[
                                registrationCountContainerKey]!
                            .blurRadius
                            .toDouble(),
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
  final GlobalKey textKey;
  final GlobalKey containerKey;
  final double height;
  final double borderWidth;
  final Color containerColor;
  final double containerHeight;
  final double containerWidth;
  final double blurRadius;
  final TextEditingController controller;
  final void Function(dynamic)? onSaved;
  final TextInputType type;
  final String hint;
  final double borderRadius;
  final Color boxShadowColor;
  final Color borderColor;

  const hackathonDetailContainer({
    super.key,
    required this.detail,
    required this.containerHeight,
    required this.containerWidth,
    required this.controller,
    this.onSaved,
    required this.type,
    required this.hint,
    required this.textKey,
    required this.containerKey,
    required this.height,
    required this.containerColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.blurRadius,
    required this.boxShadowColor,
    required this.borderColor,
    // required this.key,
  });

  final String detail;

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
        width: defaultEditScaleWidth(containerWidth, 159),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: defaultEditScaleWidth(containerWidth, 5),
            vertical: defaultEditScaleHeight(containerHeight, 5)),
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
        child: DefaultTemplateTextFormField(
          hintText: hint,
          fieldKey: textKey,
          controller: controller,
          containerHeight: containerHeight,
          containerWidth: containerWidth,
          maxLength: 15,
           //Line Height is changed because of cursor size, initial line height was 22.4
          cursorHeight: defaultEditScaleHeight(containerHeight, 17),
          isDense: true,
          defaultEditBoxColorSet: true,
          onSaved: onSaved,
          cursorColor: Color(0xFFFFFFFF),
          keyboardType: type,
        ),
      ),
    );
  }
}
