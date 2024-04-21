import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class DropDownAns extends StatefulWidget {
  final String question;
  final List<String> options;

  final String hint;
  final bool create;

  const DropDownAns(
      {Key? key,
      required this.question,
      required this.hint,
      required this.options,
      required this.create})
      : super(key: key);

  @override
  State<DropDownAns> createState() => _DropDownAnsState();
}

class _DropDownAnsState extends State<DropDownAns> {
  late TextEditingController questionController;
  late TextEditingController hintController;
  @override
  void initState() {
    super.initState();
    questionController = TextEditingController(text: widget.question);
    hintController = TextEditingController(text: widget.hint);
  }

  @override
  void dispose() {
    hintController.dispose();
    questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaleHeight(context, 70),
      width: scaleWidth(context, 400),
      child: Column(
        children: [
          // TextFormField(
          //   controller: questionController,
          //   decoration: const InputDecoration(
          //     border: InputBorder.none,
          //   ),
          //   enabled: !widget.create,
          // ),
          FormBuilder(
            key: GlobalKey<FormBuilderState>(),
            child: FormBuilderDropdown(
              alignment: Alignment.bottomCenter,
              name: widget.question,
              //  borderRadius: ,
              dropdownColor: Color(0xffC8C6C6),
              elevation: 0,

              enabled: widget.create,
              decoration: InputDecoration(
              
                hintText: widget.hint,
                labelText: widget.question,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
              //  labelStyle: const TextStyle(color: Colors.black),
              ),
               
              items: widget.options
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
