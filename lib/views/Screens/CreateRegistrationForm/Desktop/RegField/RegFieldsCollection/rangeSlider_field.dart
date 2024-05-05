import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class RangeSliderField extends StatefulWidget {
  final String question, startLabel, endLabel;
  final bool create, required;
  final int min;
  final int max;

  const RangeSliderField({
    Key? key,
    required this.create,
    required this.startLabel,
    required this.endLabel,
    required this.required,
    required this.max,
    required this.min,
    required this.question,
  }) : super(key: key);

  @override
  State<RangeSliderField> createState() => _RangeSliderFieldState();
}

class _RangeSliderFieldState extends State<RangeSliderField> {
  double _startValue = 20;
  double _endValue = 50;

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
                            child: RangeSlider(

                              values: RangeValues(_startValue, _endValue),
                              min: widget.min.toDouble(),
                              max: widget.max.toDouble(),
                              onChanged: !widget.create
                                  ? (RangeValues values) {
                                      setState(() {
                                        _startValue = values.start;
                                        _endValue = values.end;
                                      });
                                    }
                                  : (RangeValues values){},
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
                      vertical: scaleHeight(context, 18)
                    ),
                   
                    decoration: BoxDecoration(
                      color: indicatorblue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                        style: GoogleFonts.getFont(fontFamily2,
                            fontWeight: FontWeight.w500,
                            fontSize: scaleHeight(context, 18),
                            color: white),
                        ' ${_startValue.toInt()} - ${_endValue.toInt()}'),
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
