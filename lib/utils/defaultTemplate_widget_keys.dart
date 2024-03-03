import 'package:flutter/material.dart';

// unique global keys for all the textformField Widgets in DefaultEdit Portal to get and set their properties
final organisationKey = GlobalKey();
final hackathonNameKey = GlobalKey();
final hackathonStartDateKey = GlobalKey();
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
final landingContainerKey = GlobalKey();
final dateContainerKey = GlobalKey();
final modeOfConductContainerKey = GlobalKey();
final participationFeeContainerKey = GlobalKey();
final teamSizeContainerKey = GlobalKey();
final registrationCountContainerKey = GlobalKey();
final aboutContainerKey = GlobalKey();
final getRegisteredContainerKey = GlobalKey();

// Define the nested map for round textFields
Map<int, Map<String, GlobalKey>> roundGlobalKeysMap = {
  0: {
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
  // Check if the map contains the key to be deleted.
  if (roundGlobalKeysMap.containsKey(key)) {
    // Remove the key-value pair.
    roundGlobalKeysMap.remove(key);

    // Iterate over the map to shift the keys of the elements after the removed key.
    for (int i = key + 1; i <= roundGlobalKeysMap.length + key; i++) {
      // If the next key exists, move its value to the previous key.
      if (roundGlobalKeysMap.containsKey(i)) {
        roundGlobalKeysMap[i - 1] = roundGlobalKeysMap[i]!;
        // Remove the current key after its value has been moved.
        roundGlobalKeysMap.remove(i);
      }
    }
  }
}

// Define the nested map for round containers
Map<int, Map<String, GlobalKey>> roundContainerGlobalKeysMap = {
  0: {
    'roundNameContainer': GlobalKey(),
    'roundDescriptionContainer': GlobalKey(),
  },
};

// Function to add a new set of GlobalKeys for a given integer key
void addContainerGlobalKeys(int key) {
  roundContainerGlobalKeysMap[key] = {
    'roundNameContainer': GlobalKey(),
    'roundDescriptionContainer': GlobalKey(),
  };
}

void deleteContainerGlobalKeys(int key) {
  // Check if the map contains the key to be deleted.
  if (roundContainerGlobalKeysMap.containsKey(key)) {
    // Remove the key-value pair.
    roundContainerGlobalKeysMap.remove(key);

    // Iterate over the map to shift the keys of the elements after the removed key.
    for (int i = key + 1; i <= roundContainerGlobalKeysMap.length + key; i++) {
      // If the next key exists, move its value to the previous key.
      if (roundContainerGlobalKeysMap.containsKey(i)) {
        roundContainerGlobalKeysMap[i - 1] = roundContainerGlobalKeysMap[i]!;
        // Remove the current key after its value has been moved.
        roundContainerGlobalKeysMap.remove(i);
      }
    }
  }
}
