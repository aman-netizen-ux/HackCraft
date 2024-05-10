import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/Registration/registration_form_model.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/header.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/option_expansion_tile.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/question_input_form.dart';
import 'package:provider/provider.dart';

class RigthPanel extends StatefulWidget {
  const RigthPanel({super.key});

  @override
  State<RigthPanel> createState() => _RigthPanelState();
}

class _RigthPanelState extends State<RigthPanel> {
  bool isExpanded = false;
  TextEditingController ansController = TextEditingController();
  List<String> options = [];
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: false);

    FieldTypes typeOfField = createRegistrationProvider.currentIndex == -1
        ? FieldTypes
            .shortAnswer // short answer is set as default in case of -1 for type field
        : createRegistrationProvider
            .tabField[createRegistrationProvider.currentKey]![
                createRegistrationProvider.currentIndex]
            .type;
    if (createRegistrationProvider.currentIndex == -1) {
      options = ["options"];
    } else if (typeOfField == FieldTypes.radio ||
        typeOfField == FieldTypes.tag ||
        typeOfField == FieldTypes.checkbox ||
        typeOfField == FieldTypes.dropdown ||
        typeOfField == FieldTypes.yesNo) {
      dynamic currentField = createRegistrationProvider.tabField[
          createRegistrationProvider
              .currentKey]![createRegistrationProvider.currentIndex];
      List<RegistrationOption> registrationOptions =
          currentField.options.cast<RegistrationOption>();

      List<String> textList =
          registrationOptions.map((option) => option.text).toList();
      options = textList;
    } else {
      options = ["options"];
    }

    print("optionsnuh u $options");

    // print(
    //     "options ${createRegistrationProvider.tabField[createRegistrationProvider.currentKey]![createRegistrationProvider.currentIndex].options.first.text}");
  }

  @override
  Widget build(BuildContext context) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: true);

    return createRegistrationProvider.currentIndex == -1
        ? Container(
            color: lightGrey,
          )
        : Container(
            color: lightGrey,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Header(),
                  const QuestionInputForm(),
                  Visibility(
                    visible: [
                      FieldTypes.radio,
                      FieldTypes.checkbox,
                      FieldTypes.dropdown,
                      FieldTypes.tag,
                    ].contains(createRegistrationProvider
                        .tabField[createRegistrationProvider.currentKey]![
                            createRegistrationProvider.currentIndex]
                        .type),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: scaleHeight(context, 14),
                          left: scaleWidth(context, 13),
                          right: scaleWidth(context, 13)),
                      color: const Color(0xffeaeaea),
                      // height: 350,
                      child: Column(
                        children: [
                          SizedBox(
                            height: scaleHeight(context, 10),
                          ),
                          for (int i = 0; i < options.length; i++)
                            OptionExpansionTile(
                              title: options[i],
                              index: i,
                              expandedTitle: "Option ${i + 1}",
                            ),
                          createRegistrationProvider
                                      .tabField[createRegistrationProvider
                                              .currentKey]![
                                          createRegistrationProvider
                                              .currentIndex]
                                      .type ==
                                  FieldTypes.yesNo
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    // setState(() {

                                    // });
                                  
                                    options.add("Option ${options.length}");
                                    createRegistrationProvider.notify();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        vertical: scaleHeight(context, 20),
                                        horizontal: scaleWidth(context, 15)),
                                    height: scaleHeight(context, 41),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffBFBEBE),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text("Add Option",
                                        style: GoogleFonts.getFont(fontFamily1,
                                            color: darkCharcoal,
                                            fontSize: scaleHeight(context, 12),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
