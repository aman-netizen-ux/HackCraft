// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:major_project__widget_testing/constants/colors.dart';
// import 'package:major_project__widget_testing/constants/fontfamily.dart';
// import 'package:major_project__widget_testing/constants/radius.dart';
// import 'package:major_project__widget_testing/utils/scaling.dart';
// import 'package:major_project__widget_testing/utils/text_lineheight.dart';

// class CustomColorPickerInput extends StatefulWidget {
//   const CustomColorPickerInput(
//     this.color,
//     this.onColorChanged, {
//     Key? key,
//     this.enableAlpha = true,
//     this.embeddedText = false,
//     this.disable = false,
//   }) : super(key: key);

//   final Color color;
//   final ValueChanged<Color> onColorChanged;
//   final bool enableAlpha;
//   final bool embeddedText;
//   final bool disable;

//   @override
//   _CustomColorPickerInputState createState() => _CustomColorPickerInputState();
// }

// class _CustomColorPickerInputState extends State<CustomColorPickerInput> {
//   TextEditingController textEditingController = TextEditingController();
//   int inputColor = 0;

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (inputColor != widget.color.value) {
//       textEditingController.text = '#' +
//           widget.color.red.toRadixString(16).toUpperCase().padLeft(2, '0') +
//           widget.color.green.toRadixString(16).toUpperCase().padLeft(2, '0') +
//           widget.color.blue.toRadixString(16).toUpperCase().padLeft(2, '0') +
//           (widget.enableAlpha
//               ? widget.color.alpha
//                   .toRadixString(16)
//                   .toUpperCase()
//                   .padLeft(2, '0')
//               : '');
//     }
//     return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//       SizedBox(
//         width: scaleWidth(context, 88),
//         height: scaleHeight(context, 25),
//         child: TextField(
//           enabled: !widget.disable,
//           controller: textEditingController,
//           textAlign: TextAlign.center,
//           style:GoogleFonts.getFont(fontFamily1,
//                 fontSize: scaleHeight(context, 16),
//                 color: Colors.white,
//                 fontWeight: FontWeight.w200,
//                 height: lineHeight(23, 16)) ,
//           inputFormatters: [
//             UpperCaseTextFormatter(),
//             FilteringTextInputFormatter.allow(RegExp(kValidHexPattern)),
//           ],
//           decoration: InputDecoration(
//             isDense: true,
//             // label: widget.embeddedText ? const Text('Hex') : null,
//             hintText: widget.embeddedText ?  "Hex" : null,
//             contentPadding: const EdgeInsets.symmetric(vertical: 5),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(rad5_1),
//                 borderSide: const BorderSide(color: greyish3, width: 1)),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(rad5_1),
//                 borderSide: const BorderSide(color: greyish3, width: 1)),
//             hintStyle: GoogleFonts.getFont(fontFamily1,
//                 fontSize: scaleHeight(context, 16),
//                 color: Colors.white,
//                 fontWeight: FontWeight.w200,
//                 height: lineHeight(23, 16)),
//           ),
//           onSubmitted: (String value) {
//             String input = value;
//             if (value.length == 9) {
//               input = value.split('').getRange(7, 9).join() +
//                   value.split('').getRange(1, 7).join();
//             }
//             final Color? color = colorFromHex(input);
//             if (color != null) {
//               widget.onColorChanged(color);
//               inputColor = color.value;
//             }
//           },
//         ),
//       ),
//     ]);
//   }
// }
