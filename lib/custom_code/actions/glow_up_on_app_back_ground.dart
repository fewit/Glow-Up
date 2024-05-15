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

// 获取已验证用户信息
User? getAuthenticatedUser() {
  return FirebaseAuth.instance.currentUser;
}

Future<void> glowUpOnAppBackGround() async {
  User? authenticatedUser = getAuthenticatedUser();

  if (authenticatedUser != null) {
    WidgetsBinding.instance.addObserver(
      AppLifecycleObserver(authenticatedUser),
    );
  }
}

class AppLifecycleObserver with WidgetsBindingObserver {
  final User authenticatedUser;

  AppLifecycleObserver(this.authenticatedUser);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //如果退出APP，设置登录状态为false
    if (state == AppLifecycleState.detached) {
      // Do something when app is paused
      FirebaseFirestore.instance
          .collection('users')
          .doc(authenticatedUser.uid)
          .set({'Glow_Up_IsOnline': false, 'Glow_Up_InChatRoom': null},
              SetOptions(merge: true));
    }
  }
}
