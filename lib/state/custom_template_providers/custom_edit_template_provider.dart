import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';

class CustomEditPortal extends ChangeNotifier{
  List<Widget> _customWidgetList = [];
  
  GlobalKey? _selectedWidgetKey;

  GlobalKey? get selectedWidgetKey => _selectedWidgetKey;

  set selectedWidgetKey(GlobalKey? value) {
    _selectedWidgetKey = value;
    notifyListeners();
  }

  List<Widget> get customWidgetList => _customWidgetList;

  void updateWidgetList(Widget widget){
    _customWidgetList.add(widget);
    notifyListeners();
  }


  Map<String, dynamic> _jsonObject = {
    "id": 78,
    "key": customColumnKey,
    "children": [],
  };
 Map<String, dynamic> get jsonObject=>_jsonObject;



// {
//     "id": 78,
//     "key": customColumnKey,
//     "children": [
//    "90uiop": {
    //   "id": id,
    //   "properties": {},
    //   "child": ["78hj9": {
    //   "id": id,
    //   "properties": {},
    //   "child": []
    // },
    // 
    // "hj9op": {
    //   "id": id,
    //   "properties": {},
    //   "child": []
    // }]
    // },

    // "jk907": {
    //   "id": id,
    //   "properties": {},
    //   "child": []
    // }
// 
// ],
//   };













   void addChild(int id, GlobalKey globalKey) {
  print('Global key in add child: $globalKey');
  Map<String, dynamic> newChild = {
    globalKey.toString(): {
      "id": id,
      "properties": {},
      "child": [] // Using a list for potential multiple children
    }
  };
  _jsonObject["children"]["gloabalkey"]['child'].add(newChild);
  notifyListeners(); // Notify all listening widgets of the update
}


  int? findIdByKey(String globalKey) {
    for (var child in _jsonObject["children"]) {
      if (child.values.first["key"] == globalKey) {
        return child.values.first["id"];
      }
    }
    return null; // Return null if no matching key is found
  }

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


bool checkAndChildByKey(String globalKey) {
  // Define an auxiliary function to handle recursion
  bool _search(dynamic node, String key) {
    if (node is Map) {
      // If the node is a Map and contains the key directly
      if (node.containsKey(key)) {
        // Check if 'child' related to this key is empty
        return node[key]['child'].isEmpty;
      } else {
        // Recursively search each value if the key is not found at this level
        for (var value in node.values) {
          if (_search(value, key)) {
            return true;
          }
        }
      }
    } else if (node is List) {
      // If the node is a List, iterate and search each element
      for (var element in node) {
        if (_search(element, key)) {
          return true;
        }
      }
    }
    // Key not found in the current path
    return false;
  }

  // Start the search from the top level 'children'
  return _search(_jsonObject["children"], globalKey);
}


bool addOrCheckChildByKey(String newglobalKey, int id , String globalKey, String type) {
  
  print('hi globalkey $globalKey');
  Map<String, dynamic> newChild = {
    newglobalKey.toString(): {
      "id": id,
      "type": type,
      "properties": {},
      "child": [] // Using a list for potential multiple children
    }
  };
  // Define an auxiliary function to handle recursion and potentially add a new child
  bool _searchAndAdd(dynamic node, String key, Map<String, dynamic>? childToAdd) {

    if(globalKey==customColumnKey.toString()){
      _jsonObject["children"].add(newChild);
    }else if (node is Map) {
      // If the node is a Map and contains the key directly

      if (node.containsKey(key)) {
        // Check if 'child' related to this key is empty
        if (node[key]['child'].isEmpty && childToAdd != null) {
          // The 'child' list is empty, and we have a new child to add
          node[key]['child'].add(childToAdd);
          return true; // Indicating that a child was added
        }
        return node[key]['child'].isEmpty; // Return true if empty, even if no child was added
      } else {
        // Recursively search each value if the key is not found at this level
        for (var value in node.values) {
          if (_searchAndAdd(value, key, childToAdd)) {
            return true; // Indicating that a child was added or found empty
          }
        }
      }
    } else if (node is List) {
      // If the node is a List, iterate and search each element
      for (var element in node) {
        if (_searchAndAdd(element, key, childToAdd)) {
          return true; // Indicating that a child was added or found empty
        }
      }
    }
    // Key not found in the current path, or no action was taken
    return false;
  }

  // Start the search from the top level 'children', attempting to add the new child if conditions are met
  return _searchAndAdd(_jsonObject["children"], globalKey, newChild);
}

















Widget buildWidgetsFromJson(dynamic node) {
  // Base case: If the node is not a Map, it might be a string or final widget description
  if (node is! Map) {
    return SizedBox(); // Or some other default widget
  }

  // Example of handling a simple structure with 'Container' as a type indicator
  if (node.containsKey('type') && node['type'] == 'Container') {
    return Container(

      height: 60,
      width: 150,
      color: Colors.blue.shade300
    );
    
    // Container(
    //   // Assuming 'properties' contains keys like 'color', 'padding', etc.
    //   color: node['properties']['color'] ?? Colors.white,
    //   padding: EdgeInsets.all(node['properties']['padding'] ?? 0),
    //   child: node['child'] != null
    //       ? buildWidgetsFromJson(node['child']) // Recursively build child widgets
    //       : null,
    // );
  }else if (node.containsKey('type') && node['type'] == 'Text') {
    return Text("Hi a new widget");
    
    
    
   
  }else{
    return Text(" error");
  }
  
  // Handle other widget types similarly...
  
  // Fallback for unrecognized node types
  return SizedBox();
}



}