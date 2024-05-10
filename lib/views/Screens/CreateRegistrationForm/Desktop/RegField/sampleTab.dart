import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';

import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/short_ans.dart';

import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/stepper_field.dart';
import 'package:provider/provider.dart';

class SampleTab extends StatefulWidget {
  const SampleTab({super.key, required this.fieldsList});
  final List<dynamic> fieldsList;
  @override
  State<SampleTab> createState() => _SampleTabState();
}

class _SampleTabState extends State<SampleTab> {
  late List<DragAndDropList> _contents;

  @override
  Widget build(BuildContext context) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: true);

    _contents = List.generate(1, (index) {
      return DragAndDropList(
          children: List.generate(widget.fieldsList.length, (index) {
            print("tab ${createRegistrationProvider.tabField}");
          print(widget.fieldsList[index]);
        try {
          var fieldWidget = createRegistrationProvider.getField(
              widget.fieldsList[index].type, widget.fieldsList[index]);
          

          return DragAndDropItem(
              child: InkWell(
            onTap: () {
              List<String> keys =
                  createRegistrationProvider.tabField.keys.toList();

              int currentKeyIndex =
                  createRegistrationProvider.formcontroller.index;
              String currentKey = keys[currentKeyIndex];
              createRegistrationProvider.currentKey = currentKey;
              createRegistrationProvider.currentIndex = index;

              FieldTypes fieldType =
                  createRegistrationProvider.tabField[currentKey]![index].type;
              print(fieldType);
            },
            child: Row(children: [fieldWidget]),
          ));
        } catch (e) {
          print("error $e");
          return DragAndDropItem(
            child: Text('Error in field creation at index $index'),
          );
        }
      }));
    });
    return Container(
      color: lightGrey,
      child: DragAndDropLists(
        children: _contents,
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
        listPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        itemDivider: const Divider(
          thickness: 20,
          height: 20,
          color: white,
        ),
        itemDecorationWhileDragging: BoxDecoration(
          color: Colors.purple.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        listInnerDecoration: const BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        lastItemTargetHeight: 8,
        addLastItemTargetHeightToTop: true,
        lastListTargetSize: 40,
        itemDragHandle: const DragHandle(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.drag_indicator_outlined,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }
}
