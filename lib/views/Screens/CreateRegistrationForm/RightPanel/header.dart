import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/customToggle.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String fieldTypeText = "";
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: false);

    switch (createRegistrationProvider
        .tabField[createRegistrationProvider.currentKey]![
            createRegistrationProvider.currentIndex]
        .type) {
      case FieldTypes.shortAnswer:
        fieldTypeText = "Short Answer";
        break;
      case FieldTypes.longAnswer:
        fieldTypeText = "Long Answer";
        break;
      case FieldTypes.stepper:
        fieldTypeText = "Stepper ";
        break;
      case FieldTypes.range:
        fieldTypeText = "Range Slider";
        break;
      case FieldTypes.tag:
        fieldTypeText = "Tag";
        break;
      case FieldTypes.linear:
        fieldTypeText = "Linear Scale";
        break;
      case FieldTypes.dropdown:
        fieldTypeText = "DropDown";
        break;
      case FieldTypes.checkbox:
        fieldTypeText = "CheckBox";
        break;
      case FieldTypes.toggle:
        fieldTypeText = "Toggle";
        break;
      case FieldTypes.date:
        fieldTypeText = "Date";
        break;
      case FieldTypes.yesNo:
        fieldTypeText = "Yes / No";
      case FieldTypes.file:
        fieldTypeText = "File Upload";
        break;
      case FieldTypes.radio:
        fieldTypeText = "Multiple Choice";
        break;
      case FieldTypes.phoneNumber:
        fieldTypeText = "Phone Number";
        break;
      case FieldTypes.slider:
        fieldTypeText = "Slider";
        break;
      default:
        throw Exception('Invalid field type');
    }
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
          top: scaleHeight(context, 9),
          right: scaleWidth(context, 12),
          left: scaleWidth(context, 12)),
      color: const Color(0xffeaeaea),
      child: Column(
        children: [
          SizedBox(
            height: scaleHeight(context, 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: scaleWidth(context, 20),
                        left: scaleWidth(context, 10)),
                    height: scaleHeight(context, 24),
                    width: scaleHeight(context, 24),
                    color: lightSilver,
                  ),
                  Text(
                    fieldTypeText,
                    style: GoogleFonts.firaSans(
                        fontSize: scaleHeight(context, 18),
                        color: darkCharcoal,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomToggle(
                    required:currentField
                        .required,
                  ),
                  Container(
                    height: scaleHeight(context, 34),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: scaleWidth(context, 8),
                        right: scaleWidth(context, 14)),
                    width: scaleHeight(context, 34),
                    color: lightSilver,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete,
                        size: 18,
                        color: red,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: scaleHeight(context, 12),
          ),
          SizedBox(
            height: scaleHeight(context, 40),
            width: scaleWidth(context, 289),
            child: InkWell(
              onTap: () {
                
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: scaleHeight(context, 10)),
                decoration: BoxDecoration(
                    color: lightSilver, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Save",
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontWeight: FontWeight.w400,
                    color: darkCharcoal,
                    fontSize: scaleHeight(context, 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
