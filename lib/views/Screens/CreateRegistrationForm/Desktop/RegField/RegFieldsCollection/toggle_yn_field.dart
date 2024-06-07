import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

// TODO:if possible improve the properties of Toggle
class ToogleYNField extends StatefulWidget {
 final String initialAnswer;
  final bool isDisabled;
  final int? serialNumber;
  final String? modelType;
  final String? isRequiredData;
  final String? requiredType;
  final bool create;
  final String question, error;
  final bool required;

  const ToogleYNField(
      {Key? key,
      required this.create,
      required this.required,
      required this.error,
      this.initialAnswer = "",
    this.isDisabled = false,
    this.serialNumber,
    this.modelType,
    this.isRequiredData,
    this.requiredType,
      required this.question})
      : super(key: key);

  @override
  State<ToogleYNField> createState() => _ToogleYNFieldState();
}

class _ToogleYNFieldState extends State<ToogleYNField> {
  bool _value = false;

   String errorText = "";
  @override
  void initState() {
    super.initState();

   

    if (widget.initialAnswer.isNotEmpty) {
      _value = widget.initialAnswer=="true";
    }
  }

  @override
  void didUpdateWidget(covariant ToogleYNField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialAnswer != oldWidget.initialAnswer) {
      setState(() {
       _value = widget.initialAnswer=="true";
      });
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
                              enabled: !widget.create&& !widget.isDisabled,
                              activeColor: Colors.transparent,
                              initialValue: _value,
                              onChanged:  (bool? value) {
                                      setState(() {
                                        _value = !_value;
                                      });

                                      final getFormProvider =
                                      Provider.of<GetRegistrationFormProvider>(
                                          context,
                                          listen: false);

                                  getFormProvider.updateDetails(
                                      _value.toString(),
                                      isRequiredData: widget.isRequiredData,
                                      requiredType: widget.requiredType,
                                      serialNumber: widget.serialNumber,
                                      modelType:
                                          widget.modelType);
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
