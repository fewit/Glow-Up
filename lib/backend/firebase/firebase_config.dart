import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDCFeufP401hHkczzfZ5VoctRgXO8LjOW8",
            authDomain: "glow-u-p-dskwjr.firebaseapp.com",
            projectId: "glow-u-p-dskwjr",
            storageBucket: "glow-u-p-dskwjr.appspot.com",
            messagingSenderId: "427314156133",
            appId: "1:427314156133:web:8b584361a30ae94476ac8c"));
  } else {
    await Firebase.initializeApp();
  }
}
