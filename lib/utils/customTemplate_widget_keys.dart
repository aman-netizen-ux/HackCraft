import 'package:flutter/material.dart';

final customColumnKey = GlobalKey();

Map<int, GlobalKey> customWidgetsGlobalKeysMap = {};

// Function to add a new set of GlobalKeys for a given integer key
void addCustomGlobalKeys(int key) {
  print("Im here");
  customWidgetsGlobalKeysMap[key] = GlobalKey();
}

void deleteCustomGlobalKey(int key) {
  if (customWidgetsGlobalKeysMap.containsKey(key)) {
    customWidgetsGlobalKeysMap.remove(key);
  } else {
    print('Key $key not found in the map.');
  }
}
