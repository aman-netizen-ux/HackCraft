import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/utils/upperCaseTextFormatter.dart';
import 'package:major_project__widget_testing/views/Components/circleCornerInputBorder.dart';
import 'package:provider/provider.dart';

class DefaultTemplateTextFormField extends StatelessWidget {
  const DefaultTemplateTextFormField(
      {Key? key,
      required this.fieldKey,
      this.controller,
      required this.containerHeight,
      required this.hintText,
      this.onSaved,
      this.cursorHeight,
      this.maxLength,
      this.contentPadding,
      TextInputType? keyboardType,
      int? maxLines,
      // double? height,
      Color? cursorColor,
      bool? isDense,
      double? editContainerMaxWidth,
      int? minLines,
      bool? defaultEditBoxColorSet,
      bool? alignmentRequired,
      required this.containerWidth})
      : keyboardType = keyboardType ??
            TextInputType
                .text, // Set default hint text if user doesn't provide any input
        maxLines = maxLines == 0
            ? null
            : (maxLines ??
                1), // Set maxLines to 1 if user doesn't provide any input
        minLines = minLines == 0 ? null : (minLines ?? 1),
        // height = height ?? 22.4,
        cursorColor = cursorColor ?? Colors.black,
        isDense = isDense ?? false,
        defaultEditBoxColorSet = defaultEditBoxColorSet ?? false,
        editContainerMaxWidth = editContainerMaxWidth ?? 150,
        alignmentRequired = alignmentRequired ?? true,
        super(key: key);

  final GlobalKey<State<StatefulWidget>> fieldKey;
  final TextEditingController? controller;
  final double containerHeight;
  final double containerWidth;
  final void Function(String?)? onSaved;
  final String hintText;
  final int? maxLines;
  final TextInputType keyboardType;
  final int? maxLength;
  // final double height; //for now only
  final double? cursorHeight;
  final Color cursorColor;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;
  final double editContainerMaxWidth;
  final int? minLines;
  final bool defaultEditBoxColorSet;
  final bool alignmentRequired;

  @override
  Widget build(BuildContext context) {
    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);

    return Align(
      alignment: alignmentRequired
          ? hackathonTextPropertiesProvider.getContainerAlign(
              hackathonTextPropertiesProvider
                  .textFieldPropertiesMap[fieldKey]!.align)
          : Alignment.center,
      child: Container(
        decoration:
            hackathonTextPropertiesProvider.selectedTextFieldKey == fieldKey &&
                    alignmentRequired
                ? CircleCornerBoxDecoration(
                    circleBorder: defaultEditBoxColorSet ? blue : Colors.white,
                    circleFill: defaultEditBoxColorSet ? Colors.white : blue,
                    borderSide: const BorderSide(color: blue))
                : null,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth:
                defaultEditScaleWidth(containerWidth, editContainerMaxWidth),
          ), // Maximum width
          child: IntrinsicWidth(
            stepWidth: 10,
            child: TextFormField(
                // the key is passed to fetch the properties of the text form field mapped against this key
                key: fieldKey,
                textAlign: hackathonTextPropertiesProvider.getTextAlign(
                    hackathonTextPropertiesProvider
                        .textFieldPropertiesMap[fieldKey]!.align),
                // textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                cursorHeight: cursorHeight,
                cursorColor: cursorColor,
                decoration: InputDecoration(
                  isDense: isDense,
                  contentPadding: contentPadding,
                  hintText: hintText,
                  hintStyle: GoogleFonts.getFont(
                      hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[fieldKey]!.font,
                      fontStyle: hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[fieldKey]!.italics
                          ? FontStyle.italic
                          : FontStyle.normal,
                      letterSpacing: hackathonTextPropertiesProvider
                          .textFieldPropertiesMap[fieldKey]!.letterSpacing
                          .toDouble(),
                      decoration: TextDecoration.combine([
                        hackathonTextPropertiesProvider
                                .textFieldPropertiesMap[fieldKey]!.strikethrogh
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        hackathonTextPropertiesProvider
                                .textFieldPropertiesMap[fieldKey]!.underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ]),
                      fontSize: defaultEditScaleHeight(
                          containerHeight,
                          hackathonTextPropertiesProvider.textFieldPropertiesMap[fieldKey]!.size
                              .toDouble()), //20
                      color: hackathonTextPropertiesProvider
                          .stringToColor(fieldKey), //greyish1,
                      fontWeight: hackathonTextPropertiesProvider
                          .getSelectedTextFieldFontWeight(fieldKey),
                      height: lineHeight(
                          hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[fieldKey]!.lineHeight.toDouble(),
                          hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[fieldKey]!.size
                              .toDouble())), //20 //Line Height is changed because of cursor size, initial line height was 22.4
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: CircleCornerInputBorder(
                      circleBorder: defaultEditBoxColorSet ? red : Colors.white,
                      circleFill: defaultEditBoxColorSet ? Colors.white : red,
                      borderSide: const BorderSide(color: red)),
                  focusedErrorBorder: InputBorder.none,
                  counterText: "",
                ),
                inputFormatters: [
                  UpperCaseTextFormatter(
                      hackathonTextPropertiesProvider, fieldKey),
                ],

                // maxLength: 1900,//commented so user can type any no. of characters as he wants
                maxLength: maxLength,
                minLines: minLines,
                maxLines:
                    maxLines, //null so user can add any no. of lines as he want(will work together with  keyboardType: TextInputType.multiline)
                keyboardType:
                    keyboardType, //null so user can add any no. of lines as he want(will work together with maxline: null)
                style: GoogleFonts.getFont(
                    hackathonTextPropertiesProvider
                        .textFieldPropertiesMap[fieldKey]!.font,
                    fontSize: defaultEditScaleHeight(
                        containerHeight,
                        hackathonTextPropertiesProvider
                            .textFieldPropertiesMap[fieldKey]!.size
                            .toDouble()), //20
                    fontStyle: hackathonTextPropertiesProvider
                            .textFieldPropertiesMap[fieldKey]!.italics
                        ? FontStyle.italic
                        : FontStyle.normal,
                    decoration: TextDecoration.combine([
                      hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[fieldKey]!.strikethrogh
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[fieldKey]!.underline
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ]),
                    letterSpacing: hackathonTextPropertiesProvider
                        .textFieldPropertiesMap[fieldKey]!.letterSpacing
                        .toDouble(),
                    color: hackathonTextPropertiesProvider
                        .stringToColor(fieldKey), //greyish1
                    fontWeight: hackathonTextPropertiesProvider
                        .getSelectedTextFieldFontWeight(fieldKey),
                    height:
                        lineHeight(
                           hackathonTextPropertiesProvider
                              .textFieldPropertiesMap[fieldKey]!.lineHeight.toDouble(),
                           hackathonTextPropertiesProvider.textFieldPropertiesMap[fieldKey]!.size.toDouble())), //20 //Line Height Changed
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  }
                  return null;
                },
                onTap: () {
                  hackathonTextPropertiesProvider.selectedTextFieldKey =
                      fieldKey;
                  if (hackathonContainerPropertiesProvider
                          .selectedContainerKey != null) {
                    hackathonContainerPropertiesProvider.selectedContainerKey = null;
                  }

                  print("in textform :P ${hackathonContainerPropertiesProvider.activeIndex}");

                  if (hackathonContainerPropertiesProvider.activeIndex > -1) {
                    hackathonContainerPropertiesProvider.colorIndex = -1;
                    hackathonContainerPropertiesProvider.setActiveIndex(-1);
                  } 

                  // if (hackathonContainerPropertiesProvider.activeIndex ) {
                  //     hackathonContainerPropertiesProvider.setIsContainerColorSelected();
                  // }

                  

                  hackathonTextPropertiesProvider
                      .updateSelectedFontFromTextField();
                  hackathonTextPropertiesProvider.getLetterSpacing();
                },
                // onTapOutside: (){
                //   hackathonTextPropertiesProvider.sel
                // },
                onSaved: onSaved),
          ),
        ),
      ),
    );
  }
}
