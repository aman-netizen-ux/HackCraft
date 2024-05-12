import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DateField extends StatefulWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: FormBuilderDateTimePicker(
        name: 'date_picker',
        decoration: const InputDecoration(labelText: 'Select a Date'),
        inputType: InputType.date,
        //  format: DateFormat('yyyy-MM-dd'),
        initialDate: DateTime.now(),
        initialTime: const TimeOfDay(hour: 12, minute: 0),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        onChanged: (value) {},
        onSaved: (value) {
          // Handle onSaved event
        },
      ),
    );
  }
}
