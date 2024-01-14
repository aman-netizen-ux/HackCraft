import 'package:flutter/services.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:flutter/material.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  final HackathonTextPropertiesProvider provider;
  final GlobalKey key;

  UpperCaseTextFormatter(this.provider, this.key);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Check if the uppercase mode is active for the current text field
    bool shouldConvertToUppercase =
        provider.textFieldPropertiesMap[key]!.upperCase;

    if (shouldConvertToUppercase) {
      return TextEditingValue(
        text: newValue.text.toUpperCase(),
        selection: newValue.selection,
      );
    }
    return newValue; // Return as-is if no conversion is needed
  }
}

class ToggleAllCapsNotification extends Notification {
  final bool isAllCaps;

  ToggleAllCapsNotification({required this.isAllCaps});
}