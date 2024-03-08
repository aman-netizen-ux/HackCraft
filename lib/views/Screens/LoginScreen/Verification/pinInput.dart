import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:major_project__widget_testing/constants/colors.dart';

var code = "";

class PinInput extends StatelessWidget {
  PinInput({required this.first, required this.last});
  final bool first, last;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: darkCharcoal,

      onChanged: (value) {
        code = code + value;
        if (value.length == 1 && last == false) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty && first == false) {
          FocusScope.of(context).previousFocus();
        }
      },
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: white,
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: darkCharcoal,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: darkCharcoal,
            width: 1,
          ),
        ),
      ),
    );
  }
}
