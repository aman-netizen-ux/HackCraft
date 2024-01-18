import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/utils/upperCaseTextFormatter.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.fieldKey,
    this.controller,
    required this.containerHeight,
     required this.hintText,
    this.onSaved,
    
    this.maxLength,
    TextInputType? keyboardType,
    int? maxLines, 
    double? height,
  })   : keyboardType = keyboardType ??  TextInputType.text, // Set default hint text if user doesn't provide any input
        maxLines = maxLines ?? 1, // Set maxLines to 1 if user doesn't provide any input
        height = height ?? 22.4,
        super(key: key);

  final GlobalKey<State<StatefulWidget>> fieldKey;
  final TextEditingController? controller;
  final double containerHeight;
  final void Function(String?)? onSaved;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  final int? maxLength;
  final double height;//for now only

  @override
  Widget build(BuildContext context) {
    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    return TextFormField(
        // the key is passed to fetch the properties of the text form field mapped against this key
        key: fieldKey,
        textAlign: hackathonTextPropertiesProvider.getTextAlign(
            hackathonTextPropertiesProvider
                .textFieldPropertiesMap[fieldKey]!.align),
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        //  cursorHeight: defaultEditScaleHeight(
        //      widget.containerHeight, 20),
        cursorColor: Colors.black,
        decoration: InputDecoration(
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
                  hackathonTextPropertiesProvider
                      .textFieldPropertiesMap[fieldKey]!.size
                      .toDouble()), //20
              color: hackathonTextPropertiesProvider
                  .stringToColor(fieldKey), //greyish1,
              fontWeight: hackathonTextPropertiesProvider
                  .getSelectedTextFieldFontWeight(fieldKey),
              height: lineHeight(
                  height,
                  hackathonTextPropertiesProvider
                      .textFieldPropertiesMap[fieldKey]!.size
                      .toDouble())), //20 //Line Height is changed because of cursor size, initial line height was 22.4
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          counterText: "",
        ),
        inputFormatters: [
          UpperCaseTextFormatter(hackathonTextPropertiesProvider, fieldKey),
        ],
       
        // maxLength: 1900,//commented so user can type any no. of characters as he wants
        maxLength: maxLength,
        maxLines:maxLines, //null so user can add any no. of lines as he want(will work together with  keyboardType: TextInputType.multiline)
        keyboardType: keyboardType, //null so user can add any no. of lines as he want(will work together with maxline: null)
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
            height: lineHeight(height, hackathonTextPropertiesProvider.textFieldPropertiesMap[fieldKey]!.size.toDouble())), //20 //Line Height Changed
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
        onTap: () {
          hackathonTextPropertiesProvider.selectedTextFieldKey = fieldKey;
          hackathonTextPropertiesProvider.updateSelectedFontFromTextField();
          hackathonTextPropertiesProvider.getLetterSpacing();
        },
        // onTapOutside: (){
        //   hackathonTextPropertiesProvider.sel
        // },
        onSaved: onSaved);
  }
}
