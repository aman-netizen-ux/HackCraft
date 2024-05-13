import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    Key? key,
    required this.question,
    required this.create,
    required this.required,
  }) : super(key: key);

  final String question;
  final bool create;
  final bool required;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
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
                  bottom: scaleHeight(context, 10),
                ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
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
                                enabled: !widget.create,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: scaleWidth(context, 100),
                    ),
                  ),
                  widget.required
                      ? Text(
                          "REQUIRED",
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 16),
                              color: midnigthBlue,
                              fontWeight: FontWeight.w500),
                        )
                      : Container(),
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
