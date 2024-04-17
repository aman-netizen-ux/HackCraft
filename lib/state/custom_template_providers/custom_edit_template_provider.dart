import 'dart:math' as math;
import 'dart:developer';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:timeline_tile/timeline_tile.dart';

//TODO: clean up the code

class CustomEditPortal extends ChangeNotifier {
  List<Widget> _dynamicWidgets = [const SizedBox()];
  List<Widget> get dynamicWidgets => _dynamicWidgets;

  set dynamicWidgets(List<Widget> widgets) {
    _dynamicWidgets = widgets;
    notifyListeners();
  }

  GlobalKey? _selectedWidgetKey;

  GlobalKey? get selectedWidgetKey => _selectedWidgetKey;

  set selectedWidgetKey(GlobalKey? value) {
    _selectedWidgetKey = value;
    notifyListeners();
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
    Map<String, dynamic> defaultChild={};

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
        if (type == "Container") {
          log("Im loging first container");
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {
                "height": 300,
                "color": generateRandomColor().toString(),
                "width": 300,
                "margin": 0
              },
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Text") {
          newChild = textChild;
        } else if (type == "Row") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Column") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Divider") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": []
            }
          };
        } else if (type == "VerticalDivider") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Icon") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Wrap") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {
                "height": 150,
              },
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Spacer") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Image") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "CircleImage") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "SvgPicture") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Timeline") {
          addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [
               
                    
              ] // Using a list for potential multiple children
            }
          };
          defaultChild={
             customWidgetsGlobalKeysMap[
                          customWidgetsGlobalKeysMap.length - 1]!.toString(): {
              "id": id+1,
              "type": "Container",
              "properties": {
                "height": 300,
                "color": generateRandomColor().toString(),
                "width": 300,
                "margin": 0
              },
              "child": [] // Using a list for potential multiple children
            }
          };

           newChild[newglobalKey.toString()]['child'].add(defaultChild);

         // TODO: make it like above timeline
        } else if (type == "FlippableCard") {
          addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
          addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [
                {
                  customWidgetsGlobalKeysMap[
                          customWidgetsGlobalKeysMap.length - 2]!
                      .toString(): {
                    "id": id + 1,
                    "type": "Container",
                    "properties": {
                      "height": 100,
                      "color": generateRandomColor().toString(),
                      "width": 100,
                      "margin": 20
                    },
                    "child": [] // Using a list for potential multiple children
                  }
                },
                {
                  customWidgetsGlobalKeysMap[
                          customWidgetsGlobalKeysMap.length - 1]!
                      .toString(): {
                    "id": id + 2,
                    "type": "Container",
                    "properties": {
                      "height": 100,
                      "color": generateRandomColor().toString(),
                      "width": 100,
                      "margin": 20
                    },
                    "child": [] // Using a list for potential multiple children
                  }
                }
              ] // Using a list for potential multiple children
            }
          };
        } else if (type == "VideoPlayer") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "PDFViewer") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        } else if (type == "Tabbar") {
          newChild = {
            newglobalKey.toString(): {
              "id": id,
              "type": type,
              "properties": {},
              "child": [] // Using a list for potential multiple children
            }
          };
        }
        _jsonObject["children"].add(newChild);
        return true;
      } else if (node is Map) {
        // If the node is a Map and contains the key directly
        log("Im in map");

        if (node.containsKey(key)) {
          // Check if 'child' related to this key is empty

          log("Hellllllllllllllllllo contaqins key : ${node[key]['type']}");
          String parentType = node[key]['type'];
          if (type == "Container") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {
                  "height": 100,
                  "color": generateRandomColor().toString(),
                  "width": 100,
                  "margin": 20
                },
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Text") {
            childToAdd = textChild;
          } else if (type == "Row") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Column") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Divider") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "VerticalDivider") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Icon") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Wrap") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {
                  "height": null,
                },
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Spacer") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Image") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "CircleImage") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "SvgPicture") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Timeline") {
            addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [
                   
                ] // Using a list for potential multiple children
              }
            };

             defaultChild={
             customWidgetsGlobalKeysMap[
                          customWidgetsGlobalKeysMap.length - 1]!.toString(): {
              "id": id+1,
              "type": "Container",
              "properties": {
                "height": 300,
                "color": generateRandomColor().toString(),
                "width": 300,
                "margin": 0
              },
              "child": [] // Using a list for potential multiple children
            }
          };

           childToAdd[newglobalKey.toString()]['child'].add(defaultChild);
          } else if (type == "FlippableCard") {
            addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [
                  {
                    customWidgetsGlobalKeysMap[
                            customWidgetsGlobalKeysMap.length - 2]!
                        .toString(): {
                      "id": id + 1,
                      "type": "Container",
                      "properties": {
                        "height": 100,
                        "color": generateRandomColor().toString(),
                        "width": 100,
                        "margin": 20
                      },
                      "child":
                          [] // Using a list for potential multiple children
                    }
                  },
                  {
                    customWidgetsGlobalKeysMap[
                            customWidgetsGlobalKeysMap.length - 1]!
                        .toString(): {
                      "id": id + 2,
                      "type": "Container",
                      "properties": {
                        "height": 100,
                        "color": generateRandomColor().toString(),
                        "width": 100,
                        "margin": 20
                      },
                      "child":
                          [] // Using a list for potential multiple children
                    }
                  }
                ] // Using a list for potential multiple children
              }
            };
          } else if (type == "VideoPlayer") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "PDFViewer") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          } else if (type == "Tabbar") {
            childToAdd = {
              newglobalKey.toString(): {
                "id": id,
                "type": type,
                "properties": {},
                "child": [] // Using a list for potential multiple children
              }
            };
          }
          log("type : $type");
          log(" demn ${node[key]['child']} ");
                    log(" ohh $childToAdd   ");

          log(" mad  ${node[key]['child'].isEmpty}  ");

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

  List<Widget> buildWidgetsFromJson(dynamic node) {
    List<Widget> widgets = [];

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

    // Function to recursively build widgets
    Widget buildWidget(
      dynamic node,
    ) {
      if (!node.containsKey('type')) return SizedBox();

      Widget currentWidget;
      log(node['type']);

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
          currentWidget = InkWell(
            onTap: () {
              int? index = node['id'];
              log('index : $index');

              final currentKey = customWidgetsGlobalKeysMap[index];
              log('currentkey in provider: $currentKey');
              _selectedWidgetKey = currentKey;
              notifyListeners();
              log("*******${node['properties']['height']}**************${node['properties']['width']}***************");
            },
            child: Container(
              height: node['properties']['height'],
              width: node['properties']['width'],
              margin: EdgeInsets.all(node['properties']['margin']),
              color: stringToColor(node['properties'][
                  'color']), // Example: Set a default color, customize as needed
              child: childWidgets.isEmpty
                  ? null
                  : (childWidgets.length == 1
                      ? childWidgets.first
                      : Column(children: childWidgets)),
            ),
          );
          break;
        case 'Text':
          currentWidget = InkWell(
              onTap: () {
                log("hi");
              },
              child: Text(
                  "Dynamic Text")); // Example: Set a default text, customize as needed
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
          currentWidget = InkWell(
            onTap: () {
              int? index = node['id'];
              log(' index at 315 : $index');

              final currentKey = customWidgetsGlobalKeysMap[index];
              log('currentkey in provider: $currentKey');
              log("Row");
              _selectedWidgetKey = currentKey;
              notifyListeners();
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: childWidgets,
                ),
              ),
            ),
          );
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
          currentWidget = InkWell(
            onTap: () {
              int? index = node['id'];
              log(' index at 356 : $index');

              final currentKey = customWidgetsGlobalKeysMap[index];
              log('currentkey in provider: $currentKey');
              log("Column");
              _selectedWidgetKey = currentKey;
              notifyListeners();
            },
            child: Container(
              height: 300,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: SingleChildScrollView(
                // TODO : Hide the scroll bar
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Customize as needed
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Customize as needed
                  children: childWidgets,
                ),
              ),
            ),
          );
          break;
//TODO: divider is not visible when it is the direct child of any row we add

        case "Divider":
          currentWidget = InkWell(
              onTap: () {
                log("divideddddddddddd");
              },
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
              )); // Example: Set a default text, customize as needed
          break;
//TODO: vertical divider is not visible when it is the direct child of default column
        case "VerticalDivider":
          currentWidget = InkWell(
              onTap: () {
                log("verically divideddddddddddd");
              },
              child: const VerticalDivider(
                color: Colors.grey,
                thickness: 1,
              )); // Example: Set a default text, customize as needed
          break;

        case "Icon":
          currentWidget = InkWell(
              onTap: () {
                log("Hey icon");
              },
              child: const Icon(Icons
                  .forest_outlined)); // Example: Set a default text, customize as needed
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
          currentWidget = InkWell(
            onTap: () {
              int? index = node['id'];
              log(' index at 315 : $index');

              final currentKey = customWidgetsGlobalKeysMap[index];
              log('currentkey in provider: $currentKey');
              log("You got Wrappppped");
              _selectedWidgetKey = currentKey;
              notifyListeners();
            },
            child: Container(
              height: node['properties']['height'],
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: childWidgets,
              ),
            ),
          );
          break;
//TODO: spacer has problem(problem with row , column, wrap so completely)
        case "Spacer":
          currentWidget = InkWell(
              onTap: () {
                log("I need some space");
              },
              child:
                  const Spacer()); // Example: Set a default text, customize as needed
          break;
        case "Image":
          currentWidget = InkWell(
              onTap: () {
                log("have a look at me");
              },
              child: Image.asset(
                  "assets/images/defaultTemplate/GalleryImage.png"));
          break;

        case "CircleImage":
          currentWidget = InkWell(
              onTap: () {
                log("have a look at me");
              },
              child: const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(
                    "assets/images/defaultTemplate/GalleryImage.png"), // Assuming the path is a constant
              ));

          break;
        case "SvgPicture":
          currentWidget = InkWell(
              onTap: () {
                log("have a look at me");
              },
              child: SvgPicture.asset(
                  "assets/images/defaultTemplate/clickme.svg"));

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
            log("childCount ${childCount}");
            for (int i = 0; i < childCount ; i++) {
                            log("index $i");

              log("length ${children.length}");
              //  log("childrenn at 832: ${children.length>0? children : ""}");
              //    log("childrenn[i] at 832: ${children.length>0? children[i] : ""}");
              // log("childrennnnnnnnnnn: ${children.length>0? children[i].values: ""}");
              // log("childrennnnnnnnnnn at 837: ${children.length>0? children[i].values.first: ""}");

              timelineChildren.add(TimelineTile(
                isFirst: i == 0,
                isLast: i == childCount-1,
                beforeLineStyle: const LineStyle(
                  color: Colors.grey,
                  thickness: 2,
                ),
                indicatorStyle: const IndicatorStyle(
                  width: 30,
                  color: Colors.blue,
                  padding: EdgeInsets.all(8),
                ),
                endChild:  buildWidget(children[i].values.first)
                    // Recursively build children widgets
              ));
            }
          }
          currentWidget = InkWell(
              onTap: () {
                int? index = node['id'];

                final currentKey = customWidgetsGlobalKeysMap[index];
                log('currentkey in provider: $currentKey');
                log("timeline");
                _selectedWidgetKey = currentKey;
                notifyListeners();
              },
              child: Column(children: timelineChildren));
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
          currentWidget = InkWell(
            onTap: () {
              log("hi");
            },
            child: FlipCard(
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                speed: 400,
                front: frontChild,
                back: backChild
                // front: Container(
                //   width: 100,
                //   height: 100,
                //   decoration: BoxDecoration(
                //     color: Colors.purple.shade300,
                //     borderRadius:const  BorderRadius.only(
                //       bottomLeft: Radius.circular(12),
                //       bottomRight: Radius.circular(12),
                //       topLeft: Radius.circular(12),
                //       topRight: Radius.circular(12),
                //     ),
                //   ),
                //   child: const Align(
                //     alignment: AlignmentDirectional(0, 0),
                //     child: Text(
                //       'Front',
                //     ),
                //   ),
                // ),
                // back: Container(
                //   width: 100,
                //   height: 100,
                //   decoration: BoxDecoration(
                //     color: Colors.purple.shade300,
                //     borderRadius: BorderRadius.only(
                //       bottomLeft: Radius.circular(12),
                //       bottomRight: Radius.circular(12),
                //       topLeft: Radius.circular(12),
                //       topRight: Radius.circular(12),
                //     ),
                //   ),
                //   child: const Align(
                //     alignment: AlignmentDirectional(0, 0),
                //     child: Text(
                //       'Back',
                //     ),
                //   ),
                // ),
                ),
          ); // Example: Set a default text, customize as needed
          break;

        case 'VideoPlayer':
          currentWidget = InkWell(
              onTap: () {
                log("hi");
              },
              child: Text(
                  "VideoPlayer")); // Example: Set a default text, customize as needed
          break;

        case 'PDFViewer':
          currentWidget = InkWell(
              onTap: () {
                log("hi");
              },
              child: Text(
                  "PDFViewer")); // Example: Set a default text, customize as needed
          break;

        case 'Tabbar':
          currentWidget = InkWell(
              onTap: () {
                log("hi");
              },
              child: Text(
                  "Tabbar")); // Example: Set a default text, customize as needed
          break;

        default:
          currentWidget = const SizedBox(); // Fallback for unrecognized types
      }

      return currentWidget;
    }

    // Start building widgets from the root 'children'
    if (node.containsKey('children') && node['children'] is List) {
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

//    void addChild(int id, GlobalKey globalKey) {
//   log('Global key in add child: $globalKey');
//   Map<String, dynamic> newChild = {
//     globalKey.toString(): {
//       "id": id,
//       "properties": {},
//       "child": [] // Using a list for potential multiple children
//     }
//   };
//   _jsonObject["children"]["gloabalkey"]['child'].add(newChild);
//   notifyListeners(); // Notify all listening widgets of the update
// }

  // int? findIdByKey(String globalKey) {
  //   for (var child in _jsonObject["children"]) {
  //     if (child.values.first["key"] == globalKey) {
  //       return child.values.first["id"];
  //     }
  //   }
  //   return null; // Return null if no matching key is found
  // }

//   bool checkAndChildByKey(String globalKey) {
//   for (var child in _jsonObject["children"]) {
//     // The child is now a map where the key is the GlobalKey's toString value
//     if (child.containsKey(globalKey)) {
//       // Access the child using its GlobalKey string
//       var foundChild = child[globalKey];
//       // Check if this child has its own "children" list and if it's empty
//       return foundChild["child"].isEmpty;
//     }
//   }
//   return true; // Return true if no matching key is found, indicating "empty"
// }

// bool checkAndChildByKey(String globalKey) {
//   // Define an auxiliary function to handle recursion
//   bool _search(dynamic node, String key) {
//     if (node is Map) {
//       // If the node is a Map and contains the key directly
//       if (node.containsKey(key)) {
//         // Check if 'child' related to this key is empty
//         return node[key]['child'].isEmpty;
//       } else {
//         // Recursively search each value if the key is not found at this level
//         for (var value in node.values) {
//           if (_search(value, key)) {
//             return true;
//           }
//         }
//       }
//     } else if (node is List) {
//       // If the node is a List, iterate and search each element
//       for (var element in node) {
//         if (_search(element, key)) {
//           return true;
//         }
//       }
//     }
//     // Key not found in the current path
//     return false;
//   }

//   // Start the search from the top level 'children'
//   return _search(_jsonObject["children"], globalKey);
// }
}
