import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/createForm.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/fieldCollection.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/RightPanel/rigthPanel.dart';

class RegFormFields extends StatelessWidget {
  const RegFormFields({
    super.key,
    required this.fieldtabController,
  });

  final TabController fieldtabController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 166,
            child: FieldsCollection(fieldtabController: fieldtabController)),
        const Expanded(flex: 554, child:  CreateForm()),
        const Expanded(flex: 280, child:  RigthPanel())
      ],
    );
  }
}
