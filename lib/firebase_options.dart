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
    apiKey: 'AIzaSyDbzMlbDiOZiEDmB8Lq_7hNzz_g-s2A1d8',
    appId: '1:1057443220148:web:37f6a07e5d3907930ce5e1',
    messagingSenderId: '1057443220148',
    projectId: 'maxhr1',
    authDomain: 'maxhr1.firebaseapp.com',
    storageBucket: 'maxhr1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMpCiV1wKPbq0XDsF8edhSLqh0ZsPkoiw',
    appId: '1:1057443220148:android:9cb9543cf5d80ce10ce5e1',
    messagingSenderId: '1057443220148',
    projectId: 'maxhr1',
    storageBucket: 'maxhr1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0OFS0FkaoshUCE6q1rB5Tb8Qc1kCNN1s',
    appId: '1:1057443220148:ios:913c76c5e42f68f90ce5e1',
    messagingSenderId: '1057443220148',
    projectId: 'maxhr1',
    storageBucket: 'maxhr1.firebasestorage.app',
    iosBundleId: 'com.example.app1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0OFS0FkaoshUCE6q1rB5Tb8Qc1kCNN1s',
    appId: '1:1057443220148:ios:913c76c5e42f68f90ce5e1',
    messagingSenderId: '1057443220148',
    projectId: 'maxhr1',
    storageBucket: 'maxhr1.firebasestorage.app',
    iosBundleId: 'com.example.app1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDbzMlbDiOZiEDmB8Lq_7hNzz_g-s2A1d8',
    appId: '1:1057443220148:web:01951e14f28399430ce5e1',
    messagingSenderId: '1057443220148',
    projectId: 'maxhr1',
    authDomain: 'maxhr1.firebaseapp.com',
    storageBucket: 'maxhr1.firebasestorage.app',
  );
}
