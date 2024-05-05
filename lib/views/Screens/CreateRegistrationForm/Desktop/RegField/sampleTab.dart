import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:major_project__widget_testing/constants/colors.dart';

import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/short_ans.dart';

import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/stepper_field.dart';

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
            child: const Row(
              children: [
                FormBuilder(
                    child:
                        //  DropDownField(
                        //   create: true,
                        //   hint: "Selct any option",
                        //   question: ' favorite color ?',
                        //   options: ['Red', 'Green', 'Blue'],
                        //   required: false,
                        // )
                       

                        //     LongAnsField(
                        //       limit: 100,
                        //   create: true,
                        //   hint: "sample hai ",
                        //   question: "hellooq quest",
                        //   required: true,
                        // )
                //         ToogleYNField(
                //   create: true,
                //   question: "question is imp",
                //   required: true,
                // )
                    // MultipleChoiceField(
                    //     question: "ques",
                    //     hint: "hin",
                    //     create: true,
                    //     options: ["jj", "ll ", "kk", "oo ", "ui", "ip" , "jj", "ll ", "kk", "oo ", "ui", "ip"],
                    //     required: true)

                    //         CheckBoxField(
                    //   create: true,
                    //   required: true,
                    //   hint: "question",
                    //   question: "ki",
                    //   options: ["jj" ,"kk" ,"ui"],
                    // )
                   StepperField(question: "question", create: true, required: true)
                    // PhoneField(
                    //   create: false,
                    //   question: "question",
                    //   required: true,
                    // )
                    // TagField(
                    //   options: ["red" , "blue"],
                    //   create: true,
                    //   required: true,
                    //   hint: "write something",
                    //   question: "color ??",
                    // )
                 // LinearScaleField(create: true, division: 5, max: 100, min: 0, question: "question" , labels: ["red" , " blue " , "white " , "green" ,"pink"], required: true,)
                  //  StepperField()
                    // SliderField(
                    //  required: true,
                    //   create: false,
                    //   endLabel: "yes",
                    //   startLabel: "no",
                    //   max: 100,
                    //   min: 0,
                    //   question: "hih",
                    // ),
                   // FileUploadField(question: "question", create: true, required: true)
                    // RangeSliderField(create: false, min: 0, max: 100, question: "hey ", required:  true,  startLabel: "good",endLabel:  "bad"),
                    //MultipleChoiceField()

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
                    ),
              ],
            ),
          ),
          DragAndDropItem(
              child: const Row(children: [
            FormBuilder(
                child: ShortAnsField(
                    question: "short",
                    create: true,
                    hint: "hint",
                    required: true))
          ]))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  lightGrey,
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
          color:  lightGrey,
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
