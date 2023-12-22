import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/models/questionModel.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class FormBuilderQuestion extends StatelessWidget {
  final Question question;
  final Function onDelete;
  final int questionIndex;

  FormBuilderQuestion(
      {required this.question,
      required this.onDelete,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final fieldPrefix = 'question_$questionIndex';

    Widget? responseField;
    print('Question type: ${question.type}');
    if (question.type == 'QuestionType.text') {
      responseField = FormBuilderTextField(
        name: '${fieldPrefix}_response_text',
        decoration: InputDecoration(
          labelText: 'Response ',
          filled: true,
          fillColor: offWhite,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      );
    } else if (question.type == 'QuestionType.dropdown') {
      responseField = FormBuilderDropdown(
        name: '${fieldPrefix}_response_dropdown',
        decoration: InputDecoration(
          labelText: 'Response ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        items: question.options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
      );
    } else if (question.type == 'QuestionType.multipleChoice') {
      responseField = FormBuilderCheckboxGroup(
        name: '${fieldPrefix}_response_multiChoice',
        options: question.options.map((option) {
          return FormBuilderFieldOption(
            value: option,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(option),
                const SizedBox(height: 5),
              ],
            ),
          );
        }).toList(),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: redishBrown, fontSize: 24, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: scaleHeight(context, 30),
        ),
        if (question.type == QuestionType.multipleChoice)
          FormBuilderTextField(
            name: '$fieldPrefix\_options',
            decoration: InputDecoration(
              labelText: 'Options (comma-separated)',
              filled: true,
              fillColor: offWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            initialValue: question.options.join(', '),
          ),
        responseField ?? const Text('no question'),
        // Conditionally render the response field
        const SizedBox(
          height: 30,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              onDelete();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
