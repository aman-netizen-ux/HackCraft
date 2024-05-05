import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
// TODO:if possible improve the properties of Toggle  
class ToogleYNField extends StatefulWidget {
  final bool binary;
  final bool create ;
  final String question;
  final bool required;

  const ToogleYNField(
      {Key? key,
      this.binary = true,
      required this.create,
      required this.required,
      required this.question})
      : super(key: key);

  @override
  State<ToogleYNField> createState() => _ToogleYNFieldState();
}

class _ToogleYNFieldState extends State<ToogleYNField> {
  bool _value = false;

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
                        flex: 85,
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
                        flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: FormBuilderSwitch(
                              name: 'toggle_switch',
                              
                              activeTrackColor: indicatorblue,
                              enabled: !widget.create,
                              activeColor: Colors.transparent,
                              initialValue: _value,
                              onChanged: widget.binary
                                  ? (bool? value) {
                                      setState(() {
                                        _value = value ?? false;
                                      });
                                    }
                                  : (bool? value) {
                                      if (value != null) {
                                        setState(() {
                                          _value = value;
                                        });
                                      }
                                    },
                              title: const Text("")),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: scaleWidth(context, 16),
                ),
                widget.required
                    ? Text(
                        "REQUIRED",
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize: 16,
                            color: midnigthBlue,
                            fontWeight: FontWeight.w500),
                      )
                    : Container(),
                SizedBox(
                  width: widget.create ? scaleWidth(context, 50) : 0,
                )
              ],
            ),
          )),
    );

   
  }
}
