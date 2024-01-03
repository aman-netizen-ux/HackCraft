import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/models/Registration/questionModel.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class AddQuestionDialog extends StatefulWidget {
  final Function onQuestionAdded;

  AddQuestionDialog({required this.onQuestionAdded});

  @override
  _AddQuestionDialogState createState() => _AddQuestionDialogState();
}

class _AddQuestionDialogState extends State<AddQuestionDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a Question'),
      content: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SizedBox(
          height: scaleHeight(context, 200),
          width: scaleWidth(context, 300),
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'question',
                decoration: const InputDecoration(labelText: 'Question'),
              ),
              FormBuilderDropdown(
                name: 'type',
                decoration: const InputDecoration(labelText: 'Response Type'),
                items: QuestionType.values
                    .map((type) => DropdownMenuItem(
                          value: type.toString(),
                          child: Text(type.toString()),
                        ))
                    .toList(),
                initialValue: QuestionType.text.toString(),
              ),
              FormBuilderTextField(
                name: 'options',
                decoration: const InputDecoration(
                    labelText: 'Options (comma-separated)'),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.saveAndValidate()) {
              final formData = _formKey.currentState!.value;
              final newQuestion = Question(
                question: formData['question'],
                type: formData['type'],
                options: (formData['options'] as String?)
                        ?.split(',')
                        .map((option) => option.trim())
                        .toList() ??
                    [],
              );
              widget.onQuestionAdded(newQuestion);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
