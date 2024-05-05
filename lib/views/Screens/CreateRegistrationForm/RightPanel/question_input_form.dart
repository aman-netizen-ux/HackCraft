import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class QuestionInputForm extends StatefulWidget {
  const QuestionInputForm({super.key});

  @override
  State<QuestionInputForm> createState() => _QuestionInputFormState();
}

class _QuestionInputFormState extends State<QuestionInputForm> {
  @override
  Widget build(BuildContext context) {
    String? _selectedValidator;
    int? _selectedMin;
    int? _selectedMax;
    return Container(
      margin: EdgeInsets.only(
          top: scaleHeight(context, 14),
          left: scaleWidth(context, 13),
          right: scaleWidth(context, 13)),
      color: const Color(0xffeaeaea),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: scaleHeight(context, 10),
                left: scaleWidth(context, 14),
                right: scaleWidth(context, 16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Question",
                  style: GoogleFonts.firaSans(
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal.withOpacity(0.6),
                    fontSize: scaleHeight(context, 14),
                  ),
                ),
                SizedBox(
                  height: scaleHeight(context, 7),
                ),
                SizedBox(
                    child: TextField(
                  cursorColor: black1,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: black1,
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: black1,
                        width: 1,
                      ),
                    ),
                  ),
                  maxLines: 4,
                )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: scaleHeight(context, 8),
                left: scaleWidth(context, 14),
                right: scaleWidth(context, 16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hint",
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal.withOpacity(0.6),
                    fontSize: scaleHeight(context, 14),
                  ),
                ),
                SizedBox(
                  height: scaleHeight(context, 7),
                ),
                SizedBox(
                    child: TextField(
                  cursorColor: black1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: black1,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: black1,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                  ),
                  maxLines: 3,
                )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: scaleHeight(context, 12),
                left: scaleWidth(context, 14),
                right: scaleWidth(context, 16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Error Text",
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal.withOpacity(0.6),
                    fontSize: scaleHeight(context, 14),
                  ),
                ),
                SizedBox(
                  height: scaleHeight(context, 7),
                ),
                SizedBox(
                    child: TextField(
                  cursorColor: black1,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: black1,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: black1,
                        width: 1,
                      ),
                    ),
                  ),
                  maxLines: 3,
                )),
              ],
            ),
          ),
          SizedBox(
            height: scaleHeight(context, 12),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: scaleWidth(context, 14),
                      right: scaleWidth(context, 9)),
                  decoration: BoxDecoration(
                      color: const Color(0xffACA8A8).withOpacity(0.4),
                      border: Border.all(color: greyish3, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<int>(
                      value: _selectedMin,
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedMin = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.all(scaleWidth(context, 12)),
                          border: InputBorder.none),
                      hint: const Text('Min Value'),
                      elevation: 0,
                      items: const [
                        DropdownMenuItem<int>(
                          value: 0,
                          child: Text('0'),
                        ),
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text('1'),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text('2'),
                        ),
                        DropdownMenuItem<int>(
                          value: 3,
                          child: Text('3'),
                        ),
                        DropdownMenuItem<int>(
                          value: 4,
                          child: Text('4'),
                        ),
                        DropdownMenuItem<int>(
                          value: 5,
                          child: Text('5'),
                        ),
                      ],
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: scaleWidth(context, 14)),
                  decoration: BoxDecoration(
                      color: const Color(0xffACA8A8).withOpacity(0.4),
                      border: Border.all(color: greyish3, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<int>(
                      value: _selectedMax,
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedMax = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.all(scaleWidth(context, 12)),
                          border: InputBorder.none),
                      hint: const Text('Max Value'),
                      elevation: 0,
                      items: const [
                        DropdownMenuItem<int>(
                          value: 0,
                          child: Text('0'),
                        ),
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text('1'),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text('2'),
                        ),
                        DropdownMenuItem<int>(
                          value: 3,
                          child: Text('3'),
                        ),
                        DropdownMenuItem<int>(
                          value: 4,
                          child: Text('4'),
                        ),
                        DropdownMenuItem<int>(
                          value: 5,
                          child: Text('5'),
                        ),
                      ],
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: scaleHeight(context, 7),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: scaleWidth(context, 14)),
            // height: 40,
            decoration: BoxDecoration(
                color: const Color(0xffACA8A8).withOpacity(0.4),
                border: Border.all(color: greyish3, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                value: _selectedValidator,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValidator = newValue;
                  });
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(scaleWidth(context, 12)),
                    border: InputBorder.none),
                hint: const Text('Validator'),
                elevation: 0,
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Number',
                    child: Text('Number'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'String',
                    child: Text('String'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Password',
                    child: Text('Password'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Email',
                    child: Text('Email'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'URL',
                    child: Text('URL'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'RegExp',
                    child: Text('RegExp'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Length',
                    child: Text('Length'),
                  ),
                ],
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: scaleHeight(context, 7),
                left: scaleWidth(context, 14),
                right: scaleWidth(context, 16),
                bottom: scaleHeight(context, 13)),
            height: scaleHeight(context, 55),
            child: TextFormField(
              style: GoogleFonts.getFont(
                fontFamily2,
                fontSize: scaleHeight(context, 14),
                fontWeight: FontWeight.w500,
                color: concreteGrey,
              ),
              cursorColor: darkCharcoal,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(context, 20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: black1,
                    width: 1,
                  ),
                ),
                hintText: 'Type your regex / length',
                labelStyle: GoogleFonts.getFont(
                  fontFamily2,
                  fontSize: scaleHeight(context, 16),
                  fontWeight: FontWeight.w400,
                  color: concreteGrey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: black1,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
