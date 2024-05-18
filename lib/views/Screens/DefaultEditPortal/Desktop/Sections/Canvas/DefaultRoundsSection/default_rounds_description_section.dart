import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_textFormField.dart';
import 'package:provider/provider.dart';

class DefaultRoundsDescription extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  final String description;
  const DefaultRoundsDescription({
    super.key,
    required this.description,
    required this.containerHeight,
    required this.containerWidth,
  });

  @override
  State<DefaultRoundsDescription> createState() =>
      _DefaultRoundsDescriptionState();
}

class _DefaultRoundsDescriptionState extends State<DefaultRoundsDescription> {
  late TextEditingController roundDescriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    roundDescriptionController = TextEditingController();
    // final hackathonContainerPropertiesProvider =
    //     Provider.of<HackathonContainerPropertiesProvider>(context);

    //final rulesProvider = Provider.of<RulesProvider>(context);

    // hackathonContainerPropertiesProvider.containerPropertiesMap[
    //         roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescriptionContainer']!] =
    //     ContainerProperties(
    //         borderColor: 'Color(0x00000000)',
    //         height: 85,
    //         color: 'Color(0xFFFFFFFF)',
    //         borderWidth: 0);

    // final hackathonTextPropertiesProvider =
    //     Provider.of<HackathonTextPropertiesProvider>(context, listen: false);

    // final hackathonDetailsProvider =
    //     Provider.of<HackathonDetailsProvider>(context, listen: false);

    // final rulesProvider = Provider.of<RulesProvider>(context, listen: false);

    // commented becaiuse initiallization of description is shifted in round card
    // hackathonTextPropertiesProvider.textFieldPropertiesMap[
    //     roundGlobalKeysMap[ rulesProvider.editSelectedIndex]!['roundDescription']!] = TextFieldProperties(
    //   size: 16, //size is +1 in comparison to normal text whose fontsize was 15
    //   //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
    //   align: 'center',
    //   font: 'Fira Sans',
    //   fontWeight: 400,
    //   italics: false,
    //   letterSpacing: 0,
    //   strikethrogh: false,
    //   textColor: 'Color(0xFF564A4A);',
    //   underline: false,
    //   upperCase: false,
    // );

    // if (hackathonDetailsProvider.roundsList[rulesProvider.editSelectedIndex]
    //       .description.isNotEmpty) {

    //     roundDescriptionController.text = hackathonDetailsProvider.roundsList[rulesProvider.editSelectedIndex]
    //       .description;
    //   }
  }

  @override
  void dispose() {
    roundDescriptionController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rulesProvider = Provider.of<RulesProvider>(context);
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          rulesProvider.descriptionControllers[rulesProvider.editSelectedIndex],
          roundGlobalKeysMap[rulesProvider.editSelectedIndex]![
              'roundDescription']!);
      if (hackathonDetailsProvider
          .roundsList[rulesProvider.editSelectedIndex].description.isNotEmpty) {
        rulesProvider
                .descriptionControllers[rulesProvider.editSelectedIndex].text =
            hackathonDetailsProvider
                .roundsList[rulesProvider.editSelectedIndex].description;
      }
    });

    // if (hackathonDetailsProvider.roundsList[rulesProvider.editSelectedIndex]
    //       .description!.isNotEmpty) {
    //     // hackathonDetailsProvider.updateTemporaryRoundDescription(
    //     //     rulesProvider.editSelectedIndex,
    //     //     hackathonDetailsProvider
    //     //         .roundsList[rulesProvider.editSelectedIndex].description);
    //     roundDescriptionController.text = hackathonDetailsProvider
    //         .roundsList[rulesProvider.editSelectedIndex].description;
    //   }

    return Container(
      height: defaultEditScaleHeight(
          widget.containerHeight,
          hackathonContainerPropertiesProvider
              .containerPropertiesMap[roundContainerGlobalKeysMap[rulesProvider
                  .editSelectedIndex]!['roundDescriptionContainer']]!
              .height
              .toDouble()),
      alignment: Alignment.center,
      child: Stack(children: [
        Positioned(
          left: defaultEditScaleWidth(widget.containerWidth, 31),
          top: defaultEditScaleHeight(widget.containerHeight, 0),
          child: Container(
            width: defaultEditScaleWidth(widget.containerWidth, 486),
            height: defaultEditScaleHeight(
                widget.containerHeight,
                0.64 *
                    hackathonContainerPropertiesProvider
                        .containerPropertiesMap[roundContainerGlobalKeysMap[
                                rulesProvider.editSelectedIndex]![
                            'roundDescriptionContainer']]!
                        .height
                        .toDouble()),
            decoration: ShapeDecoration(
                color: hackathonContainerPropertiesProvider.stringToColor(
                    roundContainerGlobalKeysMap[rulesProvider
                        .editSelectedIndex]!['roundDescriptionContainer']!,
                    1,
                    ContainerColorProperties.containerColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        hackathonContainerPropertiesProvider.containerPropertiesMap[roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescriptionContainer']]!.borderRadius
                            .toDouble()),
                    side: BorderSide(
                        width:
                            hackathonContainerPropertiesProvider.containerPropertiesMap[roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescriptionContainer']]!.borderWidth
                                    .toDouble() /
                                100 *
                                10,
                        color: hackathonContainerPropertiesProvider.stringToColor(
                            roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescriptionContainer']!,
                            1,
                            ContainerColorProperties.containerBorderColor),
                        strokeAlign: BorderSide.strokeAlignInside)),
                shadows: [
                  BoxShadow(
                      blurRadius: hackathonContainerPropertiesProvider
                          .containerPropertiesMap[roundContainerGlobalKeysMap[
                                  rulesProvider.editSelectedIndex]![
                              'roundDescriptionContainer']]!
                          .blurRadius
                          .toDouble(),
                      offset: const Offset(0, -4),
                      spreadRadius: 0,
                      color: hackathonContainerPropertiesProvider.stringToColor(
                          roundContainerGlobalKeysMap[
                                  rulesProvider.editSelectedIndex]![
                              'roundDescriptionContainer']!,
                          1,
                          ContainerColorProperties.boxShadowColor))
                ]),
          ),
        ),
        Positioned(
            left: 0,
            top: 33,
            child: InkWell(
              onTap: () {
                hackathonContainerPropertiesProvider.selectedContainerKey =
                    roundContainerGlobalKeysMap[rulesProvider
                        .editSelectedIndex]!['roundDescriptionContainer'];
                if (hackathonTextPropertiesProvider.selectedTextFieldKey !=
                    null) {
                  hackathonTextPropertiesProvider.selectedTextFieldKey = null;
                }
              },
              child: Container(
                width: defaultEditScaleWidth(widget.containerWidth, 550),
                height: defaultEditScaleHeight(
                    widget.containerHeight,
                    0.72 *
                        hackathonContainerPropertiesProvider
                            .containerPropertiesMap[roundContainerGlobalKeysMap[
                                    rulesProvider.editSelectedIndex]![
                                'roundDescriptionContainer']]!
                            .height
                            .toDouble()),
                padding: EdgeInsets.only(
                    top: defaultEditScaleHeight(widget.containerHeight, 21),
                    left: defaultEditScaleWidth(widget.containerWidth, 31),
                    right: defaultEditScaleWidth(widget.containerWidth, 19),
                    bottom: defaultEditScaleHeight(widget.containerHeight, 66)),
                decoration: ShapeDecoration(
                  color: hackathonContainerPropertiesProvider.stringToColor(
                      roundContainerGlobalKeysMap[rulesProvider
                          .editSelectedIndex]!['roundDescriptionContainer']!,
                      0,
                      ContainerColorProperties.containerColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          hackathonContainerPropertiesProvider.containerPropertiesMap[roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescriptionContainer']]!.borderRadius
                              .toDouble()),
                      side: BorderSide(
                          width: hackathonContainerPropertiesProvider
                                  .containerPropertiesMap[
                                      roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]![
                                          'roundDescriptionContainer']]!
                                  .borderWidth
                                  .toDouble() /
                              100 *
                              10,
                          color: hackathonContainerPropertiesProvider.stringToColor(
                              roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescriptionContainer']!,
                              0,
                              ContainerColorProperties.containerBorderColor),
                          strokeAlign: BorderSide.strokeAlignInside)),
                ),
                child: Column(
                  children: [
                    DefaultTemplateTextFormField(
                      hintText: 'Type your Description here...',
                      fieldKey: roundGlobalKeysMap[rulesProvider
                          .editSelectedIndex]!['roundDescription']!,
                      controller: rulesProvider.descriptionControllers[
                          rulesProvider.editSelectedIndex],
                      containerHeight: widget.containerHeight,
                      containerWidth: widget.containerWidth,
                      editContainerMaxWidth: double.infinity,
                      defaultEditBoxColorSet: true,
                      maxLength: 580,
                      maxLines: 9,
                     
                      isDense: true,
                      onSaved: (value) {
                        for (int i = 0;
                            i < rulesProvider.descriptionControllers.length;
                            i++) {
                          hackathonDetailsProvider.updateRoundDescription(
                              i, rulesProvider.descriptionControllers[i].text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            )),
        Positioned(
            left: defaultEditScaleWidth(widget.containerWidth, 229),
            top: defaultEditScaleHeight(
                widget.containerHeight,
                0.68 *
                    hackathonContainerPropertiesProvider
                        .containerPropertiesMap[roundContainerGlobalKeysMap[
                                rulesProvider.editSelectedIndex]![
                            'roundDescriptionContainer']]!
                        .height
                        .toDouble()),
            child: Container(
              width: defaultEditScaleWidth(widget.containerWidth, 114),
              height: defaultEditScaleHeight(
                  widget.containerHeight,
                  0.23 *
                      hackathonContainerPropertiesProvider
                          .containerPropertiesMap[roundContainerGlobalKeysMap[
                                  rulesProvider.editSelectedIndex]![
                              'roundDescriptionContainer']]!
                          .height
                          .toDouble()),
              decoration: ShapeDecoration(
                  color: hackathonContainerPropertiesProvider.stringToColor(
                      roundContainerGlobalKeysMap[rulesProvider
                          .editSelectedIndex]!['roundDescriptionContainer']!,
                      2,
                      ContainerColorProperties.containerColor),
                  shape: CircleBorder(
                      side: BorderSide(
                          width: hackathonContainerPropertiesProvider
                                  .containerPropertiesMap[
                                      roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]![
                                          'roundDescriptionContainer']]!
                                  .borderWidth
                                  .toDouble() /
                              100 *
                              10,
                          color: hackathonContainerPropertiesProvider.stringToColor(
                              roundContainerGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescriptionContainer']!,
                              2,
                              ContainerColorProperties.containerBorderColor),
                          strokeAlign: BorderSide.strokeAlignInside))),
            ))
      ]),
    );
  }
}
