import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/createForm.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/fieldCollection.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/rigthPanel.dart';

class RegFormFields extends StatefulWidget {
  const RegFormFields({
    super.key,
    required this.fieldtabController,
  });

  final TabController fieldtabController;

  @override
  State<RegFormFields> createState() => _RegFormFieldsState();
}

class _RegFormFieldsState extends State<RegFormFields> {
  final _registrationFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      //key: _registrationFormKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 166,
              child: FieldsCollection(
                  fieldtabController: widget.fieldtabController)),
          const Expanded(flex: 554, child: CreateForm()),
          const Expanded(flex: 280, child: RigthPanel())
        ],
      ),
    );
  }
}
