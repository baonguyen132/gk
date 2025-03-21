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
    apiKey: 'AIzaSyCL49nBP6EG-ZBM7oRqN2K1A-dR08Vv6PI',
    appId: '1:717963288675:web:b38e5ca6fb658617281856',
    messagingSenderId: '717963288675',
    projectId: 'fluttergk-cdd11',
    authDomain: 'fluttergk-cdd11.firebaseapp.com',
    storageBucket: 'fluttergk-cdd11.firebasestorage.app',
    measurementId: 'G-QZMQNLLDK8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCa8HmI-aUqQ_qsm7EH9roMvJa_XBf30WY',
    appId: '1:717963288675:android:a29558d8f9f20ada281856',
    messagingSenderId: '717963288675',
    projectId: 'fluttergk-cdd11',
    storageBucket: 'fluttergk-cdd11.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVfTJ8D-ZG_sA6U2dQmQxzg5CmaxI_wIE',
    appId: '1:717963288675:ios:ab345708e87809f0281856',
    messagingSenderId: '717963288675',
    projectId: 'fluttergk-cdd11',
    storageBucket: 'fluttergk-cdd11.firebasestorage.app',
    iosBundleId: 'com.example.gk',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCL49nBP6EG-ZBM7oRqN2K1A-dR08Vv6PI',
    appId: '1:717963288675:web:09f0568d813f1573281856',
    messagingSenderId: '717963288675',
    projectId: 'fluttergk-cdd11',
    authDomain: 'fluttergk-cdd11.firebaseapp.com',
    storageBucket: 'fluttergk-cdd11.firebasestorage.app',
    measurementId: 'G-31QXRL1Q2K',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVfTJ8D-ZG_sA6U2dQmQxzg5CmaxI_wIE',
    appId: '1:717963288675:ios:ab345708e87809f0281856',
    messagingSenderId: '717963288675',
    projectId: 'fluttergk-cdd11',
    storageBucket: 'fluttergk-cdd11.firebasestorage.app',
    iosBundleId: 'com.example.gk',
  );

}