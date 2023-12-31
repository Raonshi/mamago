// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBFiSpLmjyq8CF9c28mMfoQoYthqXIjW14',
    appId: '1:1071416051233:web:b6e8bd535bb92a02120560',
    messagingSenderId: '1071416051233',
    projectId: 'mamago-bf7f1',
    authDomain: 'mamago-bf7f1.firebaseapp.com',
    storageBucket: 'mamago-bf7f1.appspot.com',
    measurementId: 'G-KTHL2HE3HK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwNVPWo24D5Yt0fdbm1cSfEnCKaUPWdKQ',
    appId: '1:1071416051233:android:4d5a27cc4600f4b3120560',
    messagingSenderId: '1071416051233',
    projectId: 'mamago-bf7f1',
    storageBucket: 'mamago-bf7f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAo6c3BDmyYkTevyDoLtph6waj5hSGhOKw',
    appId: '1:1071416051233:ios:2e045bef425ce802120560',
    messagingSenderId: '1071416051233',
    projectId: 'mamago-bf7f1',
    storageBucket: 'mamago-bf7f1.appspot.com',
    iosClientId: '1071416051233-h00mj6g1i64g2janpfufns1frjdqps2a.apps.googleusercontent.com',
    iosBundleId: 'com.example.mamago',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAo6c3BDmyYkTevyDoLtph6waj5hSGhOKw',
    appId: '1:1071416051233:ios:2e045bef425ce802120560',
    messagingSenderId: '1071416051233',
    projectId: 'mamago-bf7f1',
    storageBucket: 'mamago-bf7f1.appspot.com',
    iosClientId: '1071416051233-h00mj6g1i64g2janpfufns1frjdqps2a.apps.googleusercontent.com',
    iosBundleId: 'com.example.mamago',
  );
}
