import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class ShortAnsField extends StatefulWidget {
  const ShortAnsField(
      {super.key,
      required this.question,
      required this.create,
      required this.hint,
      required this.required,
      required this.error});
  final String question;
  final String hint, error;
  final bool create;
  final bool required;
  @override
  State<ShortAnsField> createState() => _ShortAnsFieldState();
}

class _ShortAnsFieldState extends State<ShortAnsField> {
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
                  style: GoogleFonts.getFont(
                    fontFamily2,
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
                    child: SizedBox(
                      height: scaleHeight(context, 37),
                      child: FormBuilderTextField(
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
                        enabled: !widget.create,
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
            ],
          ),
        ),
      ),
    );
  }
}
