import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class SliderField extends StatefulWidget {
  final double min;
  final double max;
  final bool create, required;
  final String question, startLabel, endLabel;
  const SliderField(
      {Key? key,
      required this.create,
      required this.max,
      required this.min,
      required this.startLabel,
      required this.endLabel,
      required this.required,
      required this.question})
      : super(key: key);

  @override
  State<SliderField> createState() => _SliderFieldState();
}

class _SliderFieldState extends State<SliderField> {
  double _value = 0.0;

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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: goldenYellow,
                                inactiveTrackColor: Color(0xffAFAFAF),
                                thumbColor: indicatorblue,
                                overlayColor: indicatorblue.withOpacity(0.2),
                                trackHeight: 3),
                            child: Slider(
                              onChanged: !widget.create
                                  ? (double values) {
                                      setState(() {
                                        _value = values;
                                      });
                                    }
                                  : (double values) {},
                              value: _value,
                              min: widget.min.toDouble(),
                              max: widget.max.toDouble(),
                            ),
                          ),
                          Positioned(
                            left: scaleWidth(context, 18),
                            bottom: 0 - 5,
                            child: Text(
                              widget.startLabel,
                              style: GoogleFonts.getFont(
                                fontFamily2,
                                fontSize: heightScaler(context, 14),
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffc4c4c4),
                              ),
                            ),
                          ),
                          Positioned(
                            right: scaleWidth(context, 18),
                            bottom: 0 - 5,
                            child: Text(
                              widget.endLabel,
                              style: GoogleFonts.getFont(
                                fontFamily2,
                                fontSize: heightScaler(context, 14),
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffc4c4c4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: scaleWidth(context, 24),
                        vertical: scaleHeight(context, 18)),
                    decoration: BoxDecoration(
                      color: indicatorblue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                        style: GoogleFonts.getFont(fontFamily2,
                            fontWeight: FontWeight.w500,
                            fontSize: scaleHeight(context, 18),
                            color: white),
                        '${_value.toInt()}'),
                  ),
                  SizedBox(
                    width: scaleWidth(context, 16),
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
