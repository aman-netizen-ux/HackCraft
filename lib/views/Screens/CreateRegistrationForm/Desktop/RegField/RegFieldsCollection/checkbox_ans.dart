import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/customCheck.dart';

class CheckBoxField extends StatefulWidget {
  final String question;
  final String error;
  final List<String> options;
  final bool create, required;

  const CheckBoxField(
      {super.key,
      required this.question,
      required this.error,
      required this.create,
      required this.options,
      required this.required});

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {
  late TextEditingController hintController;
  final _formKey = GlobalKey<FormBuilderState>();
  List<String> selectedOptions = [];

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
              _buildSelectOptions(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildCreateOptions() {
  //   return FormBuilder(
  //     key: _formKey,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         FormBuilderTextField(
  //           name: 'options',
  //           decoration: InputDecoration(
  //             labelText: widget.hint,
  //           ),
  //         ),
  //         SizedBox(height: scaleHeight(context, 10)),
  //         ElevatedButton(
  //           onPressed: () {
  //             _formKey.currentState!.save();
  //             if (_formKey.currentState!.validate()) {
  //               final newOption =
  //                   _formKey.currentState!.fields['options']!.value;
  //               setState(() {
  //                 widget.options.add(newOption);
  //               });
  //               _formKey.currentState!.reset();
  //             }
  //           },
  //           child: const Text('Add Option'),
  //         ),
  //         SizedBox(height: scaleHeight(context, 10)),
  //         SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: Row(
  //             children: widget.options.map((option) {
  //               return Padding(
  //                 padding: const EdgeInsets.only(right: 20),
  //                 child: Chip(
  //                   label: Text(option),
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSelectOptions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            runSpacing: scaleHeight(context, 20),
            spacing: scaleWidth(context, 26),
            children: widget.options.map((option) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomCheck(
                    enable: !widget.create,
                    value: selectedOptions.contains(option),
                    onChanged: (value) {
                      setState(() {
                        if (value) {
                          selectedOptions.add(option);
                        } else {
                          selectedOptions.remove(option);
                        }
                      });
                    },
                  ),
                  SizedBox(width: scaleWidth(context, 8)),
                  Text(
                    option,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: 14, color: indicatorblue),
                  ),
                  SizedBox(width: scaleWidth(context, 20)),
                ],
              );
            }).toList(),
          ),
        ),
        SizedBox(
          width: scaleWidth(context, 16),
        ),
        Text(
          "REQUIRED",
          style: GoogleFonts.getFont(fontFamily2,
              fontSize: scaleHeight(context, 16),
              color: widget.required ? midnigthBlue : Colors.transparent,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(width: widget.create ? scaleWidth(context, 50) : 0),
      ],
    );
  }
}
