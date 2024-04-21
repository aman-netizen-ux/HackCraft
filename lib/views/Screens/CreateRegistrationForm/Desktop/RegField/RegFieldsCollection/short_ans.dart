import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class ShortAnsField extends StatefulWidget {
  const ShortAnsField(
      {super.key,
      required this.question,
      required this.create,
      required this.hint});
  final String question;
  final String hint;
  final bool create;
  @override
  State<ShortAnsField> createState() => _ShortAnsFieldState();
}

class _ShortAnsFieldState extends State<ShortAnsField> {
  late TextEditingController questionController;
  late TextEditingController hintController;
  @override
  void initState() {
    super.initState();
    questionController = TextEditingController(text: widget.question);
    hintController = TextEditingController(text: widget.hint);
  }

  @override
  void dispose() {
    hintController.dispose();
    questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaleHeight(context, 70),
      width: scaleWidth(context, 400),
      child: Column(
        children: [
          Expanded(
            flex: 40,
            child: SizedBox(
              child: TextField(
                controller: questionController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                enabled: !widget.create,
              ),
            ),
          ),
          Expanded(
            flex: 60,
            child: Container(
              padding: EdgeInsets.only(top: scaleHeight(context, 15)),
              child: TextField(
                
                style: GoogleFonts.firaSans(
                  fontSize: heightScaler(context, 14),
                  fontWeight: FontWeight.w500,
                  color: concreteGrey,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: widthScaler(context, 10),
                  ),
                  hintStyle: GoogleFonts.firaSans(
                    fontSize: heightScaler(context, 16),
                    fontWeight: FontWeight.w400,
                    color: concreteGrey,
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
                enabled: widget.create,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
