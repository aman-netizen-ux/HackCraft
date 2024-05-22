import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class LongAnsField extends StatefulWidget {
  const LongAnsField(
      {super.key,
      required this.question,
      required this.create,
      required this.hint,
      required this.required,
      required this.error,
      required this.limit});
  final String question;
  final String hint , error;
  final bool required;
  final bool create;
  final int limit;
  @override
  State<LongAnsField> createState() => _LongAnsFieldState();
}

class _LongAnsFieldState extends State<LongAnsField> {
  late TextEditingController hintController;
  late TextEditingController answerController;
  @override
  void initState() {
    super.initState();
    answerController = TextEditingController();
    hintController = TextEditingController(text: widget.hint);
  }

  @override
  void dispose() {
    hintController.dispose();
    answerController.dispose();
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
                    color: black1,
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
                          controller: answerController,
                          maxLength: widget.limit,
                          maxLines: 7,
                          onChanged: (value) {
                            setState(() {});
                          },
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
                              borderSide: const BorderSide(
                                color: black1,
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: black1,
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
                          enabled: !widget.create,
                        ),
                        Positioned(
                            bottom: scaleHeight(context, 35),
                            right: scaleWidth(context, 9),
                            child: Text(
                              widget.create || answerController.text.isEmpty
                                  ? "Limit ${widget.limit} characters"
                                  : "${answerController.text.length}/${widget.limit}",
                              style: GoogleFonts.getFont(
                                fontFamily2,
                                fontSize: scaleHeight(context, 11),
                                color: const Color(0xff646262),
                                fontWeight: FontWeight.w300,
                              ),
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
