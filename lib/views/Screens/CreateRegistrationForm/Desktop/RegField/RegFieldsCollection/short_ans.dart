import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class ShortAnsField extends StatefulWidget {
  const ShortAnsField({
    super.key,
    required this.question,
    required this.create,
    required this.hint,
    this.initialAnswer = "",
    this.isDisabled = false,
    required this.required,
    required this.error,
    this.serialNumber,
    this.modelType,
    this.isRequiredData,
    this.requiredType, this.validation,
  });
  final String question;
  final String hint, error;
  final bool create;
  final bool required;
  final String initialAnswer;
  final bool isDisabled;
  final int? serialNumber;
  final String? modelType;
  final String? isRequiredData;
  final String? requiredType;
  final String? validation;
  @override
  State<ShortAnsField> createState() => _ShortAnsFieldState();
}

class _ShortAnsFieldState extends State<ShortAnsField> {
  late TextEditingController textController;
  String errorText = "";
  @override
  void initState() {
    super.initState();

    textController = TextEditingController();
    // Set initial text for the controller

    if (widget.initialAnswer.isNotEmpty) {
      textController.text = widget.initialAnswer;
    }
  }

  @override
  void didUpdateWidget(covariant ShortAnsField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialAnswer != oldWidget.initialAnswer) {
      setState(() {
        textController.text = widget.initialAnswer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('initial answer ${widget.initialAnswer} ${widget.hint}');
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
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontSize: scaleHeight(context, 14),
                    fontWeight: FontWeight.w500,
                    color:  !widget.create && !widget.isDisabled && errorText.isNotEmpty?red:black1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: scaleHeight(context, 37),
                      child: FormBuilderTextField(
                        controller: textController,
                        name: "short_ans",
                        style: GoogleFonts.firaSans(
                          fontSize: scaleHeight(context, 14),
                          fontWeight: FontWeight.w400,
                          color: black1,
                        ),
                        cursorColor: darkCharcoal,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: scaleHeight(context, 20),
                              vertical: 10),
                          hintStyle: GoogleFonts.firaSans(
                            fontSize: scaleHeight(context, 14),
                            fontWeight: FontWeight.w400,
                            color: concreteGrey,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: const BorderSide(
                              color: red,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide:  BorderSide(
                              color: !widget.create && !widget.isDisabled && errorText.isNotEmpty?red: black1,
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide:  BorderSide(
                              color: !widget.create && !widget.isDisabled && errorText.isNotEmpty? red: black1,
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: const BorderSide(
                              color: black1,
                              width: 0.5,
                            ),
                          ),
                          hintText: widget.hint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: const BorderSide(
                              color: black1,
                              width: 1,
                            ),
                          ),
                        ),
                        enabled: !widget.create && !widget.isDisabled,
                        onTapOutside: !widget.create
                            ? (PointerDownEvent e) {
                              String result= checkValidation(widget.validation.toString(),textController.text );
                                if (widget.required &&
                                    textController.text.isEmpty) {
                                  setState(() {
                                    errorText = widget.error;
                                  });
                                }
                               
                                else if (result.isNotEmpty) {
                                  setState(() {
                                    errorText=result;
                                  });
                                } else {
                                  setState(() {
                                    errorText = "";
                                  });
                                  final getFormProvider =
                                      Provider.of<GetRegistrationFormProvider>(
                                          context,
                                          listen: false);

                                  getFormProvider.updateDetails(
                                      textController.text,
                                      isRequiredData: widget.isRequiredData,
                                      requiredType: widget.requiredType,
                                      serialNumber: widget.serialNumber,
                                      modelType:
                                          widget.modelType);
                                  
                                }
                                FocusScope.of(context).unfocus();
                              }
                            : null,
                      ),
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
                  SizedBox(
                    width: widget.create ? scaleWidth(context, 50) : 0,
                  )
                ],
              ),
              !widget.create && !widget.isDisabled && errorText.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: scaleHeight(context, 8)),
                      child: Text(
                        errorText,
                        style: GoogleFonts.firaSans(
                          fontSize: scaleHeight(context, 12),
                          fontWeight: FontWeight.w400,
                          color: red,
                        ),
                      ))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  String checkValidation(String type, String value) {
    final RegExp integerPattern = RegExp(r'^\d+$');
    switch (type) {
      case "String":
        return RegExp(r'^[a-zA-Z0-9 ]*$').hasMatch(value)
            ? ""
            : "Enter a valid string";
      case "Number":
        return RegExp(r'^[0-9]+$').hasMatch(value)
            ? ""
            : "Enter a valid number";
      case "Password":
        return RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$')
                .hasMatch(value)
            ? ""
            : "Enter a valid password";
      case "Email":
        return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                .hasMatch(value)
            ? ""
            : "Enter a valid email";
      case "Url":
        return RegExp(
                    r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$')
                .hasMatch(value)
            ? ""
            : "Enter a valid url";
      case "None":
        return "";
      default:
        String source = "r'$type'";
        return integerPattern.hasMatch(type)
            ? value.length == int.tryParse(value)
                ? ""
                : "Enter data of length $type"
            : RegExp(source).hasMatch(value)
                ? ""
                : "Enter data of type: $type";
    }
  }
}
