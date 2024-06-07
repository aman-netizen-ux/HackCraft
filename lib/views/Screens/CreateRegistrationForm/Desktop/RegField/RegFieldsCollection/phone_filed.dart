import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    Key? key,
    required this.question,
    required this.create,
    required this.required,
    this.initialAnswer = "",
    this.isDisabled = false,
    this.serialNumber,
    this.modelType,
    this.isRequiredData,
    this.requiredType,
  }) : super(key: key);

  final String question;
  final bool create;
  final bool required;
  final String initialAnswer;
  final bool isDisabled;
  final int? serialNumber;
  final String? modelType;
  final String? isRequiredData;
  final String? requiredType;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late TextEditingController _phoneController;
  String errorText = "";
  @override
  void initState() {
    super.initState();

    _phoneController = TextEditingController();
    // Set initial text for the controller

    if (widget.initialAnswer.trim().isNotEmpty) {
      _phoneController.text = widget.initialAnswer;
    }
  }

  @override
  void didUpdateWidget(covariant PhoneField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialAnswer != oldWidget.initialAnswer) {
      setState(() {
        if (widget.initialAnswer.trim().isNotEmpty) {
          _phoneController.text = widget.initialAnswer;
        }
      });
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('initial phone value ${widget.initialAnswer}');
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
                  bottom: scaleHeight(context, 10),
                ),
                child: Text(
                  widget.question,
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontSize: heightScaler(context, 14),
                    fontWeight: FontWeight.w500,
                    color: !widget.create && !widget.isDisabled && errorText.isNotEmpty?red:black1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: scaleWidth(context, 300),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: !widget.create && !widget.isDisabled && errorText.isNotEmpty?red:black1
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffE6E5E5),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                          ),
                          height: scaleHeight(context, 34),
                          width: scaleWidth(context, 60),
                          alignment: Alignment.center,
                          child: Text(
                            '+91',
                            style: TextStyle(
                              fontSize: scaleHeight(context, 14),
                              fontWeight: FontWeight.w400,
                              color: black1,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: scaleHeight(context, 34),
                            child: TextFormField(
                              controller: _phoneController,
                              style: GoogleFonts.firaSans(
                                fontSize: scaleHeight(context, 14),
                                fontWeight: FontWeight.w400,
                                color: black1,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: scaleWidth(context, 20),
                                    vertical: scaleHeight(context, 10)),
                                isDense: true,
                                hintText: 'Enter phone number',
                                hintStyle: GoogleFonts.firaSans(
                                  fontSize: scaleHeight(context, 14),
                                  fontWeight: FontWeight.w400,
                                  color: concreteGrey,
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                } else if (!RegExp(r'^[6-9][0-9]{9}$')
                                    .hasMatch(value)) {
                                  return 'Enter a valid phone number';
                                }
                                return null; // Return null if the input is valid
                              },
                              enabled: !widget.create && !widget.isDisabled,
                              onTapOutside: !widget.create
                                  ? (PointerDownEvent e) {
                                      if (_phoneController.text.isEmpty) {
                                        setState(() {
                                          errorText = 'This field is required';
                                        });
                                      } else if (!RegExp(r'^[6-9][0-9]{9}$')
                                          .hasMatch(_phoneController.text)) {
                                        setState(() {
                                          errorText =
                                              'Enter a valid phone number';
                                        });
                                      } else {
                                        setState(() {
                                          errorText="";
                                        });
                                        final getFormProvider = Provider.of<
                                                GetRegistrationFormProvider>(
                                            context,
                                            listen: false);

                                        getFormProvider.updateDetails(
                                            _phoneController.text,
                                            isRequiredData:
                                                widget.isRequiredData,
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
                      ],
                    ),
                  ),
                  const Spacer(),
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
}
