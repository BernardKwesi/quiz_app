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
    apiKey: 'AIzaSyBFrR1c4N_3TnAfnedud1Gj32ZpYko7eck',
    appId: '1:315410013594:web:fea3de9e72d1c908642e23',
    messagingSenderId: '315410013594',
    projectId: 'quizapp-81f9e',
    authDomain: 'quizapp-81f9e.firebaseapp.com',
    storageBucket: 'quizapp-81f9e.appspot.com',
    measurementId: 'G-THMW1FBLQ1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCN36F5DRFUQiZradDNo__vN9vpTzt19F8',
    appId: '1:315410013594:android:f5a1a2871afa4637642e23',
    messagingSenderId: '315410013594',
    projectId: 'quizapp-81f9e',
    storageBucket: 'quizapp-81f9e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIBvFD16DV-UK8Uil1apWkDsCczS_cjt8',
    appId: '1:315410013594:ios:3c5a5612eb61983e642e23',
    messagingSenderId: '315410013594',
    projectId: 'quizapp-81f9e',
    storageBucket: 'quizapp-81f9e.appspot.com',
    iosClientId: '315410013594-mmhpj7ur76n58tdthhkj3fsr3v0i5ll4.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIBvFD16DV-UK8Uil1apWkDsCczS_cjt8',
    appId: '1:315410013594:ios:3c5a5612eb61983e642e23',
    messagingSenderId: '315410013594',
    projectId: 'quizapp-81f9e',
    storageBucket: 'quizapp-81f9e.appspot.com',
    iosClientId: '315410013594-mmhpj7ur76n58tdthhkj3fsr3v0i5ll4.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizApp',
  );
}
