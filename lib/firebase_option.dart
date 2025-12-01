import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform => android;

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAln4Uwi1CGHHWUd01bMWg-vLXriM0pue0',
    appId: '1:642690712743:android:b31c6d6ce1f071ea2ec782',
    messagingSenderId: '642690712743',
    projectId: 'edumeet-1c624',
    storageBucket: 'edumeet-1c624.firebasestorage.app',
  );
}
