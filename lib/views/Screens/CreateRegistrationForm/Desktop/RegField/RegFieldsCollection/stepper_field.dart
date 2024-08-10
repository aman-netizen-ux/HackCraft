import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class StepperField extends StatefulWidget {
  const StepperField({
    Key? key,
    required this.question,
    required this.create,
    required this.required,
    required this.error,
    required this.min,
    required this.max,
    this.initialAnswer = "",
    this.isDisabled = false,
    this.serialNumber,
    this.modelType,
    this.isRequiredData,
    this.requiredType,
  }) : super(key: key);

  final String question, error;
  final bool create;
  final bool required;
  final int min, max;
  final String initialAnswer;
  final bool isDisabled;
  final int? serialNumber;
  final String? modelType;
  final String? isRequiredData;
  final String? requiredType;
  @override
  State<StepperField> createState() => _StepperFieldState();
}

class _StepperFieldState extends State<StepperField> {
  late TextEditingController textController;
  String errorText = "";
  @override
  void initState() {
    super.initState();

    textController = TextEditingController();
    // Set initial text for the controller

    if (widget.initialAnswer.isNotEmpty) {
      textController.text = widget.initialAnswer;
    } else {
      textController.text = 0.toString();
    }
  }

  @override
  void didUpdateWidget(covariant StepperField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialAnswer != oldWidget.initialAnswer) {
      setState(() {
        if (widget.initialAnswer.isNotEmpty) {
          textController.text = widget.initialAnswer;
        } else {
          textController.text = 0.toString();
        }
      });
    }
  }

  void onValueChange() {
    int currentInt = int.tryParse(textController.text) ?? 0;
    print("currentInt $currentInt");
    if (widget.required && textController.text.isEmpty) {
      print("im error");
      setState(() {
        errorText = widget.error;
      });
    } else {
      if ( widget.max < currentInt) {
        setState(() {
          errorText = "Enter a value between ${widget.min} to ${widget.max}";
          textController.text = widget.max.toString();
        });
      }else if (widget.min > currentInt ) {
        setState(() {
          errorText = "Enter a value between ${widget.min} to ${widget.max}";
          textController.text = widget.min.toString();
        });
      } else {
        setState(() {
          errorText = "";
        });
      }
      final getFormProvider =
          Provider.of<GetRegistrationFormProvider>(context, listen: false);
print("textController.text ${textController.text}");
      getFormProvider.updateDetails(textController.text,
          isRequiredData: widget.isRequiredData,
          requiredType: widget.requiredType,
          serialNumber: widget.serialNumber,
          modelType: widget.modelType);
    }
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.question,
                                style: GoogleFonts.getFont(
                                  fontFamily2,
                                  fontSize: heightScaler(context, 14),
                                  fontWeight: FontWeight.w500,
                                  color: black1,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 35,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: scaleWidth(context, 8)),
                                child: Container(
                                    height: scaleHeight(context, 55),
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 675,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: TextField(
                                              controller: textController,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                              scaleHeight(
                                                                  context, 25)),
                                                  border: InputBorder.none),
                                              style: GoogleFonts.firaSans(
                                                color: const Color(0xff000000),
                                                fontSize:
                                                    heightScaler(context, 14),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              enabled: !widget.create &&
                                                  !widget.isDisabled,
                                              onTapOutside: !widget.create
                                                  ? (PointerDownEvent e) {
                                                      onValueChange();
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                    }
                                                  : null,
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                            flex: 010,
                                            child: VerticalDivider(
                                              color: black1,
                                            )),
                                        Expanded(
                                          flex: 315,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 498,
                                                child: InkWell(
                                                    onTap: widget.create &&
                                                            !widget.isDisabled
                                                        ? null
                                                        : () {
                                                            setState(() {
                                                              int currentValue =
                                                                  int.tryParse(
                                                                          textController
                                                                              .text) ??
                                                                      0;
                                                              if (currentValue <
                                                                  widget.max) {
                                                                textController
                                                                        .text =
                                                                    (currentValue +
                                                                            1)
                                                                        .toString();
                                                              }
                                                            });

                                                            onValueChange();
                                                          },
                                                    child:
                                                        const Icon(Icons.add)),
                                              ),
                                              const Expanded(
                                                  flex: 004,
                                                  child: Divider(
                                                    color: black1,
                                                  )),
                                              Expanded(
                                                flex: 498,
                                                child: InkWell(
                                                    onTap: widget.create &&
                                                            !widget.isDisabled
                                                        ? null
                                                        : () {
                                                            setState(() {
                                                              int currentValue =
                                                                  int.tryParse(
                                                                          textController
                                                                              .text) ??
                                                                      0;
                                                              if (currentValue >
                                                                  widget.min) {
                                                                textController
                                                                        .text =
                                                                    (currentValue -
                                                                            1)
                                                                        .toString();
                                                              }
                                                            });

                                                            onValueChange();
                                                          },
                                                    child: const Icon(
                                                        Icons.remove)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ))),
                          )
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
                          color: widget.required
                              ? midnigthBlue
                              : Colors.transparent,
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
          )),
    );
  }
}
