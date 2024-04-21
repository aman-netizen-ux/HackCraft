import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class LongAnsField extends StatefulWidget {
  const LongAnsField(
      {super.key,
      required this.question,
      required this.create,
      required this.hint});
  final String question;
  final String hint;
  final bool create;
  @override
  State<LongAnsField> createState() => _LongAnsFieldState();
}

class _LongAnsFieldState extends State<LongAnsField> {
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
      height: 200, 
      width: 400,  
      child: TextField(
        controller: questionController,
        maxLines: null, // Allow unlimited number of lines
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: black1,
              width: 1,
            ),
          ),
        ),
        enabled: widget.create,
        style: GoogleFonts.firaSans(
          fontSize: 16, // Adjust font size as needed
          fontWeight: FontWeight.w400,
          color: concreteGrey,
        ),
      ),
    );
    // return Container(
    //   color: Colors.brown.shade100,
    //   height: scaleHeight(context, 250),
    //   width: scaleWidth(context, 400),
    //   child: Column(
    //     children: [
    //       TextField(
    //         controller: questionController,
    //         decoration: const InputDecoration(
    //           border: InputBorder.none,
    //         ),
    //         enabled: !widget.create,
    //       ),
    //       Container(
    //         height: scaleHeight(context, 190), 
    //         width: scaleWidth(context, 400),  
    //         color: Colors.amber.shade300,
    //         padding: EdgeInsets.only(top: scaleHeight(context, 15)),
    //         child: TextField(
    //           style: GoogleFonts.firaSans(
    //             fontSize: heightScaler(context, 14),
    //             fontWeight: FontWeight.w500,
    //             color: concreteGrey,
    //           ),
    //           decoration: InputDecoration(
    //             contentPadding: EdgeInsets.symmetric(
    //               horizontal: widthScaler(context, 10),
    //             ),
    //             hintStyle: GoogleFonts.firaSans(
    //               fontSize: heightScaler(context, 16),
    //               fontWeight: FontWeight.w400,
    //               color: concreteGrey,
    //             ),
    //             hintText: widget.hint,
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(2),
    //               borderSide: const BorderSide(
    //                 color: black1,
    //                 width: 1,
    //               ),
    //             ),
    //           ),
    //           enabled: widget.create,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
