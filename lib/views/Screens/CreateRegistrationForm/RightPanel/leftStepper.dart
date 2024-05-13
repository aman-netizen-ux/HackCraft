import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class LeftStepper extends StatefulWidget {
  const LeftStepper({super.key});

  @override
  State<LeftStepper> createState() => _LeftStepperState();
}

class _LeftStepperState extends State<LeftStepper> {
  final TextEditingController _leftstepper = TextEditingController();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
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
    _leftstepper.text = createRegistrationProvider.currentIndex == -1
        ? " "
        : typeOfField == FieldTypes.slider ||
                typeOfField == FieldTypes.range ||
                typeOfField == FieldTypes.linear
            ? currentField.labels[currentField.labels.keys.first].toString()
            : typeOfField == FieldTypes.stepper ||
                    typeOfField == FieldTypes.date
                ? currentField.min_value.toString()
                : "";
  }

  @override
  Widget build(BuildContext context) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: true);
    FieldTypes typeOfField = createRegistrationProvider
        .tabField[createRegistrationProvider.currentKey]![
            createRegistrationProvider.currentIndex]
        .type;
    dynamic currentField = createRegistrationProvider.tabField[
        createRegistrationProvider
            .currentKey]![createRegistrationProvider.currentIndex];

    return Expanded(
      child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 35,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: scaleWidth(context, 15),
                              right: scaleWidth(context, 4),
                              top: scaleHeight(context, 5),
                              bottom: scaleHeight(context, 10)),
                          child: Container(
                              height: scaleHeight(context, 55),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: concreteGrey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 315,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 498,
                                          child: InkWell(
                                              onTap: () {
                                                 setState(() {
                                                  int currentValue =
                                                      int.tryParse(_leftstepper
                                                              .text) ??
                                                          0;
                                                  _leftstepper.text =
                                                      (currentValue + 1)
                                                          .toString();
                                                });

                                                if (typeOfField ==
                                                        FieldTypes.slider ||
                                                    typeOfField ==
                                                        FieldTypes.range ||
                                                    typeOfField ==
                                                        FieldTypes.linear) {
                                                  currentField.labels[
                                                      currentField.labels.keys
                                                          .first] = int.tryParse(
                                                      _leftstepper.text);
                                                } else if (typeOfField ==
                                                    FieldTypes.stepper) {
                                                  currentField.min_value =
                                                      int.tryParse(
                                                          _leftstepper.text);
                                                }
                                                createRegistrationProvider
                                                    .notify();
                                              },
                                              child: const Icon(Icons.add)),
                                        ),
                                        const Expanded(
                                            flex: 004,
                                            child: Divider(
                                              color: concreteGrey,
                                            )),
                                        Expanded(
                                          flex: 498,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  int currentValue =
                                                      int.tryParse(_leftstepper
                                                              .text) ??
                                                          0;
                                                  if (currentValue > 0) {
                                                    _leftstepper.text =
                                                        (currentValue - 1)
                                                            .toString();

                                                    if (typeOfField ==
                                                            FieldTypes.slider ||
                                                        typeOfField ==
                                                            FieldTypes.range ||
                                                        typeOfField ==
                                                            FieldTypes.linear) {
                                                      currentField.labels[
                                                              currentField
                                                                  .labels
                                                                  .keys
                                                                  .first] =
                                                          int.tryParse(
                                                              _leftstepper
                                                                  .text);
                                                    } else if (typeOfField ==
                                                        FieldTypes.stepper) {
                                                      currentField.min_value =
                                                          int.tryParse(
                                                              _leftstepper
                                                                  .text);
                                                    }
                                                    createRegistrationProvider
                                                        .notify();
                                                  }
                                                });
                                               
                                              },
                                              child: const Icon(Icons.remove)),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                      flex: 010,
                                      child: VerticalDivider(
                                        color: concreteGrey,
                                      )),
                                  Expanded(
                                    flex: 675,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Min ",
                                            style: GoogleFonts.firaSans(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  darkCharcoal.withOpacity(0.6),
                                              fontSize:
                                                  scaleHeight(context, 14),
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                            // alignment: Alignment.center,
                                            child: TextField(
                                              controller: _leftstepper,
                                              onChanged: (value) {
                                                if (typeOfField ==
                                                        FieldTypes.slider ||
                                                    typeOfField ==
                                                        FieldTypes.range ||
                                                    typeOfField ==
                                                        FieldTypes.linear) {
                                                  currentField.labels[
                                                          currentField
                                                              .labels.keys.first]= int.tryParse(
                                                      _leftstepper.text);
                                                     
                                                } else if (typeOfField ==
                                                    FieldTypes.stepper) {
                                                  currentField.min_value =
                                                      int.parse(_leftstepper.text);
                                                }
                                                createRegistrationProvider
                                                    .notify();
                                              },
                                              textAlign: TextAlign.start,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                              scaleHeight(
                                                                  context, 20)),
                                                  border: InputBorder.none),
                                              cursorColor:
                                                  black1.withOpacity(0.6),
                                              style: GoogleFonts.firaSans(
                                                color: darkCharcoal
                                                    .withOpacity(0.6),
                                                fontSize:
                                                    heightScaler(context, 14),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ))),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
