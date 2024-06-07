import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class LongAnsField extends StatefulWidget {
  const LongAnsField(
      {super.key,
      required this.question,
      required this.create,
      required this.hint,
      required this.required,
      required this.error,
      required this.limit,
       this.initialAnswer = "",
    this.isDisabled = false,
    this.serialNumber,
    this.modelType,
    this.isRequiredData,
    this.requiredType, this.validation,
      });
  final String question;
  final String hint , error;
  final bool required;
  final bool create;
  final int limit;
    final String initialAnswer;
  final bool isDisabled;
  final int? serialNumber;
  final String? modelType;
  final String? isRequiredData;
  final String? requiredType;
  final String? validation;
 
  @override
  State<LongAnsField> createState() => _LongAnsFieldState();
}

class _LongAnsFieldState extends State<LongAnsField> {
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
  void didUpdateWidget(covariant LongAnsField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialAnswer != oldWidget.initialAnswer) {
      setState(() {
        textController.text = widget.initialAnswer;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
     print('long answer ${widget.initialAnswer} ');
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
                    fontSize: scaleHeight(context, 14),
                    fontWeight: FontWeight.w500,
                    color: !widget.create && !widget.isDisabled && errorText.isNotEmpty?red: black1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        FormBuilderTextField(
                          name: "long_ans",
                          style: GoogleFonts.firaSans(
                            fontSize: scaleHeight(context, 14),
                            fontWeight: FontWeight.w400,
                            color: black1,
                          ),
                          controller: textController,
                          maxLength: widget.limit,
                          maxLines: 7,
                          
                           cursorColor: darkCharcoal,
                          decoration: InputDecoration(
                            counter: const Text(""),
                            contentPadding:
                                EdgeInsets.all(scaleHeight(context, 20)),
                            hintStyle: GoogleFonts.firaSans(
                              fontSize: scaleHeight(context, 16),
                              fontWeight: FontWeight.w400,
                              color: concreteGrey,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: black1,
                                width: 0.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide:  BorderSide(
                                color:  !widget.create && !widget.isDisabled && errorText.isNotEmpty? red:black1,
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide:  BorderSide(
                                color:  !widget.create && !widget.isDisabled && errorText.isNotEmpty?red:black1,
                                width: 1,
                              ),
                            ),
                            hintTextDirection: TextDirection.ltr,
                            hintText: widget.hint,
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: red,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: black1,
                                width: 1,
                              ),
                            ),
                          ),
                          enabled: !widget.create &&!widget.isDisabled,
                           onTapOutside: !widget.create
                            ? (PointerDownEvent e) {
                               if (widget.required &&
                                    textController.text.isEmpty) {
                                  setState(() {
                                    errorText = widget.error;
                                  });
                                }else if(textController.text.length> widget.limit){

                                   setState(() {
                                    errorText = "Limit is exceeded";
                                  });

                                }else {
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
                            }:null
                        ),
                        Positioned(
                            bottom: scaleHeight(context, 0),
                            right: scaleWidth(context, 9),
                            child: Column(
                              children: [
                                Text(
                                  widget.create || textController.text.isEmpty
                                      ? "Limit ${widget.limit} characters"
                                      : "${textController.text.length}/${widget.limit}",
                                  style: GoogleFonts.getFont(
                                    fontFamily2,
                                    fontSize: scaleHeight(context, 11),
                                    color: !widget.create && !widget.isDisabled && errorText.isNotEmpty?red: const Color(0xff646262),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                 !widget.create && !widget.isDisabled && errorText.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: scaleHeight(context, 22)),
                      child: Text(
                        errorText,
                        style: GoogleFonts.firaSans(
                          fontSize: scaleHeight(context, 12),
                          fontWeight: FontWeight.w400,
                          color: red,
                        ),
                      ))
                  : SizedBox(height: scaleHeight(context, 37)),
                              ],
                            ))
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
