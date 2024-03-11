import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/models/Registration/customField.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistration.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class GetRegistered extends StatelessWidget {
  const GetRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<GetRegistrationFormProvider>(context);
    final GlobalKey<FormBuilderState> _getformKey =
        GlobalKey<FormBuilderState>();
    return Stack(
      children: [
        Container(
          color: vibrantGreen,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              color: white,
              height: scaleHeight(context, 650),
              child: FormBuilder(
                key: _getformKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  shrinkWrap: false,
                  children: [
                    ..._buildFormFields(formProvider.formData),
                    ...formProvider.customFields
                        .map((field) => _buildCustomFormField(field))
                        .toList(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(80),
                          child: SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_getformKey.currentState!
                                    .saveAndValidate()) {
                                  final getformData =
                                      _getformKey.currentState!.value;
                                  // Process and save the form data as needed
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Curved border radius
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildFormFields(Map<String, dynamic> formData) {
    return [
      const Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: deepNavy, fontSize: 48, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Full name",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: deepNavy, fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            FormBuilderTextField(
              name: 'participant_name',
              decoration: InputDecoration(
                filled: true,
                fillColor: offWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              validator: (value) {
                if (value != null &&
                    !RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                  return "Only letters  allowed";
                }
                return null;
              },
              initialValue: formData['participant_name'],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email id",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: deepNavy, fontSize: 24, fontWeight: FontWeight.w400),
            ),
            FormBuilderTextField(
              name: 'participant_email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter an email address";
                } else if (!RegExp(r'^.+@.+\..+$').hasMatch(value)) {
                  return "Enter a valid email address";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: offWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              initialValue: formData['participant_email'],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Contact No.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: deepNavy, fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            FormBuilderTextField(
              name: 'participant_phone',
              validator: (value) {
                if (value?.length != 10 ||
                    !RegExp(r'^[789]\d{9}$').hasMatch(value!)) {
                  return 'Invalid mobile number';
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF3FAEE),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintStyle: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 106, 108, 123),
                ),
                errorStyle: const TextStyle(fontSize: 14),
              ),
              initialValue: '',
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Gender",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: deepNavy, fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            FormBuilderDropdown(
              name: 'participant_gender',
              validator: (value) {
                if (value == null) {
                  return "Please Select gender";
                }
                return null;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: offWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Select Gender'),
              initialValue: formData['participant_gender'],
              items: ['Male', 'Female', 'Other']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    ];
  }

  Widget _buildCustomFormField(CustomField field) {
    if (field.multiple.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                field.label,
                style: const TextStyle(
                  color: Color(0xff1a202c),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FormBuilderRadioGroup<String>(
              name: 'response_${field.id}',
              orientation: OptionsOrientation.vertical,
              options: field.options
                  .map((option) => FormBuilderFieldOption(
                        value: option,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              activeColor: Colors.green,
              controlAffinity: ControlAffinity.leading,
              separator: const SizedBox(height: 25),
            ),
          ],
        ),
      );
    }
    else  if ( field.shortAns!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                field.label,
                style: const TextStyle(
                  color: Color(0xff1a202c),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FormBuilderTextField(
              name: 'response_${field.id}',
              //  initialValue: field.label,
              decoration: InputDecoration(
                filled: true,
                fillColor: offWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink(); // For unsupported types
    }
  }
}
