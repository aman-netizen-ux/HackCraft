import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class StepperField extends StatefulWidget {
  const StepperField({
    Key? key,
    required this.question,
    required this.create,
    required this.required,
    required this.min,
    required this.max,
  }) : super(key: key);

  final String question;
  final bool create;
  final bool required;
  final int min, max;
  @override
  State<StepperField> createState() => _StepperFieldState();
}

class _StepperFieldState extends State<StepperField> {
  late TextEditingController stepper;

  void initState() {
    super.initState();
    stepper = TextEditingController(text: widget.min.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stepper.dispose();
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
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 65,
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
                      Expanded(
                        flex: 35,
                        child: Padding(
                            padding:
                                EdgeInsets.only(left: scaleWidth(context, 8)),
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
                                          controller: stepper,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: scaleHeight(
                                                          context, 25)),
                                              border: InputBorder.none),
                                          style: GoogleFonts.firaSans(
                                            color: const Color(0xff000000),
                                            fontSize: heightScaler(context, 14),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          enabled: !widget.create,
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
                                                onTap: widget.create
                                                    ? null
                                                    : () {
                                                        setState(() {
                                                          int currentValue =
                                                              int.tryParse(stepper
                                                                      .text) ??
                                                                  0;
                                                          if (currentValue <=
                                                              widget.max) {
                                                            stepper.text =
                                                                (currentValue +
                                                                        1)
                                                                    .toString();
                                                          }
                                                        });
                                                      },
                                                child: const Icon(Icons.add)),
                                          ),
                                          const Expanded(
                                              flex: 004,
                                              child: Divider(
                                                color: black1,
                                              )),
                                          Expanded(
                                            flex: 498,
                                            child: InkWell(
                                                onTap: widget.create
                                                    ? null
                                                    : () {
                                                        setState(() {
                                                          int currentValue =
                                                              int.tryParse(stepper
                                                                      .text) ??
                                                                  0;
                                                          if (currentValue <=
                                                              widget.min) {
                                                            stepper.text =
                                                                (currentValue -
                                                                        1)
                                                                    .toString();
                                                          }
                                                        });
                                                      },
                                                child:
                                                    const Icon(Icons.remove)),
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
                        color:
                            widget.required ? midnigthBlue : Colors.transparent,
                        fontWeight: FontWeight.w500),
                  ),
                SizedBox(
                  width: widget.create ? scaleWidth(context, 50) : 0,
                )
              ],
            ),
          )),
    );
  }
}
