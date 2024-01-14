import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCpDaUYHutAU0K_JPIfqA9dlse75BRmwbU",
            authDomain: "dealsense-64d3a.firebaseapp.com",
            projectId: "dealsense-64d3a",
            storageBucket: "dealsense-64d3a.appspot.com",
            messagingSenderId: "662522172667",
            appId: "1:662522172667:web:ee22376042918f694b4c5e",
            measurementId: "G-QTL2Q7KZ3D"));
  } else {
    await Firebase.initializeApp();
  }
}
