import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_textFormField.dart';
import 'package:provider/provider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';

class DefaultEditAboutus extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditAboutus(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  State<DefaultEditAboutus> createState() => _DefaultEditAboutusState();
}

class _DefaultEditAboutusState extends State<DefaultEditAboutus> {
  late TextEditingController hackathonAboutController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    hackathonAboutController = TextEditingController();

    // HackathonTextPropertiesProvider is for text Field Properties and its methods
    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context, listen: false);

    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context,
            listen: false);

    hackathonTextPropertiesProvider.textFieldPropertiesMap[descriptionKey] =
        TextFieldProperties(
      size: 20,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF000100)',
      underline: false,
      upperCase: false,
    );

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[aboutContainerKey] =
        ContainerProperties(
            borderColor: 'Color(0xFF534646)',
            height: 175,
            color: 'Color(0xFFFFFFFF)',
            borderWidth: 1,
            blurRadius: 0,
            borderRadius: 15,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

    hackathonContainerPropertiesProvider
            .containerPropertiesMap[getRegisteredContainerKey] =
        ContainerProperties(
            borderColor: 'Color(0xFF9E9393)',
            height: 58,
            color: 'Color(0xFFFFFFFF)',
            borderWidth: 0,
            blurRadius: 0,
            borderRadius: 55,
            boxShadowColor: 'Color(0xFFFFFFFF)',
            focusedBorderColor: '');

//These limits are optional we have to change them in future
    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[aboutContainerKey] =
        LimitContainerHeight(minHeight: 175, maxHeight: 500);

    hackathonContainerPropertiesProvider
            .limitContainerHeightMap[getRegisteredContainerKey] =
        LimitContainerHeight(minHeight: 70, maxHeight: 200);

    if (hackathonDetailsProvider.about.isNotEmpty) {
      hackathonAboutController.text = hackathonDetailsProvider.about;
    }
  }

  @override
  void dispose() {
    hackathonAboutController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          hackathonAboutController, descriptionKey);
    });

    return Padding(
      padding: EdgeInsets.only(
          top: defaultEditScaleHeight(widget.containerHeight, 67)),
      child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            //This container will show the complete description of the hackathon, including rounds, rules, and many other things.
            //The height of the container will automatically increase based on the size of the text being entered.
            Column(
              children: [
                Container(
                  // color :Colors.red,
                  width: double.infinity,
                  height: defaultEditScaleHeight(
                      widget.containerHeight,
                      (hackathonContainerPropertiesProvider
                                      .containerPropertiesMap[
                                          getRegisteredContainerKey]!
                                      .height
                                      .toDouble() -
                                  hackathonContainerPropertiesProvider
                                      .containerPropertiesMap[
                                          aboutContainerKey]!
                                      .borderWidth
                                      .toDouble()) /
                              2 +
                          hackathonContainerPropertiesProvider
                              .containerPropertiesMap[aboutContainerKey]!
                              .borderWidth
                              .toDouble()),
                ),
                InkWell(
                  onTap: () {
                    hackathonContainerPropertiesProvider.selectedContainerKey =
                        aboutContainerKey;
                    if (hackathonTextPropertiesProvider.selectedTextFieldKey !=
                        null) {
                      hackathonTextPropertiesProvider.selectedTextFieldKey =
                          null;
                    }
                    if (hackathonTextPropertiesProvider.isTextColorSelected) {
                      hackathonTextPropertiesProvider.setIsTextColorSelected();
                    }
                  },
                  child: Container(
                      key: aboutContainerKey,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              defaultEditScaleWidth(widget.containerWidth, 37)),
                      decoration: BoxDecoration(
                          color: hackathonContainerPropertiesProvider.stringToColor(
                              aboutContainerKey,
                              0,
                              ContainerColorProperties.containerColor),
                          borderRadius: BorderRadius.circular(
                              hackathonContainerPropertiesProvider
                                  .containerPropertiesMap[aboutContainerKey]!
                                  .borderRadius
                                  .toDouble()),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: hackathonContainerPropertiesProvider
                                    .containerPropertiesMap[aboutContainerKey]!
                                    .blurRadius
                                    .toDouble(),
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                                color: hackathonContainerPropertiesProvider
                                    .stringToColor(
                                        aboutContainerKey,
                                        0,
                                        ContainerColorProperties
                                            .boxShadowColor))
                          ],
                          border: Border.all(
                              color: hackathonContainerPropertiesProvider
                                  .stringToColor(aboutContainerKey, 0,
                                      ContainerColorProperties.containerBorderColor),
                              width: defaultEditScaleWidth(widget.containerWidth, hackathonContainerPropertiesProvider.containerPropertiesMap[aboutContainerKey]!.borderWidth.toDouble() / 100 * 40),
                              strokeAlign: BorderSide.strokeAlignOutside)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: defaultEditScaleWidth(
                                widget.containerWidth, 44),
                            right: defaultEditScaleWidth(
                                widget.containerWidth, 44),
                            top: defaultEditScaleHeight(
                                widget.containerHeight,
                                hackathonContainerPropertiesProvider.containerPropertiesMap[getRegisteredContainerKey]!.height.toDouble() / 2 +
                                    hackathonContainerPropertiesProvider
                                        .containerPropertiesMap[
                                            getRegisteredContainerKey]!
                                        .borderWidth
                                        .toDouble() +
                                    30 +
                                    (hackathonContainerPropertiesProvider
                                                .containerPropertiesMap[
                                                    aboutContainerKey]!
                                                .height
                                                .toDouble() -
                                            175) /
                                        2),
                            bottom: defaultEditScaleHeight(
                                widget.containerHeight, 165 + (hackathonContainerPropertiesProvider.containerPropertiesMap[aboutContainerKey]!.height.toDouble() - 175) / 2)),
                        child: Column(
                          children: [
                            DefaultTemplateTextFormField(
                              hintText:
                                  'Give a detail description of your hackathon',
                              fieldKey: descriptionKey,
                              controller: hackathonAboutController,
                              containerHeight: widget.containerHeight,
                              containerWidth: widget.containerWidth,
                              editContainerMaxWidth: double.infinity,
                              isDense: true,
                              maxLength: null,
                              maxLines: 0,
                              keyboardType: TextInputType.multiline,
                              onSaved: (value) {
                                hackathonDetailsProvider.about =
                                    value.toString();
                              },
                            ),
                          ],
                        ),

                      )),
                ),
                SizedBox(
                  width: double.infinity,
                  height: defaultEditScaleHeight(widget.containerWidth, 125),
                  // color: Colors.blue,
                ),
              ],
            ),
            //The register button is positioned accordingly so that it starts before the container and goes until the container starts.
            //When you run the code, you'll understand what's written here.
            Positioned(
                // top: -defaultEditScaleWidth(containerWidth, 29),
                child: InkWell(
              onTap: () {
                hackathonContainerPropertiesProvider.selectedContainerKey =
                    getRegisteredContainerKey;
                if (hackathonTextPropertiesProvider.selectedTextFieldKey !=
                    null) {
                  hackathonTextPropertiesProvider.selectedTextFieldKey = null;
                }
              },
              child: Container(
                key: getRegisteredContainerKey,
                margin: EdgeInsets.symmetric(
                    horizontal:
                        defaultEditScaleWidth(widget.containerWidth, 512)),
                height: defaultEditScaleHeight(
                    widget.containerHeight,
                    hackathonContainerPropertiesProvider
                        .containerPropertiesMap[getRegisteredContainerKey]!
                        .height
                        .toDouble()),
                width: defaultEditScaleWidth(widget.containerWidth, 256),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: hackathonContainerPropertiesProvider.stringToColor(
                        getRegisteredContainerKey,
                        0,
                        ContainerColorProperties.containerColor),
                    borderRadius: BorderRadius.circular(
                        hackathonContainerPropertiesProvider
                            .containerPropertiesMap[getRegisteredContainerKey]!
                            .borderRadius
                            .toDouble()),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[getRegisteredContainerKey]!
                            .blurRadius
                            .toDouble(),
                        offset: const Offset(0, 0),
                        spreadRadius: 0,
                        color:
                            hackathonContainerPropertiesProvider.stringToColor(
                                getRegisteredContainerKey,
                                0,
                                ContainerColorProperties.boxShadowColor),
                      )
                    ],
                    border: Border.all(
                        color:
                            hackathonContainerPropertiesProvider.stringToColor(
                                getRegisteredContainerKey,
                                0,
                                ContainerColorProperties.containerBorderColor),
                        width: hackathonContainerPropertiesProvider
                            .containerPropertiesMap[getRegisteredContainerKey]!
                            .borderWidth
                            .toDouble(),
                        strokeAlign: BorderSide.strokeAlignOutside)),
                child: Text("Get Registered",
                    style: GoogleFonts.getFont(fontFamily2,
                        fontWeight: FontWeight.w600,
                        fontSize:
                            defaultEditScaleWidth(widget.containerWidth, 21),
                        height: lineHeight(22.4, 21),
                        color: black1)),
              ),
            )),
            //This container is used to show the prize section. It's also positioned like the above container,
            //but the difference is that the above one was positioned from the top and this one was positioned from the bottom.
            //Run the code once, and you'll understand.
            Positioned(
              bottom: defaultEditScaleHeight(widget.containerWidth, 0), //120
              child: Container(
                  color: lavender,
                  height:
                      defaultEditScaleHeight(widget.containerHeight, 400), //240
                  width: defaultEditScaleWidth(widget.containerWidth, 1118),
                  margin: EdgeInsets.symmetric(
                      horizontal:
                          defaultEditScaleWidth(widget.containerWidth, 81)),
                  child: SvgPicture.asset(
                      'assets/icons/defaultEditPortal/about.svg',
                      fit: BoxFit.fill)),
            ),
          ]),
          SizedBox(
            height:
                defaultEditScaleHeight(widget.containerHeight, 0), //153 //233
          )
        ],
      ),
    );
  }
}
