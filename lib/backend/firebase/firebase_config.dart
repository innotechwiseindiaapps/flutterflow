import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB794TFCRuFjB8Wy3CGuly2DfjLQl9LR1Y",
            authDomain: "intern2success1-19b9c.firebaseapp.com",
            projectId: "intern2success1-19b9c",
            storageBucket: "intern2success1-19b9c.appspot.com",
            messagingSenderId: "379737562127",
            appId: "1:379737562127:web:59cbe22f90518cbe63d77a",
            measurementId: "G-G0WXNC0PRZ"));
  } else {
    await Firebase.initializeApp();
  }
}
