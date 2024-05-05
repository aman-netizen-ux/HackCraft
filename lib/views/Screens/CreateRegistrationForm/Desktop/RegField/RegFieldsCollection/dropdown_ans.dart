import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class DropDownField extends StatefulWidget {
  final String question;
  final List<String> options;

  final String hint;
  final bool create, required;

  const DropDownField(
      {Key? key,
      required this.question,
      required this.hint,
      required this.options,
      required this.create,
      required this.required})
      : super(key: key);

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  late TextEditingController questionController;
  late TextEditingController hintController;
  @override
  void initState() {
    super.initState();
    questionController = TextEditingController(text: widget.question);
    hintController = TextEditingController(text: widget.hint);
  }

  @override
  void dispose() {
    hintController.dispose();
    questionController.dispose();
    super.dispose();
  }

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
            children: [
              TextFormField(
                style: GoogleFonts.firaSans(
                  fontSize: heightScaler(context, 14),
                  fontWeight: FontWeight.w500,
                  color: black1,
                ),
                controller: questionController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                enabled: !widget.create,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FormBuilderDropdown(
                      alignment: Alignment.center,
                      name: widget.question,
                      dropdownColor: const Color(0xfff9f9f9),
                      elevation: 0,
                      enabled: widget.create,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: widget.hint,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      items: widget.options
                          .map((option) => DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    width: scaleWidth(context, 16),
                  ),
                  widget.required
                      ? const Text("Required")
                      : const Text("Optional"),
                  SizedBox(
                    width: widget.create ? scaleWidth(context, 50) : 0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
