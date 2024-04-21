import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/dropdown_ans.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/long_ans.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/short_ans.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/createForm.dart';

class SampleTab extends StatefulWidget {
  const SampleTab({super.key, required this.i});
  final int i;
  @override
  State<SampleTab> createState() => _SampleTabState();
}

class _SampleTabState extends State<SampleTab> {
  late List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();

    _contents = List.generate(1, (index) {
      return DragAndDropList(
        children: [
          DragAndDropItem(
            child: Row(
              children: [
                DropDownAns(
                  create: true,
                    hint: "Selct any option",
                   question: ' favorite color ?',
            options: ['Red', 'Green', 'Blue'],
          
                )
                //  LongAnsField(
                //   create: true,
                //   hint: "sample hai ",
                //   question: "hellooq quest",
                //  ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       height: 30, 
                //       child: Text("First Field")),
                //     Container(
                //         padding: EdgeInsets.only(top: 10),
                //         height: 30,
                //         width: 300,
                //         child: TextFormField(
                //           decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(2),
                //               borderSide: const BorderSide(
                //                 color: black1,
                //                 width: 1,
                //               ),
                //             ),
                //           ),
                //         ))
                //   ],
                // ),
              ],
            ),
          ),
          // DragAndDropItem(
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          //         child: Text(
          //           'Sub $index.2',
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // DragAndDropItem(
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          //         child: Text(
          //           'Sub $index.3',
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // DragAndDropItem(
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          //         child: Text(
          //           'Sub $index.4',
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      child: DragAndDropLists(
        children: _contents,
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
        listPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemDivider: Divider(
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
        listInnerDecoration: BoxDecoration(
          color: lightGrey,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
