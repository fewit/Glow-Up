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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

User? getAuthenticatedUser() {
  return FirebaseAuth.instance.currentUser;
}

Future<void> glowUpSetInOnline() async {
  User? authenticatedUser = getAuthenticatedUser();

  if (authenticatedUser != null) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(authenticatedUser.uid)
        .set({'Glow_Up_IsOnline': true}, SetOptions(merge: true));
  }
}
