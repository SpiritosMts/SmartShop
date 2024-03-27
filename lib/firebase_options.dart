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
    apiKey: 'AIzaSyBiNJs5XJbWd-sgqM60IasIsRdM2e1IDb0',
    appId: '1:895124965429:web:45a38f848a7b1d0de3c97c',
    messagingSenderId: '895124965429',
    projectId: 'smartshop-c298e',
    authDomain: 'smartshop-c298e.firebaseapp.com',
    storageBucket: 'smartshop-c298e.appspot.com',
    measurementId: 'G-CWWWWJ26CJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTabRP9T0YAgA-JecaiAZrNMfNjn9HjwQ',
    appId: '1:895124965429:android:9bd3b3f2fbf6e41ae3c97c',
    messagingSenderId: '895124965429',
    projectId: 'smartshop-c298e',
    storageBucket: 'smartshop-c298e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFNWDbF-8l7SmFKYsexFbytvBHwG-WGZk',
    appId: '1:895124965429:ios:88e552c95e8358a5e3c97c',
    messagingSenderId: '895124965429',
    projectId: 'smartshop-c298e',
    storageBucket: 'smartshop-c298e.appspot.com',
    iosBundleId: 'com.example.smartshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFNWDbF-8l7SmFKYsexFbytvBHwG-WGZk',
    appId: '1:895124965429:ios:e6f9244b4e84a6b7e3c97c',
    messagingSenderId: '895124965429',
    projectId: 'smartshop-c298e',
    storageBucket: 'smartshop-c298e.appspot.com',
    iosBundleId: 'com.example.smartshop.RunnerTests',
  );
}
