import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBIJofOAFdSXg3_2gYHoppNeaycXXWBPNE",
            authDomain: "recipesai-251c4.firebaseapp.com",
            projectId: "recipesai-251c4",
            storageBucket: "recipesai-251c4.firebasestorage.app",
            messagingSenderId: "523608394516",
            appId: "1:523608394516:web:9635898195975863589001"));
  } else {
    await Firebase.initializeApp();
  }
}
