import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          rulesProvider.descriptionControllers[rulesProvider.editSelectedIndex],
          roundGlobalKeysMap[rulesProvider.editSelectedIndex]![
              'roundDescription']!);
      if (hackathonDetailsProvider
          .roundsList[rulesProvider.editSelectedIndex].description.isNotEmpty) {
        rulesProvider.descriptionControllers[rulesProvider.editSelectedIndex].text = hackathonDetailsProvider
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
        width: defaultEditScaleWidth(widget.containerWidth, 550),
        height: defaultEditScaleHeight(widget.containerHeight, 453),
        child: Stack(children: [
          Positioned(
            left: defaultEditScaleWidth(widget.containerWidth, 31),
            top: defaultEditScaleHeight(widget.containerHeight, 0),
            child: Container(
              width: defaultEditScaleWidth(widget.containerWidth, 486),
              height: defaultEditScaleHeight(widget.containerHeight, 318),
              decoration: ShapeDecoration(
                  color: black1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                        blurRadius: 3,
                        offset: Offset(0, -4),
                        spreadRadius: 0,
                        color: Colors.black)
                  ]),
            ),
          ),
          Positioned(
              left: 0,
              top: 33,
              child: Container(
                width: defaultEditScaleWidth(widget.containerWidth, 550),
                height: defaultEditScaleHeight(widget.containerHeight, 360),
                padding: EdgeInsets.only(
                    top: defaultEditScaleHeight(widget.containerHeight, 21),
                    left: defaultEditScaleWidth(widget.containerWidth, 31),
                    right: defaultEditScaleWidth(widget.containerWidth, 19),
                    bottom: defaultEditScaleHeight(widget.containerHeight, 66)),
                decoration: ShapeDecoration(
                  color: lavender,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Column(
                  children: [
                    DefaultTemplateTextFormField(
                      hintText: 'Type your Description here...',
                      fieldKey: roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!,
                      controller: rulesProvider.descriptionControllers[rulesProvider.editSelectedIndex],
                      containerHeight: widget.containerHeight,
                      containerWidth: widget.containerWidth,
                      editContainerMaxWidth: double.infinity,
                      defaultEditBoxColorSet: true,
                      maxLength: 580,
                      maxLines: 9,
                      height: 27,
                      isDense: true,
                      onSaved: (value) {
                        for(int i = 0; i < rulesProvider.descriptionControllers.length; i++){
                          hackathonDetailsProvider.updateRoundDescription(
                            i, rulesProvider.descriptionControllers[i].text);
                        }
                      },
                    ),
                  ],
                ),
              )),

          Positioned(
              left: defaultEditScaleWidth(widget.containerWidth, 229),
              top: defaultEditScaleHeight(widget.containerHeight, 339),
              child: Container(
                width: defaultEditScaleWidth(widget.containerWidth, 114),
                height: defaultEditScaleHeight(widget.containerHeight, 114),
                decoration:
                    const ShapeDecoration(color: black1, shape: CircleBorder()),
              ))
        ]));
  }
}
