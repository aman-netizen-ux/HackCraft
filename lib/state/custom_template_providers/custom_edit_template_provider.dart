import 'dart:math' as math;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/child_factory.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_circle_image.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_column.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_container.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_divider.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_flippable_card.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_icon.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_image.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_pdf_viewer.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_row.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_spacer.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_svg_picture.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_tabbar.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_text.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_timeline.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_vertical_divider.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_video_player.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Widgets/custom_wrap.dart';
import 'package:timeline_tile/timeline_tile.dart';

//TODO: clean up the code

class CustomEditPortal extends ChangeNotifier {
  bool _isColorSelected = false;
  bool _isPaddingSelected = false;
  bool _isMarginSelected = false;
  bool _isColorPickerSelected = false;
  bool _isAlignmentSelected = false;
  int _selectedColorTool = 2;
  final List<Color> _colors = [];
  Map<String, dynamic> _requiredHackathonDetails = {
    "Hackathon Name": "",
    "Organization Name": "",
    "Start Date": "",
    "Deadline": "",
    "Team Size": "",    
    "Brief": "",
    "Fee": "",
    "Total Rounds": ""
  };

   Map<String, bool> _requiredHackathonDetailsAdded = {
    "Hackathon Name": false,
    "Organization Name": false,
    "Start Date": false,
    "Deadline": false,
    "Team Size": false,    
    "Brief": false,
    "Fee": false,
    "Total Rounds": false
  };

  
  

  Map<String, dynamic> get requiredHackathonDetails =>
      _requiredHackathonDetails;

        Map<String, dynamic> get requiredHackathonDetailsAdded =>
      _requiredHackathonDetailsAdded;
void setRequiredHackathonDetailsAdded(String key, dynamic value) {
    _requiredHackathonDetailsAdded[key] = value;
    print("_requiredHackathonDetailsAdded $_requiredHackathonDetailsAdded");
    notifyListeners();
  }

  void setRequiredHackathonDetails(String key, dynamic value) {
    _requiredHackathonDetails[key] = value;
    print("_requiredHackathonDetails $_requiredHackathonDetails");
    notifyListeners();
  }

  bool checkIsRequireDataAdded(String key){
return  _requiredHackathonDetailsAdded[key]??false;
  }

  List<String> checkForEmptyFields() {
  List<String> emptyKeys = [];
  _requiredHackathonDetails.forEach((key, value) {
    if (value.toString().isEmpty) {
      emptyKeys.add(key);
    }
  });
  return emptyKeys;
}

  final int _maxCapacity = 16;

  List<Widget> _dynamicWidgets = [const SizedBox()];
  List<Widget> get dynamicWidgets => _dynamicWidgets;

  int get selectedColorTool => _selectedColorTool;
  List<Color> get colors => _colors;

  void addColor(Color color) {
    if (_colors.length < _maxCapacity) {
      _colors.add(color);
    } else {
      // Once we reach max capacity, we start replacing from the beginning
      _colors.removeAt(0); // Remove the first element
      _colors.add(color); // Add the new color
    }
    notifyListeners(); // Notify listeners about the change
  }

  void setSelectedColorTool(int value) {
    _selectedColorTool = value;
    notifyListeners();
  }

  set dynamicWidgets(List<Widget> widgets) {
    _dynamicWidgets = widgets;
    notifyListeners();
  }

  GlobalKey? _selectedWidgetKey;

  GlobalKey? get selectedWidgetKey => _selectedWidgetKey;

  String _selectedWidgetType = '';
  String get selectedWidgetType => _selectedWidgetType;

  set selectedWidgetKey(GlobalKey? value) {
    _selectedWidgetKey = value;
    notifyListeners();
  }

  final List<String> mainAxisAlignments = [
    "Start",
    "Center",
    "Space Around",
    "Space Between",
    "Space Evenly",
    "End"
  ];

  final List<String> crossAxisAlignments = [
    "Start",
    "Center",
    "Baseline",
    "Stretch",
    "End"
  ];

  String _selectedRowAlignment = 'Start';

  String get selectedRowAlignment => _selectedRowAlignment;

  void setSelectedRowAlignment(String value) {
    _selectedRowAlignment = value;
    notifyListeners();
  }

  String _selectedRowCrossAlignment = 'Start';

  String get selectedRowCrossAlignment => _selectedRowCrossAlignment;

  void setSelectedRowCrossAlignment(String value) {
    _selectedRowCrossAlignment = value;
    notifyListeners();
  }

  String _selectedColumnAlignment = 'Start';

  String get selectedColumnAlignment => _selectedColumnAlignment;

  void setSelectedColumnAlignment(String value) {
    _selectedColumnAlignment = value;
    notifyListeners();
  }

  String _selectedColumnCrossAlignment = 'Start';

  String get selectedColumnCrossAlignment => _selectedColumnCrossAlignment;

  void setSelectedColumnCrossAlignment(String value) {
    _selectedColumnCrossAlignment = value;
    notifyListeners();
  }

  MainAxisAlignment mainAxisAlignmentFromString(String alignment) {
    switch (alignment) {
      case 'Start':
        return MainAxisAlignment.start;
      case 'End':
        return MainAxisAlignment.end;
      case 'Space Evenly':
        return MainAxisAlignment.spaceEvenly;
      case 'Space Around':
        return MainAxisAlignment.spaceAround;
      case 'Space Between':
        return MainAxisAlignment.spaceBetween;
      case 'Center':
        return MainAxisAlignment.center;

      default:
        return MainAxisAlignment.start;
    }
  }

  CrossAxisAlignment crossAxisAlignmentFromString(String alignment) {
    switch (alignment) {
      case 'Start':
        return CrossAxisAlignment.start;
      case 'End':
        return CrossAxisAlignment.end;
      case 'Stretch':
        return CrossAxisAlignment.stretch;
      case 'Baseline':
        return CrossAxisAlignment.baseline;
      case 'Center':
        return CrossAxisAlignment.center;

      default:
        return CrossAxisAlignment.start;
    }
  }

  Map<String, dynamic> _jsonObject = {
    "id": 78,
    "key": customColumnKey,
    "children": [],
  };
  Map<String, dynamic> get jsonObject => _jsonObject;

  bool addOrCheckChildByKey(
      String newglobalKey, int id, String globalKey, String type) {
    log('hi globalkey $globalKey');
    // Map<String, dynamic> containerChild = {
    //   newglobalKey.toString(): {
    //     "id": id,
    //     "type": type,
    //     "properties": {"height": 0, "color": '', "width": 0},
    //     "child": [] // Using a list for potential multiple children
    //   }
    // };

    Map<String, dynamic> textChild = {
      newglobalKey.toString(): {
        "id": id,
        "type": type,
        "properties": {},
        "child": [] // Using a list for potential multiple children
      }
    };
    Map<String, dynamic> newChild = {};
    Map<String, dynamic> defaultChild = {};

    Color generateRandomColor() {
      final math.Random random = math.Random();
      // Generate ARGB values
      int a = random.nextInt(256); // Alpha value
      int r = random.nextInt(256); // Red value
      int g = random.nextInt(256); // Green value
      int b = random.nextInt(256); // Blue value

      // Create a color from the ARGB values and return it
      return Color.fromARGB(a, r, g, b);
    }

    // Define an auxiliary function to handle recursion and potentially add a new child
    bool _searchAndAdd(
      dynamic node,
      String key,
      Map<String, dynamic>? childToAdd,
      int depth,
    ) {
      // Determine the height and width based on depth
      int margin = (depth * 10);
      // margin = margin < 0 ? 0 : margin; // Ensure size does not become negative
      log(" Im in search with depth $depth");

      if (globalKey == customColumnKey.toString()) {
        newChild = ChildFactory()
            .createChild(type, newglobalKey.toString(), id, false);

        _jsonObject["children"].add(newChild);
        return true;
      } else if (node is Map) {
        // If the node is a Map and contains the key directly
        log("Im in map");

        if (node.containsKey(key)) {
          // Check if 'child' related to this key is empty
          log("Hellllllllllllllllllo contaqins key : ${node[key]['type']}");
          String parentType = node[key]['type'];
          childToAdd = ChildFactory()
              .createChild(type, newglobalKey.toString(), id, true);

          if (node[key]['child'].isEmpty && childToAdd != null) {
            // The 'child' list is empty, and we have a new child to add
            log("IM here 1");
            node[key]['child'].add(childToAdd);

            return true; // Indicating that a child was added
          } else if ((parentType == "Row" ||
                  parentType == "Column" ||
                  parentType == "Wrap" ||
                  parentType == "Timeline") &&
              node[key]['child'].isNotEmpty &&
              childToAdd != null) {
            log("Plssssssssssssssss rescue me");
            node[key]['child'].add(childToAdd);
            log("Am i rescued");
          }
          log("im here 5");
          return node[key]['child']
              .isEmpty; // Return true if empty, even if no child was added
        } else {
          log(" doesn't contained key");
          // Recursively search each value if the key is not found at this level
          for (var value in node.values) {
            log(" value : $value");
            log("***********");
            if (_searchAndAdd(
              value,
              key,
              childToAdd,
              depth + 1,
            )) {
              log("IM here 2");
              return true; // Indicating that a child was added or found empty
            }
          }
        }
      } else if (node is List) {
        // If the node is a List, iterate and search each element
        log(" im list");
        for (var element in node) {
          log(" elemet: $element");
          if (_searchAndAdd(
            element,
            key,
            childToAdd,
            depth + 1,
          )) {
            log("IM here 3");
            return true; // Indicating that a child was added or found empty
          }
        }
      }
      // Key not found in the current path, or no action was taken
      log("IM here 4");
      return false;
    }

    // Start the search from the top level 'children', attempting to add the new child if conditions are met
    return _searchAndAdd(
      _jsonObject["children"],
      globalKey,
      null,
      0,
    );
  }

  Color stringToColor(String colorString) {
    try {
      // Checking if the string contains '(' and ')'
      if (colorString.contains('(') && colorString.contains(')')) {
        // Extracting the hex color code from the string
        String hexColor = colorString.split('(')[1].split(')')[0];
        // Converting to a Color object
        return Color(int.parse(hexColor));
      } else {
        throw FormatException("Invalid format");
      }
    } catch (e) {
      // Return a default color in case of an error
      return Colors.black; // Default color
    }

    // Extracting the hex color code from the string
  }

  List<Widget> buildWidgetsFromJson(dynamic node) {
    List<Widget> widgets = [];

    // Function to recursively build widgets
    Widget buildWidget(
      dynamic node,
    ) {
      if (!node.containsKey('type')) return const SizedBox();

      Widget currentWidget;
      debugPrint("type in buildig ${node['type']}");

      switch (node['type']) {
        case 'Container':
          List<Widget> childWidgets = [];
          if (node.containsKey('child') && node['child'] is List) {
            node['child'].forEach((childNode) {
              for (var entry in childNode.entries) {
                childWidgets.add(buildWidget(
                  entry.value,
                ));
              }
            });
          }
          currentWidget = CustomContainer(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();
              },
              childWidgets: childWidgets);
          break;
        case 'Text':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        case 'Row':
          List<Widget> childWidgets = [];
          if (node.containsKey('child') && node['child'] is List) {
            node['child'].forEach((childNode) {
              for (var entry in childNode.entries) {
                childWidgets.add(buildWidget(entry.value));
              }
            });
          }
          currentWidget = CustomRow(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();
              },
              childWidgets: childWidgets);

          break;

        case 'Column':
          List<Widget> childWidgets = [];
          if (node.containsKey('child') && node['child'] is List) {
            node['child'].forEach((childNode) {
              for (var entry in childNode.entries) {
                childWidgets.add(buildWidget(entry.value));
              }
            });
          }
          currentWidget = CustomColumn(
              node: node,
              onTap: () {
                int? index = node['id'];
                final type = node['type'];
                _selectedWidgetType = type;
                final currentKey = customWidgetsGlobalKeysMap[index];
                _selectedWidgetKey = currentKey;
                notifyListeners();
              },
              childWidgets: childWidgets);
          // InkWell(
          //   onTap: () {
          //     int? index = node['id'];

          //     final currentKey = customWidgetsGlobalKeysMap[index];
          //     _selectedWidgetKey = currentKey;
          //     notifyListeners();
          //   },
          //   child: Container(
          //     height: 300,
          //     width: double.infinity,
          //     decoration:
          //         BoxDecoration(border: Border.all(color: Colors.black)),
          //     child: SingleChildScrollView(
          //       // TODO : Hide the scroll bar
          //       scrollDirection: Axis.vertical,
          //       physics: const NeverScrollableScrollPhysics(),
          //       clipBehavior: Clip.hardEdge,
          //       child: Column(
          //         mainAxisAlignment:
          //             MainAxisAlignment.start, // Customize as needed
          //         crossAxisAlignment:
          //             CrossAxisAlignment.start, // Customize as needed
          //         children: childWidgets,
          //       ),
          //     ),
          //   ),
          // );
          break;
//TODO: divider is not visible when it is the direct child of any row we add

        case "Divider":
          currentWidget = CustomDivider(
              node: node,
              onTap: () {
                int? index = node['id'];
                final type = node['type'];
                _selectedWidgetType = type;
                final currentKey = customWidgetsGlobalKeysMap[index];
                _selectedWidgetKey = currentKey;
                notifyListeners();
              });

          break;
//TODO: vertical divider is not visible when it is the direct child of default column
        case "VerticalDivider":
          currentWidget = CustomVerticalDivider(
              node: node,
              onTap: () {
                int? index = node['id'];
                final type = node['type'];
                _selectedWidgetType = type;
                final currentKey = customWidgetsGlobalKeysMap[index];
                _selectedWidgetKey = currentKey;
                notifyListeners();
              });

          break;

        case "Icon":
          currentWidget = CustomIcon(node: node, onTap: () {});
          // InkWell(
          //     onTap: () {
          //       log("Hey icon");
          //     },
          //     child: const Icon(Icons
          //         .forest_outlined)); // Example: Set a default text, customize as needed
          break;
//TODO: what to do with widgets jo wrap k bahaar aa hrhe
//TODO: row inside wrap case
// Vertical divider inside wrap case
        case "Wrap":
          List<Widget> childWidgets = [];
          if (node.containsKey('child') && node['child'] is List) {
            node['child'].forEach((childNode) {
              for (var entry in childNode.entries) {
                childWidgets.add(buildWidget(entry.value));
              }
            });
          }
          currentWidget = CustomWrap(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                _selectedWidgetKey = currentKey;
                notifyListeners();
              },
              childWidgets: childWidgets);
          // InkWell(
          //   onTap: () {
          //     int? index = node['id'];
          //     final currentKey = customWidgetsGlobalKeysMap[index];
          //     _selectedWidgetKey = currentKey;
          //     notifyListeners();
          //   },
          //   child: Container(
          //     height: node['properties']['height'],
          //     width: double.infinity,
          //     decoration:
          //         BoxDecoration(border: Border.all(color: Colors.black)),
          //     child: Wrap(
          //       crossAxisAlignment: WrapCrossAlignment.center,
          //       children: childWidgets,
          //     ),
          //   ),
          // );
          break;
//TODO: spacer has problem(problem with row , column, wrap so completely)
        case "Spacer":
          currentWidget = CustomSpacer(
              node: node,
              onTap: () {}); // Example: Set a default text, customize as needed
          break;
        case "Image":
          currentWidget = CustomImage(node: node, onTap: () {});
          break;

        case "CircleImage":
          currentWidget = CustomCircleImage(node: node, onTap: () {});

          break;
        case "SvgPicture":
          currentWidget = CustomSvgPicture(node: node, onTap: () {});

          break;
        //TODO: overflow in case of timeline more than round in container,
        //TODO: try timeline in others
        case 'Timeline':
          List<Widget> childWidgets = [];
          if (node.containsKey('child') && node['child'] is List) {
            node['child'].forEach((childNode) {
              for (var entry in childNode.entries) {
                childWidgets.add(buildWidget(entry.value));
              }
            });
          }
          List<Widget> timelineChildren = [];
          if (node.containsKey('child') && node['child'] is List) {
            var children = node['child'];

            int childCount = children.length;
            for (int i = 0; i < childCount; i++) {
              timelineChildren.add(TimelineTile(
                  isFirst: i == 0,
                  isLast: i == childCount - 1,
                  beforeLineStyle: const LineStyle(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 30,
                    color: Colors.blue,
                    padding: EdgeInsets.all(8),
                  ),
                  endChild: buildWidget(children[i].values.first)
                  // Recursively build children widgets
                  ));
            }
          }
          currentWidget = CustomTimeline(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                _selectedWidgetKey = currentKey;
                notifyListeners();
              },
              childWidgets: timelineChildren);
          // InkWell(
          //     onTap: ,
          //     child: Column(children: timelineChildren));
          break;
//TODO: flip conflict with container inkwell
        case 'FlippableCard':
          var frontChild, backChild;
          if (node.containsKey('child') && node['child'] is List) {
            // Since 'child' is a list with two elements for front and back
            var frontData = node['child'][0]
                .values
                .first; // Access the first element's value
            var backData = node['child'][1]
                .values
                .first; // Access the second element's value

            frontChild = buildWidget(frontData);
            backChild = buildWidget(backData);
          }
          currentWidget = CustomFlippableCard(
              node: node, onTap: () {}, front: frontChild, back: backChild);
          // InkWell(
          //   onTap: () {
          //     log("hi");
          //   },
          //   child: FlipCard(
          //       fill: Fill.fillBack,
          //       direction: FlipDirection.HORIZONTAL,
          //       speed: 400,
          //       front: frontChild,
          //       back: backChild
          //       // front: Container(
          //       //   width: 100,
          //       //   height: 100,
          //       //   decoration: BoxDecoration(
          //       //     color: Colors.purple.shade300,
          //       //     borderRadius:const  BorderRadius.only(
          //       //       bottomLeft: Radius.circular(12),
          //       //       bottomRight: Radius.circular(12),
          //       //       topLeft: Radius.circular(12),
          //       //       topRight: Radius.circular(12),
          //       //     ),
          //       //   ),
          //       //   child: const Align(
          //       //     alignment: AlignmentDirectional(0, 0),
          //       //     child: Text(
          //       //       'Front',
          //       //     ),
          //       //   ),
          //       // ),
          //       // back: Container(
          //       //   width: 100,
          //       //   height: 100,
          //       //   decoration: BoxDecoration(
          //       //     color: Colors.purple.shade300,
          //       //     borderRadius: BorderRadius.only(
          //       //       bottomLeft: Radius.circular(12),
          //       //       bottomRight: Radius.circular(12),
          //       //       topLeft: Radius.circular(12),
          //       //       topRight: Radius.circular(12),
          //       //     ),
          //       //   ),
          //       //   child: const Align(
          //       //     alignment: AlignmentDirectional(0, 0),
          //       //     child: Text(
          //       //       'Back',
          //       //     ),
          //       //   ),
          //       // ),
          //       ),
          //); // Example: Set a default text, customize as needed
          break;

        case 'VideoPlayer':
          currentWidget = CustomVideoPlayer(
              node: node,
              onTap: () {}); // Example: Set a default text, customize as needed
          break;

        case 'PDFViewer':
          currentWidget = CustomPDFViewer(
              node: node,
              onTap: () {}); // Example: Set a default text, customize as needed
          break;

        case 'Tabbar':
          currentWidget = CustomTabbar(
              node: node,
              onTap: () {}); // Example: Set a default text, customize as needed
          break;

        case 'Hackathon Name':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        case 'Organization Name':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        case 'Start Date':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        case 'Deadline':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        case 'Team Size':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        case 'Brief':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        case 'Fee':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        case 'Total Rounds':
          currentWidget = CustomText(
              node: node,
              onTap: () {
                int? index = node['id'];
                final currentKey = customWidgetsGlobalKeysMap[index];
                final type = node['type'];
                _selectedWidgetType = type;
                _selectedWidgetKey = currentKey;
                notifyListeners();

                debugPrint("${_selectedWidgetType} ${_isColorSelected}");
              }); // Example: Set a default text, customize as needed
          break;

        default:
          currentWidget = const SizedBox(); // Fallback for unrecognized types
      }

      return currentWidget;
    }

    // Start building widgets from the root 'children'
    print("line 862");
    if (node.containsKey('children') && node['children'] is List) {
       print("line 864");
      for (var child in node['children']) {
        for (var entry in child.entries) {
          widgets.add(buildWidget(
            entry.value,
          ));
        }
      }
    }

    return widgets;
  }

  dynamic getPropertyValue(
    dynamic node,
    String key,
    String property,
  ) {
    // Recursive function to search for the node with the given key
    dynamic searchNode(dynamic node, String key, int depth) {
      if (node is Map) {
        if (node.containsKey(key)) {
          if (node[key]['properties'] != null) {
            return node[key]['properties'][property];
          }
          // return node; TODO
        } else {
          for (var value in node.values) {
            var result = searchNode(value, key, depth + 1);
            if (result != null) {
              return result;
            }
          }
        }
        // if (node.containsKey('children')) {
        //   for (var child in node['children']) {
        //     debugPrint('at 580');
        //     var result = searchNode(child, key);
        //     if (result != null) {
        //       return result;
        //     }
        //   }
        // }

        //  else if (node.containsKey('child') && node['child'].isNotEmpty()) {
        //   debugPrint('at 588');
        //   for (var child in node['child']) {
        //     debugPrint('at 590');
        //     var result = searchNode(child, key);
        //     if (result != null) {
        //       return result;
        //     }
        //   }
        // }
      } else if (node is List) {
        for (var element in node) {
          var result = searchNode(element, key, depth + 1);
          if (result != null) {
            return result;
          }
        }
      }
      return null;
    }

    return searchNode(_jsonObject['children'], key, 0);

    // Search for the node with the given key
    // var targetNode = searchNode(node, key);
    // debugPrint('target node : $targetNode');
    // debugPrint('target node key : ${targetNode[key]['properties']} ');

    // // Return the value of the specified property if the node is found
    // if (targetNode != null && targetNode[key].containsKey('properties')) {
    //   debugPrint('at 606');
    //   return targetNode[key]['properties'][property];
    // }

    // Return null if the node or property is not found
    //return null;
  }

  bool addPropertyByKey(
      String globalKey, String propertyType, dynamic property) {
    bool _searchAndAdd(
      dynamic node,
      String key,
      int depth,
    ) {
      if (node is Map) {
        if (node.containsKey(key)) {
          // print('prop. : ${node['key']['properties']}');
          // print('height : ${node['key']['properties']['height']}');
          if (node[key]['properties'] != null) {
            node[key]['properties'][propertyType] = property;
            notifyListeners();
            return true;
          }
        } else {
          log(" doesn't contained key");
          // Recursively search each value if the key is not found at this level
          for (var value in node.values) {
            log(" value : $value");
            log("***********");
            if (_searchAndAdd(
              value,
              key,
              depth + 1,
            )) {
              log("IM here 2");
              return true; // Indicating that a child was added or found empty
            }
          }
        }
      } else if (node is List) {
        for (var element in node) {
          if (_searchAndAdd(
            element,
            key,
            depth + 1,
          )) {
            log("IM here 3");
            return true; // Indicating that a child was added or found empty
          }
        }
      }
      return false;
    }

    return _searchAndAdd(
      _jsonObject["children"],
      globalKey,
      0,
    );
  }

















  bool deleteChildByKey(String globalKey) {
  // Log entry point
bool found = false; // Flag to check if the key has been found
  // Auxiliary recursive function to search and delete a node
  bool _searchAndDelete(dynamic node, String key, int depth) {
    if (node is Map) {
      
      if (node.containsKey(key)) {
        return true;
      }else {
          for (var value in node.values) {
            var result = _searchAndDelete(value, key, depth + 1);
            if (result ) {
              return result;
            }
          }
        }
          
    } else if (node is List) {
      // If the node is a List, iterate over elements
      for (var element in node) {
          var result = _searchAndDelete(element, key, depth + 1);
          if (result &&!found) {
            if(element[key]["type"] == "Deadline" ||
                element[key]["type"] ==
                    "Hackathon Name" ||
                element[key]["type"] ==
                    "Organization Name" ||
                element[key]["type"] == "Start Date" || element[key]["type"] == "Team Size"||
                element[key]["type"] == "Fee" ||
                element[key]["type"] == "Brief" || element[key]["type"] == "Total Rounds"){
              setRequiredHackathonDetailsAdded(element[key]["type"], false);
            }
            node.remove(element);
            deleteCustomGlobalKey(element[key]["id"]);
            selectedWidgetKey=null;
            found=true;

            return result;
          }
        }
    }
    return false;
  }

  // Start the deletion from the top-level 'children' node
  return _searchAndDelete(_jsonObject['children'], globalKey, 0);
}

































  void triggerUIUpdate() {
    notifyListeners();
  }

  bool get isColorSelected => _isColorSelected;
  bool get isColorPickerSelected => _isColorPickerSelected;

  void setIsColorSelected() {
    _isColorSelected = !_isColorSelected;
    notifyListeners();
  }

  bool get isPaddingSelected => _isPaddingSelected;

  void setPaddingSelected() {
    _isPaddingSelected = !_isPaddingSelected;
    notifyListeners();
  }

  bool get isAlignemntSelected => _isAlignmentSelected;

  void setIsAlignmentSelected() {
    _isAlignmentSelected = !_isAlignmentSelected;
    notifyListeners();
  }

  void toggleContainerShapeAlignment() {
    if (_selectedWidgetKey != null) {
      var currentShape =
          getPropertyValue(jsonObject, _selectedWidgetKey.toString(), "shape");

      switch (currentShape) {
        case 'circle':
          addPropertyByKey(
              _selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : _selectedWidgetKey.toString(),
              "shape",
              "square");
          break;

        default:
          addPropertyByKey(
              _selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : _selectedWidgetKey.toString(),
              "shape",
              "circle");
          break;
      }
      notifyListeners();
    }
  }

  IconData getContainerShapeIcon() {
    if (_selectedWidgetKey != null) {
      var currentShape =
          getPropertyValue(jsonObject, _selectedWidgetKey.toString(), "shape");

      switch (currentShape) {
        case 'circle':
          return Icons.circle;

        case 'square':
          return Icons.square;
      }
    }
    return Icons.square;
  }

  bool get isMarginSelected => _isMarginSelected;

  void setMarginSelected() {
    _isMarginSelected = !_isMarginSelected;
    notifyListeners();
  }

  void setIsColorPickerSelected() {
    _isColorPickerSelected = !_isColorPickerSelected;
    notifyListeners();
  }

  String _selectedFont = 'Fira Sans';

  String get selectedFont => _selectedFont;

  void setSelectedFont(String value) {
    _selectedFont = value;
    notifyListeners();
  }

  Map<GlobalKey, String> _originalTexts = {};

  // void convertAndRevertBackFromUpperCase(
  //     TextEditingController controller, String value) {
  //   var upperCase = getPropertyValue(jsonObject,selectedWidgetKey.toString(),
  //         "uppercase");

  //   if (upperCase) {
  //       // Store the original text before converting to uppercase
  //      addPropertyByKey(selectedWidgetKey == null
  //           ? customColumnKey.toString() : selectedWidgetKey.toString(),
  //       "uppercase",
  //       controller.text);

  //     controller.text = controller.text.toUpperCase();
  //   } else {
  //     // Transition from uppercase to non-uppercase
  //     if (_originalTexts.containsKey(key)) {
  //       String originalText = _originalTexts[key]!;
  //       String currentText = controller.text;

  //       // Reconstruct the text by applying deletions and additions to the original text
  //       String reconstructedText = reconstructText(originalText, currentText);

  //       controller.text = reconstructedText;
  //       _originalTexts.remove(key);
  //     }
  //   }
  // }

  String reconstructText(String originalText, String currentText) {
    // Convert the original text to uppercase for comparison
    String originalTextUpper = originalText.toUpperCase();

    // Find the common prefix and suffix between the original (in uppercase) and current text
    int prefixLength = 0;
    while (prefixLength < originalTextUpper.length &&
        prefixLength < currentText.length &&
        originalTextUpper[prefixLength] == currentText[prefixLength]) {
      prefixLength++;
    }

    int suffixLength = 0;
    while (suffixLength + prefixLength < originalTextUpper.length &&
        suffixLength + prefixLength < currentText.length &&
        originalTextUpper[originalTextUpper.length - suffixLength - 1] ==
            currentText[currentText.length - suffixLength - 1]) {
      suffixLength++;
    }

    // Reconstruct the text by keeping the original (non-uppercase) prefix and suffix,
    // and using the current text for the middle part
    String prefix = originalText.substring(0, prefixLength);
    String middle =
        currentText.substring(prefixLength, currentText.length - suffixLength);
    String suffix = originalText.substring(originalText.length - suffixLength);

    return prefix + middle + suffix;
  }

  bool _isBoldSelected = false;

  bool get isBoldSelected => _isBoldSelected;

  void setBoldSelection() {
    _isBoldSelected = !_isBoldSelected;
    notifyListeners();
  }

  Map<String, FontWeight> fontWeightMapping = {
    'Thin': FontWeight.w100,
    'Extra Light': FontWeight.w200,
    'Light': FontWeight.w300,
    'Regular': FontWeight.w400,
    'Medium': FontWeight.w500,
    'Semi Bold': FontWeight.w600,
    'Bold': FontWeight.w700,
    'Extra Bold': FontWeight.w800,
    'Black': FontWeight.w900,
  };

  void updateFontWeight(String fontWeightName) {
    final fontWeight = fontWeightMapping[fontWeightName];
    if (fontWeight != null && _selectedWidgetKey != null) {
      addPropertyByKey(
          selectedWidgetKey == null
              ? customColumnKey.toString()
              : selectedWidgetKey.toString(),
          'fontWeight',
          fontWeight.index * 100 + 100);
      notifyListeners();
    }
  }

  bool isFontWeightSelected(String fontWeightName) {
    if (_selectedWidgetKey != null) {
      final currentWeight = getPropertyValue(
          jsonObject, selectedWidgetKey.toString(), "fontWeight");
      return currentWeight == fontWeightMapping[fontWeightName];
    }
    return false;
  }

  FontWeight getSelectedTextFieldFontWeight(GlobalKey key) {
    int weightIndex = getPropertyValue(
        jsonObject, selectedWidgetKey.toString(), "fontWeight");
    return fontWeightFromInt(weightIndex);
  }

  FontWeight fontWeightFromInt(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }

  void toggleTextAlignment() {
    if (_selectedWidgetKey != null) {
      var currentAlignment =
          getPropertyValue(jsonObject, selectedWidgetKey.toString(), "align");

      switch (currentAlignment) {
        case 'left':
          addPropertyByKey(
              selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : selectedWidgetKey.toString(),
              'align',
              'center');
          break;
        case 'center':
          addPropertyByKey(
              selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : selectedWidgetKey.toString(),
              'align',
              'right');
          break;
        case 'right':
          addPropertyByKey(
              selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : selectedWidgetKey.toString(),
              'align',
              'justify');
          break;
        case 'justify':
          addPropertyByKey(
              selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : selectedWidgetKey.toString(),
              'align',
              'left');
          break;
        default:
          addPropertyByKey(
              selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : selectedWidgetKey.toString(),
              'align',
              'left');
          break;
      }
      notifyListeners();
    }
  }

  //Alignment icon for the respective alignment
  IconData getAlignmentIcon() {
    if (_selectedWidgetKey != null) {
      var currentAlignment =
          getPropertyValue(jsonObject, selectedWidgetKey.toString(), "align");

      switch (currentAlignment) {
        case 'left':
          return Icons.format_align_left_rounded;
        case 'right':
          return Icons.format_align_right_rounded;
        case 'center':
          return Icons.format_align_center_rounded;
        case 'justify':
          return Icons.format_align_justify_rounded;
      }
    }
    return Icons.format_align_center_rounded;
  }

  bool _isTextColorSelected = false;

  bool get isTextColorSelected => _isTextColorSelected;

  void setIsTextColorSelected() {
    _isTextColorSelected = !_isTextColorSelected;
    notifyListeners();
  }

  int _activeIndex = -1;

  get activeIndex => _activeIndex;

  void setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  String _propertyType = "";

  String get propertyType => _propertyType;

  void setPropertyType(String value) {
    _propertyType = value;
    notifyListeners();
  }
}
