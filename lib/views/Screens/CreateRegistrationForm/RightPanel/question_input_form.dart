import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/leftStepper.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/rightStepper.dart';
import 'package:provider/provider.dart';

class QuestionInputForm extends StatefulWidget {
  const QuestionInputForm({super.key});

  @override
  State<QuestionInputForm> createState() => _QuestionInputFormState();
}

class _QuestionInputFormState extends State<QuestionInputForm> {
  // init state of quetsion field
  // questionController.text=  createRegistrationProvider.currentIndex ==-1 ?" " : createRegistrationProvider
  // .tabField[createRegistrationProvider.currentKey]![
  //     createRegistrationProvider.currentIndex]
  // .question;

  // for drop don
  // setstate mei dropdownva

  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _hintController = TextEditingController();
  final TextEditingController _errorController = TextEditingController();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  String? selectedValidator;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: false);
    dynamic currentField = createRegistrationProvider.tabField[
        createRegistrationProvider
            .currentKey]![createRegistrationProvider.currentIndex];
    FieldTypes typeOfField = createRegistrationProvider
        .tabField[createRegistrationProvider.currentKey]![
            createRegistrationProvider.currentIndex]
        .type;
        final RegExp integerPattern = RegExp(r'^\d+$'); 
        bool isValidationLength = typeOfField== FieldTypes.shortAnswer ? integerPattern.hasMatch(currentField.validation) :false;
    _questionController.text = createRegistrationProvider.currentIndex == -1
        ? " "
        : createRegistrationProvider
            .tabField[createRegistrationProvider.currentKey]![
                createRegistrationProvider.currentIndex]
            .label;
    _hintController.text = createRegistrationProvider.currentIndex == -1
        ? " "
        : typeOfField == FieldTypes.shortAnswer ||
                typeOfField == FieldTypes.longAnswer ||
                typeOfField == FieldTypes.file
            ? createRegistrationProvider
                .tabField[createRegistrationProvider.currentKey]![
                    createRegistrationProvider.currentIndex]
                .hint
            : "";

    _errorController.text = createRegistrationProvider.currentIndex == -1
        ? " "
        : createRegistrationProvider
            .tabField[createRegistrationProvider.currentKey]![
                createRegistrationProvider.currentIndex]
            .errorText;
    selectedValidator = createRegistrationProvider.currentIndex == -1
        ? " "
        : typeOfField == FieldTypes.shortAnswer ||
                typeOfField == FieldTypes.phoneNumber
            ? ["String" ,"Password" ,"Number" ,"URL" ,"Email"  ].contains(currentField.validation)
            ?currentField.validation
            : isValidationLength
            ? "Length"
            :"RegExp"
            : typeOfField == FieldTypes.longAnswer
                ? "Length"
                : "String";
    _startController.text = createRegistrationProvider.currentIndex == -1
        ? " "
        : typeOfField == FieldTypes.linear ||
                typeOfField == FieldTypes.range ||
                typeOfField == FieldTypes.slider
            ? currentField.labels.keys.first
            : " ";
    _endController.text = createRegistrationProvider.currentIndex == -1
        ? " "
        : typeOfField == FieldTypes.linear ||
                typeOfField == FieldTypes.range ||
                typeOfField == FieldTypes.slider
            ? currentField.labels.keys.last
            : " ";
  }

  @override
  Widget build(BuildContext context) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: true);
    Provider.of<CreateRegistrationProvider>(context, listen: false);
    dynamic currentField = createRegistrationProvider.tabField[
        createRegistrationProvider
            .currentKey]![createRegistrationProvider.currentIndex];
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
                  controller: _questionController,
                  cursorColor: black1.withOpacity(0.6),
                  style: GoogleFonts.firaSans(
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal.withOpacity(0.6),
                    fontSize: scaleHeight(context, 14),
                  ),
                  onChanged: (value) {
                    createRegistrationProvider
                        .tabField[createRegistrationProvider.currentKey]![
                            createRegistrationProvider.currentIndex]
                        .label = value;

                    createRegistrationProvider.notify();
                    print(
                        " tab fiell ${createRegistrationProvider.tabField[createRegistrationProvider.currentKey]![createRegistrationProvider.currentIndex].label}");
                  },
                  // focusNode: _questionFocusNode,
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
          Visibility(
            visible: [
              FieldTypes.shortAnswer,
              FieldTypes.longAnswer,
              FieldTypes.file,
            ].contains(createRegistrationProvider
                .tabField[createRegistrationProvider.currentKey]![
                    createRegistrationProvider.currentIndex]
                .type),
            child: Container(
              margin: EdgeInsets.only(
                top: scaleHeight(context, 8),
                left: scaleWidth(context, 14),
                right: scaleWidth(context, 16),
              ),
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
                      cursorColor: black1.withOpacity(0.6),
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w500,
                        color: darkCharcoal.withOpacity(0.6),
                        fontSize: scaleHeight(context, 14),
                      ),
                      controller: _hintController,
                      onChanged: (value) {
                        createRegistrationProvider
                            .tabField[createRegistrationProvider.currentKey]![
                                createRegistrationProvider.currentIndex]
                            .hint = value;

                        createRegistrationProvider.notify();
                        print(
                            " tab fiell ${createRegistrationProvider.tabField[createRegistrationProvider.currentKey]![createRegistrationProvider.currentIndex].hint}");
                      },
                      // focusNode: _hintFocusNode,
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
                    ),
                  ),
                ],
              ),
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
                  cursorColor: black1.withOpacity(0.6),
                  style: GoogleFonts.firaSans(
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal.withOpacity(0.6),
                    fontSize: scaleHeight(context, 14),
                  ),
                  controller: _errorController,
                  onChanged: (value) {
                    createRegistrationProvider
                        .tabField[createRegistrationProvider.currentKey]![
                            createRegistrationProvider.currentIndex]
                        .errorText = value;

                    createRegistrationProvider.notify();
                    print(
                        " tab fiell ${createRegistrationProvider.tabField[createRegistrationProvider.currentKey]![createRegistrationProvider.currentIndex].errorText}");
                  },
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
          Visibility(
            visible: [
              FieldTypes.linear,
              FieldTypes.range,
              FieldTypes.slider,
              FieldTypes.stepper,
              FieldTypes.date
            ].contains(createRegistrationProvider
                .tabField[createRegistrationProvider.currentKey]![
                    createRegistrationProvider.currentIndex]
                .type),
            child: Column(
              children: [
                const Row(
                  children: [LeftStepper(), RightStepper()],
                ),
                Visibility(
                  visible: [
                    FieldTypes.linear,
                    FieldTypes.range,
                    FieldTypes.slider,
                  ].contains(createRegistrationProvider
                      .tabField[createRegistrationProvider.currentKey]![
                          createRegistrationProvider.currentIndex]
                      .type),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: scaleWidth(context, 18),
                              ),
                              child: Text(
                                "Start Text",
                                style: GoogleFonts.getFont(
                                  fontFamily2,
                                  fontWeight: FontWeight.w500,
                                  color: darkCharcoal.withOpacity(0.6),
                                  fontSize: scaleHeight(context, 14),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: scaleHeight(context, 7),
                                left: scaleWidth(context, 18),
                                right: scaleWidth(context, 4),
                                bottom: scaleHeight(context, 13),
                              ),
                              height: scaleHeight(context, 55),
                              child: TextFormField(
                                controller: _startController,
                                onChanged: (value) {
                                  if (value.length == 1) {}
                                  int endValue = currentField
                                      .labels[currentField.labels.keys.first];
                                  print("end valueeeee ${endValue}");
                                  currentField.labels
                                      .remove(currentField.labels.keys.first);
                                  if (value.length == 0) {
                                    value = " ";
                                    _startController.text = " ";
                                  }
                                  currentField.labels[value] = endValue;
                                  List<MapEntry<String, int>> entries =
                                      currentField.labels.entries.toList();
                                  entries.sort(
                                      (a, b) => a.value.compareTo(b.value));
                                  currentField.labels =
                                      Map.fromEntries(entries);
                                  print(
                                      "end value after change ${currentField.labels[value]}");
                                  print(currentField.labels.keys.first);
                                  createRegistrationProvider.notify();
                                },
                                cursorColor: black1.withOpacity(0.4),
                                style: GoogleFonts.firaSans(
                                  fontWeight: FontWeight.w500,
                                  color: darkCharcoal.withOpacity(0.4),
                                  fontSize: scaleHeight(context, 14),
                                ),
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
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: scaleWidth(context, 5)),
                              child: Text(
                                "End Text",
                                style: GoogleFonts.getFont(
                                  fontFamily2,
                                  fontWeight: FontWeight.w500,
                                  color: darkCharcoal.withOpacity(0.6),
                                  fontSize: scaleHeight(context, 14),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: scaleHeight(context, 7),
                                left: scaleWidth(context, 4),
                                right: scaleWidth(context, 18),
                                bottom: scaleHeight(context, 13),
                              ),
                              height: scaleHeight(context, 55),
                              child: TextFormField(
                                controller: _endController,
                                cursorColor: black1.withOpacity(0.4),
                                style: GoogleFonts.firaSans(
                                  fontWeight: FontWeight.w500,
                                  color: darkCharcoal.withOpacity(0.4),
                                  fontSize: scaleHeight(context, 14),
                                ),
                                onChanged: (value) {
                                  int endValue = currentField
                                      .labels[currentField.labels.keys.last];
                                  print("end valueeeee ${endValue}");
                                  currentField.labels
                                      .remove(currentField.labels.keys.last);
                                  if (value.length == 0) {
                                    value = "  ";
                                    _endController.text = "  ";
                                  }
                                  currentField.labels[value] = endValue;
                                  print(
                                      "end value after change ${currentField.labels[value]}");
                                  print(currentField.labels.keys.last);
                                  createRegistrationProvider.notify();
                                  // print(
                                  //     "enddd not ${currentField.labels.keys.last}");
                                  // currentField.labels.keys.last = value;

                                  // createRegistrationProvider.notify();
                                  // print(
                                  //     "enddd up ${currentField.labels.keys.last}");
                                },
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: scaleHeight(context, 7),
          ),
          Visibility(
            visible: [
              FieldTypes.shortAnswer,
              FieldTypes.phoneNumber,
              FieldTypes.longAnswer
            ].contains(createRegistrationProvider
                .tabField[createRegistrationProvider.currentKey]![
                    createRegistrationProvider.currentIndex]
                .type),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: scaleWidth(context, 14)),
              decoration: BoxDecoration(
                color: const Color(0xffACA8A8).withOpacity(0.4),
                border: Border.all(color: greyish3, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  value: selectedValidator,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValidator = newValue;
                      if (selectedValidator == 'RegExp') {
                        // currentField.validation = _controller.text;
                        // createRegistrationProvider.notify();
                        // print("regexxxx ${currentField.validation}");
                      } else {
                        currentField.validation = selectedValidator;
                        createRegistrationProvider.notify();
                      }
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(scaleWidth(context, 12)),
                    border: InputBorder.none,
                  ),
                  hint: const Text('Validator'),
                  elevation: 0,
                  items: createRegistrationProvider
                              .tabField[createRegistrationProvider.currentKey]![
                                  createRegistrationProvider.currentIndex]
                              .type ==
                          FieldTypes.phoneNumber
                      ? const [
                          DropdownMenuItem<String>(
                            value: 'PhoneNumber',
                            child: Text('Phone Number'),
                          ),
                        ]
                      : createRegistrationProvider
                                  .tabField[
                                      createRegistrationProvider.currentKey]![
                                      createRegistrationProvider.currentIndex]
                                  .type ==
                              FieldTypes.longAnswer
                          ? const [
                              DropdownMenuItem<String>(
                                value: 'Length',
                                child: Text('Length'),
                              ),
                            ]
                          : const [
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
                              DropdownMenuItem<String>(
                                value: null,
                                child: Text('None'),
                              ),
                            ],
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                ),
              ),
            ),
          ),
          Visibility(
            visible:
                selectedValidator == "RegExp" || selectedValidator == "Length",
            child: Container(
              margin: EdgeInsets.only(
                top: scaleHeight(context, 7),
                left: scaleWidth(context, 14),
                right: scaleWidth(context, 16),
                bottom: scaleHeight(context, 13),
              ),
              height: scaleHeight(context, 55),
              child: TextFormField(
                controller: _controller,
                onChanged: (value) {
                  if (selectedValidator == "RegExp" || selectedValidator=="Length") {
                    currentField.validation = _controller.text;
                    createRegistrationProvider.notify();
                    print("regexxxx ${currentField.validation}");
                  }
                },
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
                  hintText: 'Type your $selectedValidator',
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
          ),
        ],
      ),
    );
  }
}
