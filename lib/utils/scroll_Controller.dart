import 'package:flutter/material.dart';

final home = GlobalKey();
final rulesAndRounds = GlobalKey();
final aboutUs = GlobalKey();
final gallery = GlobalKey();
final contactUs = GlobalKey();


final homeEdit = GlobalKey();
final rulesAndRoundsEdit = GlobalKey();
final aboutUsEdit = GlobalKey();
final galleryEdit = GlobalKey();
final contactUsEdit = GlobalKey();

Future scrollToItem(itemKey) async {
  await Scrollable.ensureVisible(itemKey.currentContext!,
      duration: const Duration(seconds: 1));
}
