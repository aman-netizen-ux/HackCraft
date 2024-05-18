import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final bool enable;

  const CustomRadioButton({super.key, 
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
           color: value == groupValue ? activeColor : inactiveColor,
            width: 2.0,
          ),
        ),
        child: !enable
            ? null
            : value == groupValue
                ? Center(
                    child: Container(
                      width: 8.0,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: activeColor,
                      ),
                    ),
                  )
                : null,
      ),
    );
  }
}
