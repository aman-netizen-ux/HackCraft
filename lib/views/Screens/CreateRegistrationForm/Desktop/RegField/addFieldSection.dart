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
      "onTap": ShortAnswerFieldModel(
          errorText: "Error Text",
          hint: "Hint",
          label: "Question",
          required: true,
          serialNumber: 1,
          type: FieldTypes.shortAnswer,
          validation: "String")
    },
    {
      'title': 'Paragraph',
      'icon': Icons.notes,
      "onTap": LongAnswerFieldModel(
          errorText: "Error Text",
          label: "Question",
          hint: "Hint",
          required: true,
          serialNumber: 2,
          type: FieldTypes.longAnswer,
          wordLimit: 100)
    },
    {
      'title': 'Multiple Choice',
      'icon': Icons.list,
      "onTap": RadioFieldModel(
          errorText: "Error Text",
          label: "Question",
          options: [
            RegistrationOption(text: "First Option", serialNumber: 1),
            RegistrationOption(text: "Second Options", serialNumber: 2)
          ],
          required: true,
          serialNumber: 1,
          type: FieldTypes.radio)
    },
    {
      'title': 'Checkboxes',
      'icon': Icons.check_box_outlined,
      "onTap": CheckBoxModel(
          errorText: "Error Text",
          label: "Question",
          options: [
            RegistrationOption(text: "First Option", serialNumber: 1),
            RegistrationOption(text: "Second Options", serialNumber: 2)
          ],
          required: true,
          serialNumber: 3,
          type: FieldTypes.checkbox)
    },
    {
      'title': 'Yes/No',
      'icon': Icons.toggle_on_outlined,
      "onTap": RadioFieldModel(
          serialNumber: 4,
          errorText: "Error Text",
          label: "Question",
          options: [
            RegistrationOption(text: "First Option", serialNumber: 1),
            RegistrationOption(text: "Second Options", serialNumber: 2)
          ],
          required: true,
          type: FieldTypes.yesNo)
    },
    {
      'title': 'Drop Down',
      'icon': Icons.arrow_drop_down_circle_outlined,
      "onTap": DropDownModel(
          errorText: "Error Text",
          label: "Question",
          required: true,
          serialNumber: 4,
        options: [
            RegistrationOption(text: "First Option", serialNumber: 1),
            RegistrationOption(text: "Second Options", serialNumber: 2)
          ],
          type: FieldTypes.dropdown)
    },
    {
      'title': 'File Upload',
      'icon': Icons.cloud_upload_outlined,
      "onTap": FieldModel(
          serialNumber: 6,
          errorText: "Error Text",
          label: "Question",
          required: true,
          type: FieldTypes.file)
    },
    {
      'title': 'Linear Scale',
      'icon': Icons.linear_scale_outlined,
      "onTap": LinearModel(
          errorText: "Error Text",
          label: "Question",
          required: true,
          labels: {"options": 4, "option": 5},
          serialNumber: 6,
          type: FieldTypes.linear)
    },
    {
      'title': 'Slider',
      'icon': Icons.slideshow,
      "onTap": SliderModel(
          serialNumber: 1,
          errorText: "Error Text",
          label: "Question",
          required: true,
          type: FieldTypes.slider,
          labels: {"start": 4, "end": 10})
    },
    {
      'title': 'Range Slider',
      'icon': Icons.tune,
      "onTap": RangeModel(
          serialNumber: 4,
          errorText: "Error Text",
          label: "Question",
          required: false,
          type: FieldTypes.range,
          labels: {"options": 4, "jjjn": 5})
    },
    {
      'title': 'Stepper',
      'icon': Icons.exposure_plus_1,
      "onTap": StepperModel(
          errorText: "Error Text",
          label: "Question",
          max_value: 45,
          min_value: 10,
          required: true,
          serialNumber: 1,
          type: FieldTypes.stepper)
    },
    {
      'title': 'Toggle',
      'icon': Icons.toggle_on,
      "onTap": ToggleModel(
          serialNumber: 3,
          errorText: "Error Text",
          label: "Question",
          required: true,
          type: FieldTypes.toggle)
    },
    {
      'title': 'Tags',
      'icon': Icons.tag,
      "onTap": TagModel(
        serialNumber: 1,
        errorText: "Error Text",
        label: "Question",
        required: true,
        type: FieldTypes.tag,
        options: ["option1", " options2"],
      )
    },
    {
      'title': 'Date',
      'icon': Icons.date_range,
      "onTap": DateFieldModel(
          serialNumber: 2,
          errorText: "Error Text",
          label: "Question",
          required: true,
          type: FieldTypes.date,
          minDate: "",
          maxDate: "")
    },
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
        height: scaleHeight(context, 692),
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
                      List<String> keys =
                          createRegistrationProvider.tabField.keys.toList();
                      createRegistrationProvider.tabField[keys[
                              createRegistrationProvider.formcontroller.index]]!
                          .add(fields[fields.length - 1]['onTap']);
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

                  createRegistrationProvider.addField(fields[index1]['onTap']);
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
                  createRegistrationProvider.addField(fields[index2]['onTap']);
                  print(
                      "index ${createRegistrationProvider.formcontroller.index}");
                  print(createRegistrationProvider.tabField);
                },
              )),
        ],
      ),
    );
  }
}
