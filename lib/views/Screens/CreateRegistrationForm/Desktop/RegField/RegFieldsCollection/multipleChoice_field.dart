import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/customRadio.dart';

class MultipleChoiceField extends StatefulWidget {
  final String question ,error;
  final List<String> options;
  final bool create, required;
  

  const MultipleChoiceField(
      {Key? key,
      required this.question,
      required this.create,
      required this.options,
      required this.error,
      required this.required})
      : super(key: key);

  @override
  State<MultipleChoiceField> createState() => _MultipleChoiceFieldState();
}

class _MultipleChoiceFieldState extends State<MultipleChoiceField> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            left: widget.create ? scaleWidth(context, 10) : 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: scaleHeight(context, 20),
                    bottom: scaleHeight(context, 10)),
                child: Text(
                  widget.question,
                  style: GoogleFonts.firaSans(
                    fontSize: heightScaler(context, 14),
                    fontWeight: FontWeight.w500,
                    color: black1,
                  ),
                ),
              ),
              _buildSelectOption(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectOption() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            runSpacing: scaleHeight(context, 20),
            spacing: scaleWidth(context, 26),
            children: [
              for (var option in widget.options)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomRadioButton(
                      enable: !widget.create,
                      value: option,
                      groupValue: selectedOption ?? "",
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                      activeColor: indicatorblue,
                      inactiveColor: indicatorblue,
                    ),
                    SizedBox(width: scaleWidth(context, 8)),
                    Text(
                      option,
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: 14, color: indicatorblue),
                    ),
                  ],
                ),
            ],
          ),
        ),
        SizedBox(
          width: scaleWidth(context, 16),
        ),
        Text(
                    "REQUIRED",
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 16),
                        color:
                            widget.required ? midnigthBlue : Colors.transparent,
                        fontWeight: FontWeight.w500),
                  ),
        SizedBox(width: widget.create ? scaleWidth(context, 50) : 0),
      ],
    );
  }
}
