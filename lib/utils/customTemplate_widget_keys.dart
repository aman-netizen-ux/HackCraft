import 'package:flutter/material.dart';

final customColumnKey = GlobalKey();

Map<int, GlobalKey> customWidgetsGlobalKeysMap = {};

// Function to add a new set of GlobalKeys for a given integer key
void addCustomGlobalKeys(int key) {
  customWidgetsGlobalKeysMap[key] = GlobalKey();
}
