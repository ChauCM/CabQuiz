// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBTzJEn5jbqR5oOxP9FwyBTnZ18M0F4lBo',
    appId: '1:795410787224:web:ebad58d99e94076f3dd9ed',
    messagingSenderId: '795410787224',
    projectId: 'cabquiz-15446',
    authDomain: 'cabquiz-15446.firebaseapp.com',
    storageBucket: 'cabquiz-15446.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZdZ4_bILdDEFj4w3lJTLLy_jlSq7_uiA',
    appId: '1:795410787224:android:efb24a927becd16d3dd9ed',
    messagingSenderId: '795410787224',
    projectId: 'cabquiz-15446',
    storageBucket: 'cabquiz-15446.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBU_M7v4E81-7LK5fHkXBQtrW1YbVVeHks',
    appId: '1:795410787224:ios:37da70c3a8b0a4b33dd9ed',
    messagingSenderId: '795410787224',
    projectId: 'cabquiz-15446',
    storageBucket: 'cabquiz-15446.appspot.com',
    iosBundleId: 'com.example.cabquiz',
  );
}
