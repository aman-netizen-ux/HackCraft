import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class AddFieldSection extends StatefulWidget {
  const AddFieldSection({Key? key}) : super(key: key);

  @override
  State<AddFieldSection> createState() => _AddFieldSectionState();
}

class _AddFieldSectionState extends State<AddFieldSection>
    with TickerProviderStateMixin {
  final List<Map<String, dynamic>> fields = [
    {'title': 'Short Answer', 'icon': Icons.text_fields},
    {'title': 'Paragraph', 'icon': Icons.notes},
    {'title': 'Multiple Choice', 'icon': Icons.list},
    {'title': 'Checkboxes', 'icon': Icons.check_box_outlined},
    {'title': 'Yes/No', 'icon': Icons.toggle_on_outlined},
    {'title': 'Drop Down', 'icon': Icons.arrow_drop_down_circle_outlined},
    {'title': 'File Upload', 'icon': Icons.cloud_upload_outlined},
    {'title': 'Linear Scale', 'icon': Icons.linear_scale_outlined},
    {'title': 'Slider', 'icon': Icons.slideshow},
    {'title': 'Range Slider', 'icon': Icons.tune},
  ];

  @override
  Widget build(BuildContext context) {
    // Calculating the aspect ratio for the buttons based on screen width
    int count =
        fields.length % 2 == 0 ? fields.length ~/ 2 : (fields.length - 1) ~/ 2;
    return SingleChildScrollView(
      child: Container(
        width: scaleWidth(context, 204),
        height: scaleHeight(context, 539),
        color:  lightGrey,
        child: Column(children: [
          ...List.generate(count, (index) {
            return Column(
              children: [
                FieldsRowButon(
                    fields: fields, index1: 2 * index, index2: 2 * index + 1),
                fields.length % 2 == 0 && index == count - 1
                    ? SizedBox()
                    : Container(
                        height: scaleHeight(context, 2),
                        color: Color(0xffcfcfcf),
                      ),
                      
              ],
            );
          }),
          fields.length % 2 != 0
              ? SizedBox(
                  height: scaleHeight(context, 97),
                  child: FieldsButton(fields: fields, index: fields.length - 1))
              : SizedBox()
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
  }) : super(key: key);

  final List<Map<String, dynamic>> fields;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              flex: 495, child: FieldsButton(fields: fields, index: index1)),
          Expanded(
            flex: 10, // Changed from 010 to 10
            child: Container(
              width: 1,
              color: const Color(0xffcfcfcf),
            ),
          ),
          Expanded(
              flex: 495, child: FieldsButton(fields: fields, index: index2)),
        ],
      ),
    );
  }
}
