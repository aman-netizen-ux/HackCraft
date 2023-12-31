import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/models/Registration/customField.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistration.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class GetRegistered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<GetRegistrationForm>(context);
    final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
    return Stack(
      children: [
        Container(
          color: vibrantGreen,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              color: Colors.blueAccent,
              height: scaleHeight(context, 350),
              //  width: scaleWidth(context, 1280),
              child: FormBuilder(
                key: _formKey,
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
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.saveAndValidate()) {
                              final getformData = _formKey.currentState!.value;
                              // Process and save the form data as needed

                              print(getformData);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          child: const Text('Submit'),
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
        padding: const EdgeInsets.symmetric(horizontal: 200),
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
        padding: const EdgeInsets.symmetric(horizontal: 200),
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
        padding: const EdgeInsets.symmetric(horizontal: 200),
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
                hintText: 'Mobile Number',
                hintStyle: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 106, 108, 123),
                ),
                errorStyle: const TextStyle(fontSize: 14),
              ),
              initialValue: formData['participant_phone'].toString(),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200),
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
    switch (field.type) {
      case 'Short':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                field.label,
                style: const TextStyle(
                    color: Color(0xff1a202c),
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              FormBuilderTextField(
                name: 'response_${field.id}',
                decoration: InputDecoration(
                  // labelText: field.label,
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
      case 'Multiple':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(field.label,
                  style: const TextStyle(
                      color: Color(0xff1a202c),
                      fontSize: 24,
                      fontWeight: FontWeight
                          .w400)), // Optional: Display the label above the options
              FormBuilderCheckboxGroup(
                name: 'response_${field.id}',
                options: field.options
                    .map((option) => FormBuilderFieldOption(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
              ),
            ],
          ),
        );
      default:
        return const SizedBox.shrink(); // For unsupported types
    }
  }
}
