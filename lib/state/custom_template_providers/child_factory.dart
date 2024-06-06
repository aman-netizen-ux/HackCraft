import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';

class ChildFactory {
  Color generateRandomColor() {
    final math.Random random = math.Random();
    int a = random.nextInt(256);
    int r = random.nextInt(256);
    int g = random.nextInt(256);
    int b = random.nextInt(256);
    return Color.fromARGB(a, r, g, b);
  }

  Map<String, dynamic> createChild(
      String type, String key, int id, bool isMargin) {
    Map<String, dynamic> baseChild = {
      key: {"id": id, "type": type, "properties": {}, "child": []}
    };

    switch (type) {
      case "Container":
        baseChild[key]!['properties'] = {
          "height": isMargin ? 100 : 300,
          "color": generateRandomColor().toString(),
          "width": isMargin ? 100 : 300,
          "margin": [0, 0, 0, 0],
          "padding": [0, 0, 0, 0],
          "alignment": [0, 0],
          "shape": "square",
          "borderWidth": 0,
          "borderRadius": 0,
          "borderColor": generateRandomColor().toString(),
          "shadowColor": generateRandomColor().toString(),
        };
        break;
      case "Text":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
          "text": "Dynamic Text",
          "hint":"Add your text",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 0,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;

      case "Row":
        baseChild[key]!['properties'] = {
          "mainAxisAlignment": 'Start',
          "crossAxisAlignment": 'Start',
        };
        break;

      case "Column":
        baseChild[key]!['properties'] = {
          "mainAxisAlignment": 'Start',
          "crossAxisAlignment": 'Start',
        };
        break;

      case "Divider":
        baseChild[key]!['properties'] = {
          "thickness": 1,
          //"color": generateRandomColor().toString(),
          "dividerHeight": 10,
          "indent": 0,
          "endIndent": 0
        };
        break;

      case "VerticalDivider":
        baseChild[key]!['properties'] = {
          "thickness": 10,
          //"color": generateRandomColor().toString(),
          "verticalDividerWidth": 5,
          "indent": 0,
          "endIndent": 0
        };
        break;

      case "Icon":
        break;

      case "Wrap":
        baseChild[key]!['properties'] = {
          "height": 150,
        };
        break;

      case "Spacer":
        break;

      case "Image":
        break;

      case "CircleImage":
        break;

      case "SvgPicture":
        break;

      case "Timeline":
        addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
        var defaultChild = createChild(
            'Container',
            customWidgetsGlobalKeysMap[customWidgetsGlobalKeysMap.length - 1]!
                .toString(),
            id + 1,
            false);
        baseChild[key]!['child']!.add(defaultChild);
        break;

      case "FlippableCard":
        addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
        addCustomGlobalKeys(customWidgetsGlobalKeysMap.length);
        var defaultChild1 = createChild(
            'Container',
            customWidgetsGlobalKeysMap[customWidgetsGlobalKeysMap.length - 2]!
                .toString(),
            id + 1,
            false);
        var defaultChild2 = createChild(
            'Container',
            customWidgetsGlobalKeysMap[customWidgetsGlobalKeysMap.length - 1]!
                .toString(),
            id + 2,
            false);
        baseChild[key]!['child']!.add(defaultChild1);
        baseChild[key]!['child']!.add(defaultChild2);
        break;

      case "VideoPlayer":
        break;

      case "PDFViewer":
        break;

      case "Tabbar":
        break;

      case "Hackathon Name":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
          "text":"",
          "hint": "Add your Hackathon Name",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 19,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;

      case "Start Date":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
           "text":"",
          "hint": "Add hackathon start date",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 19,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;

      case "Organization Name":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
           "text":"",
          "hint": "Add your oranization name",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 19,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;

      case "Deadline":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
           "text":"",
          "hint": "Add hackathon deadline",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 19,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;

      case "Team Size":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
           "text":"",
          "hint": "Add hackathon team Size",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 19,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;

      case "Brief":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
           "text":"",
          "hint": "Add hackathon brief",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 19,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;

      case "Fee":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
           "text":"",
          "hint": "Add hackathon fee",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 19,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;

      case "Total Rounds":
        // Add specific properties for Text if necessary
        baseChild[key]!['properties'] = {
           "text":"",
          "hint": "Add hackathon total rounds",
          "fontSize": 20,
          "color": "Color(0xff1a202c)",
          "font": 'Fira Sans',
          "letterSpacing": 0,
          "lineHeight": 19,
          "strikethrough": false,
          "italics": false,
          "underline": false,
          "fontWeight": 200,
          "uppercase": false,
          "align": "left"
        };
        break;
      // Add other cases for each type
    }
    return baseChild;
  }
}
