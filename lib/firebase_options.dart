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

  static  FirebaseOptions web = const FirebaseOptions(
    apiKey: 'AIzaSyDRDYCLVj65GXwW8PvXK4XaWDBQinD7QrE',
    appId: '1:632782333965:web:2a014c444b9e353ea00d44',
    messagingSenderId: '632782333965',
    projectId: 'ngccjcc',
    authDomain: 'ngccjcc.firebaseapp.com',
    storageBucket: 'ngccjcc.appspot.com',
  );

  static  FirebaseOptions android = const FirebaseOptions(
    apiKey: 'AIzaSyARjJ21sw6VNyV72F1xYDJvW4-daTR-wdU',
    appId: '1:632782333965:android:01e7b84ad6fe451ca00d44',
    messagingSenderId: '632782333965',
    projectId: 'ngccjcc',
    storageBucket: 'ngccjcc.appspot.com',
  );

  static  FirebaseOptions ios = const FirebaseOptions(
    apiKey: 'AIzaSyCxuDQ_-BZSVJ7RMKUfwjZTz7ybIcSqSOM',
    appId: '1:632782333965:ios:a80d294bd8d478c3a00d44',
    messagingSenderId: '632782333965',
    projectId: 'ngccjcc',
    storageBucket: 'ngccjcc.appspot.com',
    iosClientId: '632782333965-k702ncu0e0b01e3jvqh8esvavcso8m5u.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelbooking',
  );

  static  FirebaseOptions macos = const FirebaseOptions(
    apiKey: 'AIzaSyCxuDQ_-BZSVJ7RMKUfwjZTz7ybIcSqSOM',
    appId: '1:632782333965:ios:b1bf4ce22c1944f7a00d44',
    messagingSenderId: '632782333965',
    projectId: 'ngccjcc',
    storageBucket: 'ngccjcc.appspot.com',
    iosClientId: '632782333965-ntnfi1ldo40botn1jtuqgk8k9hs4q1vi.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelbooking.RunnerTests',
  );
}