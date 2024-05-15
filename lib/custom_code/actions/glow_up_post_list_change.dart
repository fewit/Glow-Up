// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> glowUpPostListChange(
  BuildContext context,
  List<String> glowUpPostList,
  String glowUpPostedPath,
) async {
  // Insert the posted path before the last item in the list
  int lastIndex = glowUpPostList.length - 1;
  glowUpPostList.insert(lastIndex, glowUpPostedPath);
  return glowUpPostList;
}
