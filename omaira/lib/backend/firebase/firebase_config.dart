import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAy6a7blri-eS5CEAyJCmfBtn_B7bVaq6o",
            authDomain: "omaira-m62k3n.firebaseapp.com",
            projectId: "omaira-m62k3n",
            storageBucket: "omaira-m62k3n.firebasestorage.app",
            messagingSenderId: "466026409727",
            appId: "1:466026409727:web:d04bcdb7d7b92d279426ca"));
  } else {
    await Firebase.initializeApp();
  }
}
