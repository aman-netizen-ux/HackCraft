import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
//TODO: add error
class LinearScaleField extends StatefulWidget {
  final double min;
  final double max;
  final int division;
  final bool create, required;
  final String question , error;
  final List<String> labels ;

  const LinearScaleField({
    Key? key,
    required this.create,
    required this.required,
    required this.labels,
    required this.division,
    required this.max,
    required this.min,
    required this.question,
    required this.error,
  }) : super(key: key);

  @override
  State<LinearScaleField> createState() => _LinearScaleFieldState();
}

class _LinearScaleFieldState extends State<LinearScaleField> {
  int indexValue = 2;

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
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: scaleHeight(context, 9)),
                                child: Divider(
                                  height: scaleHeight(context, 3),
                                  color:const Color(0xffAFAFAF),
                                ),
                              ),
                              
                              Positioned(
                                // left: 0,
                                // right: 0,
                              //  bottom: -2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:
                                      List.generate(widget.division, (index) {
                                    return indexValue == index
                                        ? Column(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: indicatorblue,
                                                    shape: BoxShape.circle),
                                                width: scaleHeight(context, 20),
                                                height: scaleHeight(context, 20),
                                              ),
                                              Text(
                                                widget.labels[index],
                                                style: GoogleFonts.getFont(
                                                  fontFamily2,
                                                  fontSize:
                                                      heightScaler(context, 14),
                                                  fontWeight: FontWeight.w500,
                                                  color: indexValue == index
                                                      ? indicatorblue
                                                      : const Color(0xffc4c4c4),
                                                ),
                                              )
                                            ],
                                          )
                                        : InkWell(
                                            onTap: widget.create
                                                ? null
                                                : () {
                                                    setState(() {
                                                      indexValue = index;
                                                    });
                                                  },
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: scaleHeight(context, 8),
                                                ),
                                                Container(
                                                  width: scaleWidth(context, 8),
                                                  height: scaleHeight(context, 3),
                                                  color:const Color(0xff6C6969),
                                                ),
                                                Text(
                                                  widget.labels[index],
                                                  style: GoogleFonts.getFont(
                                                    fontFamily2,
                                                    fontSize:
                                                        heightScaler(context, 14),
                                                    fontWeight: FontWeight.w500,
                                                    color: indexValue == index
                                                        ? indicatorblue
                                                        : const Color(0xffc4c4c4),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                  }),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                     
                    ),
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
