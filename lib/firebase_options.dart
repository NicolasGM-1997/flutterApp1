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
/// 
/// 
/// 
/// uuuuuuu
const String firebaseUrl = "https://parcial-3-corte-default-rtdb.firebaseio.com/";
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
        return windows;
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
    apiKey: 'AIzaSyDatcgqmCKD-Zsyt74Md8TTAaFlDKsp1F0',
    appId: '1:193648636894:web:27a164138e5271486d234f',
    messagingSenderId: '193648636894',
    projectId: 'parcial-3-corte',
    authDomain: 'parcial-3-corte.firebaseapp.com',
    storageBucket: 'parcial-3-corte.appspot.com',
    measurementId: 'G-FEM2T6YLTG',
    databaseURL: firebaseUrl,
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsR-5C4sEyexwf_tS34zVEPvz7ttqZm0I',
    appId: '1:193648636894:android:291acf1f41cbad896d234f',
    messagingSenderId: '193648636894',
    projectId: 'parcial-3-corte',
    storageBucket: 'parcial-3-corte.appspot.com',
    databaseURL: firebaseUrl,
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCITQXf2pLEKcKp_7bs0CRp8t8QZ-qYPg',
    appId: '1:193648636894:ios:c0616bcd6be65f556d234f',
    messagingSenderId: '193648636894',
    projectId: 'parcial-3-corte',
    storageBucket: 'parcial-3-corte.appspot.com',
    iosBundleId: 'com.example.parcial',
    databaseURL: firebaseUrl,
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCITQXf2pLEKcKp_7bs0CRp8t8QZ-qYPg',
    appId: '1:193648636894:ios:c0616bcd6be65f556d234f',
    messagingSenderId: '193648636894',
    projectId: 'parcial-3-corte',
    storageBucket: 'parcial-3-corte.appspot.com',
    iosBundleId: 'com.example.parcial',
    databaseURL: firebaseUrl,
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDatcgqmCKD-Zsyt74Md8TTAaFlDKsp1F0',
    appId: '1:193648636894:web:529a955a65e47ced6d234f',
    messagingSenderId: '193648636894',
    projectId: 'parcial-3-corte',
    authDomain: 'parcial-3-corte.firebaseapp.com',
    storageBucket: 'parcial-3-corte.appspot.com',
    measurementId: 'G-D4X3Y2GK4T',
    databaseURL: firebaseUrl,
  );
}
