import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/models/Registration/registration_form_model.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class AddFieldSection extends StatefulWidget {
  const AddFieldSection({Key? key}) : super(key: key);

  @override
  State<AddFieldSection> createState() => _AddFieldSectionState();
}

class _AddFieldSectionState extends State<AddFieldSection>
    with TickerProviderStateMixin {
  final List<Map<String, dynamic>> fields = [
    {
      'title': 'Short Answer',
      'icon': Icons.text_fields,
      "onTap": FieldTypes.shortAnswer
    },
    {
      'title': 'Paragraph',
      'icon': Icons.notes,
      "onTap": FieldTypes.longAnswer
    },
    {
      'title': 'Multiple Choice',
      'icon': Icons.list,
      "onTap": FieldTypes.radio
    },
    {
      'title': 'Checkboxes',
      'icon': Icons.check_box_outlined,
      "onTap": FieldTypes.checkbox
    },
    {
      'title': 'Yes/No',
      'icon': Icons.toggle_on_outlined,
      "onTap": FieldTypes.yesNo
    },
    {
      'title': 'Drop Down',
      'icon': Icons.arrow_drop_down_circle_outlined,
      "onTap":FieldTypes.dropdown
    },
    // {
    //   'title': 'File Upload',
    //   'icon': Icons.cloud_upload_outlined,
    //   "onTap": FieldTypes.file
    // },
    // {
    //   'title': 'Linear Scale',
    //   'icon': Icons.linear_scale_outlined,
    //   "onTap": FieldTypes.linear
    // },
    {
      'title': 'Slider',
      'icon': Icons.slideshow,
      "onTap": FieldTypes.slider
    },
    {
      'title': 'Range Slider',
      'icon': Icons.tune,
      "onTap":FieldTypes.range
    },
    {
      'title': 'Stepper',
      'icon': Icons.exposure_plus_1,
      "onTap":FieldTypes.stepper
    },
    {
      'title': 'Toggle',
      'icon': Icons.toggle_on,
      "onTap": FieldTypes.toggle
    },
    // {
    //   'title': 'Tags',
    //   'icon': Icons.tag,
    //   "onTap": FieldTypes.tag
    // },
    // {
    //   'title': 'Date',
    //   'icon': Icons.date_range,
    //   "onTap":FieldTypes.date
    // },
  ];


  

  @override
  Widget build(BuildContext context) {
    // Calculating the aspect ratio for the buttons based on screen width
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: true);
    int count =
        fields.length % 2 == 0 ? fields.length ~/ 2 : (fields.length - 1) ~/ 2;
    return SingleChildScrollView(
      child: Container(
        width: scaleWidth(context, 204),
        // height: scaleHeight(context, 692),
        color: lightGrey,
        child: Column(children: [
          ...List.generate(count, (index) {
            return Column(
              children: [
                FieldsRowButon(
                  fields: fields,
                  index1: 2 * index,
                  index2: 2 * index + 1,
                ),
                fields.length % 2 == 0 && index == count - 1
                    ? const SizedBox()
                    : Container(
                        height: scaleHeight(context, 2),
                        color: const Color(0xffcfcfcf),
                      ),
              ],
            );
          }),
          fields.length % 2 != 0
              ? SizedBox(
                  height: scaleHeight(context, 97),
                  child: FieldsButton(
                    fields: fields,
                    index: fields.length - 1,
                    onTap: () {
                      
                           createRegistrationProvider.addField(createRegistrationProvider.getFieldModel(fields[fields.length - 1]['onTap'])   , context );
                     
                    },
                  ))
              : const SizedBox()
        ]),
      ),
    );
  }
}

class FieldsButton extends StatelessWidget {
  const FieldsButton({
    Key? key,
    required this.fields,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final List<Map<String, dynamic>> fields;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(fields[index]['icon'], size: scaleHeight(context, 30)),
          SizedBox(
            height: scaleHeight(context, 20),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              fields[index]['title'],
              style: GoogleFonts.firaSans(
                  fontSize: scaleHeight(context, 12),
                  color: darkCharcoal,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class FieldsRowButon extends StatelessWidget {
  const FieldsRowButon({
    Key? key,
    required this.fields,
    required this.index1,
    required this.index2,
  }) : super(key: key);

  final List<Map<String, dynamic>> fields;
  final int index1, index2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaleHeight(context, 97),
      child: Row(
        children: [
          Expanded(
              flex: 495,
              child: FieldsButton(
                fields: fields,
                index: index1,
                onTap: () {
                  final createRegistrationProvider =
                      Provider.of<CreateRegistrationProvider>(context,
                          listen: false);

                      

                  createRegistrationProvider.addField(createRegistrationProvider.getFieldModel(fields[index1]['onTap'])  , context  );
                  // print(
                  //     "index ${createRegistrationProvider.formcontroller.index}");

                  // print(
                  //     "field ${createRegistrationProvider.tabField[keys[createRegistrationProvider.formcontroller.index]]}");
                  print(createRegistrationProvider.tabField);
                },
              )),
          Expanded(
            flex: 10,
            child: Container(
              width: 1,
              color: const Color(0xffcfcfcf),
            ),
          ),
          Expanded(
              flex: 495,
              child: FieldsButton(
                fields: fields,
                index: index2,
                onTap: () {
                  final createRegistrationProvider =
                      Provider.of<CreateRegistrationProvider>(context,
                          listen: false);
                   createRegistrationProvider.addField(createRegistrationProvider.getFieldModel(fields[index2]['onTap'])  , context  );
                   
                  
                },
              )),
        ],
      ),
    );
  }
}
