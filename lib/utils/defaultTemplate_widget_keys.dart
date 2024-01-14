import 'package:flutter/material.dart';

// unique global keys for all the textformField Widgets in DefaultEdit Portal to get and set their properties
final organisationKey = GlobalKey();
final hackathonNameKey = GlobalKey();
final hackathonStartDateKey= GlobalKey();
final modeOfConductKey = GlobalKey();
final participationFeeKey = GlobalKey();
final teamSizeKey = GlobalKey();
final venueKey = GlobalKey();
final briefKey = GlobalKey();
final descriptionKey = GlobalKey();
final contactName1Key = GlobalKey();
final contactName2Key = GlobalKey();
final contactNumber1Key = GlobalKey();
final contactNumber2Key = GlobalKey();

// final round1NameKey = GlobalKey();
// final round1DescriptionKey = GlobalKey();
// final round1StartDateKey = GlobalKey();
// final round1EndDateKey = GlobalKey();


// Define the nested map
Map<int, Map<String, GlobalKey>> roundGlobalKeysMap = {
0:{
  'roundName': GlobalKey(),
    'roundDescription': GlobalKey(),
    'roundStartDate': GlobalKey(),
    'roundEndDate': GlobalKey(),
},

};

// Function to add a new set of GlobalKeys for a given integer key
void addGlobalKeys(int key) {
  roundGlobalKeysMap[key] = {
    'roundName': GlobalKey(),
    'roundDescription': GlobalKey(),
    'roundStartDate': GlobalKey(),
    'roundEndDate': GlobalKey(),
  };
}

void deleteGlobalKeys(int key) {
  roundGlobalKeysMap.remove(key);
}
 





