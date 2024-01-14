import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/utils/upperCaseTextFormatter.dart';
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
  State<DefaultRoundsDescription> createState() => _DefaultRoundsDescriptionState();
}

class _DefaultRoundsDescriptionState extends State<DefaultRoundsDescription> {
  late TextEditingController roundDescriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    roundDescriptionController = TextEditingController();

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context, listen: false);

    final rulesProvider = Provider.of<RulesProvider>(context, listen: false);

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

        print(hackathonDetailsProvider.roundsList[rulesProvider.editSelectedIndex]
          .description);

         

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          roundDescriptionController, roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!);
if (hackathonDetailsProvider.roundsList[rulesProvider.editSelectedIndex]
          .description.isNotEmpty) {


        roundDescriptionController.text = hackathonDetailsProvider.roundsList[rulesProvider.editSelectedIndex]
          .description;
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
                child: TextFormField(
                  key: roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!,
                  textAlign: hackathonTextPropertiesProvider
                              .getTextAlign(hackathonTextPropertiesProvider
                                  .textFieldPropertiesMap[roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                  .align),
                  controller: roundDescriptionController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'Type your Description here...',
                    hintStyle: GoogleFonts.getFont(
                       hackathonTextPropertiesProvider
                                    .textFieldPropertiesMap[roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                    .font,

                         fontStyle:
                                    hackathonTextPropertiesProvider.textFieldPropertiesMap[roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!.italics
                                        ? FontStyle.italic
                                        : FontStyle.normal,
                                decoration: TextDecoration.combine([
                                  hackathonTextPropertiesProvider
                                          .textFieldPropertiesMap[
                                              roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                          .strikethrogh
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  hackathonTextPropertiesProvider
                                          .textFieldPropertiesMap[
                                              roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                          .underline
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                ]),
                        fontSize: defaultEditScaleHeight(
                                    widget.containerHeight,
                                    hackathonTextPropertiesProvider.textFieldPropertiesMap[roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!.size
                                        .toDouble()),
                        color: hackathonTextPropertiesProvider
                                    .stringToColor(roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!),
                        fontWeight: hackathonTextPropertiesProvider
                                    .getSelectedTextFieldFontWeight(
                                        roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!),
                        height: lineHeight(27, 
                        hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[
                                          roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                      .size
                                      .toDouble(),
                        )),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    counterText: "",
                  ),

                   inputFormatters: [
                            UpperCaseTextFormatter(
                                hackathonTextPropertiesProvider,
                                roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!),
                          ],
                  maxLength: 580,
                  maxLines: 9,
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.getFont(

                     hackathonTextPropertiesProvider
                                  .textFieldPropertiesMap[roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                  .font,
                              fontSize: defaultEditScaleHeight(
                                  widget.containerHeight,
                                  hackathonTextPropertiesProvider
                                      .textFieldPropertiesMap[roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                      .size
                                      .toDouble()),
                      decoration: TextDecoration.combine([
                                hackathonTextPropertiesProvider
                                        .textFieldPropertiesMap[
                                            roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                        .strikethrogh
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                hackathonTextPropertiesProvider
                                        .textFieldPropertiesMap[
                                            roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!
                                        .underline
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ]),
                     color: hackathonTextPropertiesProvider.stringToColor(
                                  roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!), //greyish1
                              fontWeight: hackathonTextPropertiesProvider.getSelectedTextFieldFontWeight(
                                  roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!),
                      height: lineHeight(27, hackathonTextPropertiesProvider.textFieldPropertiesMap[roundGlobalKeysMap[rulesProvider.editSelectedIndex]!['roundDescription']!]!.size.toDouble())),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                   onTap: () {
                            hackathonTextPropertiesProvider
                                    .selectedTextFieldKey =
                                roundGlobalKeysMap[ rulesProvider.editSelectedIndex]!['roundDescription']!;
                            hackathonTextPropertiesProvider
                                .updateSelectedFontFromTextField();
                          },
                 
                  onSaved: (value) {
                    hackathonDetailsProvider.updateRoundDescription(
                        rulesProvider.editSelectedIndex, value.toString());
                  },
                ),
              )),

          // Text('Welcome to the electrifying first round of Velocity Vista - the "UX Face-Off!" Here, we separate design champions from budding creators as they embark on a quest to showcase their UI/UX design skills. Your mission: craft a dazzling UI/UX design for a website or app, and this is your moment to shine. The submission window is open from October 21st, 2023, at 12:00 AM to October 23rd, 2023, at midnight. Brace yourself; it''s an elimination round, so bring your absolute best! The submission form awaits, with the label "Submit Your Design" and PDF as the only accepted format',
          // textAlign: TextAlign.center,
          //  style: GoogleFonts.getFont(fontFamily2,
          // fontSize: defaultEditScaleWidth(containerWidth, 15),
          // color: greyish1,
          // fontWeight: FontWeight.w400,
          // height: lineHeight(27, 18))))),
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
