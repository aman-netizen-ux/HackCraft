import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/dialog_alert.dart';

import 'package:provider/provider.dart';

class SampleTab extends StatefulWidget {
  const SampleTab(
      {super.key,
      required this.sectionName,
      required this.reorderListDisabled});
  final String sectionName;
  final bool reorderListDisabled;
  @override
  State<SampleTab> createState() => _SampleTabState();
}

class _SampleTabState extends State<SampleTab> {
  late List<Widget> _contents;

  void _onReorder(
    int oldIndex,
    int newIndex,
  ) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: false);
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Widget item = _contents.removeAt(oldIndex);
      _contents.insert(newIndex, item);

      final dynamic model = createRegistrationProvider
          .tabField[widget.sectionName]!
          .removeAt(oldIndex);
      createRegistrationProvider.tabField[widget.sectionName]!
          .insert(newIndex, model);
      createRegistrationProvider.currentKey = widget.sectionName;
      createRegistrationProvider.currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: true);

    final List<dynamic> fieldsList =
        createRegistrationProvider.tabField[widget.sectionName]!;

    _contents = List.generate(fieldsList.length, (index) {
      print("tab ${createRegistrationProvider.tabField}");
      print(fieldsList[index]);
      try {
        var fieldWidget = createRegistrationProvider.getField(
            fieldsList[index].type, fieldsList[index]);

        return InkWell(
          key: ValueKey(fieldsList[index]),
          onTap: () {
            if(widget.sectionName=="General" || widget.sectionName=="Team Details"){
              aletDialog(context, "This field cannot be customized", "Note");
            }else{
            List<String> keys =
                createRegistrationProvider.tabField.keys.toList();

            int currentKeyIndex =
                createRegistrationProvider.formcontroller.index;
            String currentKey = keys[currentKeyIndex];
            createRegistrationProvider.currentKey = currentKey;
            createRegistrationProvider.currentIndex = index;
            print(
                "***********************$index********************************");

            FieldTypes fieldType =
                createRegistrationProvider.tabField[currentKey]![index].type;
            print(fieldType);
            print(fieldType == FieldTypes.shortAnswer
                ? "validation: ${createRegistrationProvider.tabField[currentKey]![index].validation}"
                : " not short ans");
          }},
          child: Row(children: [fieldWidget]),
        );
      } catch (e) {
        print("error $e");
        return Text(
          'Error in field creation at index $index',
        );
      }
    });

    return widget.reorderListDisabled
        ? ListView(
            children: _contents,
          )
        : _contents.isEmpty
        ?Center(child: Text('Add a field', style: GoogleFonts.getFont(fontFamily2, color: black1, fontSize: scaleHeight(context, 18)),))
        : ReorderableListView(onReorder: _onReorder, children: _contents);
  }
}
