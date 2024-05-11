import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';

class CustomCheck extends StatelessWidget {
  final bool value, enable;
  final ValueChanged<bool> onChanged;

  const CustomCheck({
    Key? key,
    required this.enable,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enable) {
          onChanged(!value);
        }
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: indicatorblue,
          ),
          color: enable && value ? indicatorblue : null,
        ),
        child: enable && value
            ? const Icon(
                Icons.check,
                size: 16,
                color: white,
              )
            : null,
      ),
    );
  }
}
