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
    apiKey: 'AIzaSyCTu6GSaTA2pd8xSxU7fjEj4pyk8OGNJ9A',
    appId: '1:940540882171:web:d3f21c1394c7033f46145e',
    messagingSenderId: '940540882171',
    projectId: 'gradus-eb308',
    authDomain: 'gradus-eb308.firebaseapp.com',
    storageBucket: 'gradus-eb308.appspot.com',
    measurementId: 'G-RQTYPY3C7Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAY3Yy8jX0BW9WbLTmhtoN2vx4kHUy-EqY',
    appId: '1:940540882171:android:1a5233b7ec8ca61746145e',
    messagingSenderId: '940540882171',
    projectId: 'gradus-eb308',
    storageBucket: 'gradus-eb308.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIha2ilrZxw0g4SoIhkp1fsaf2SO2KXnc',
    appId: '1:940540882171:ios:860e0f1a0e57160346145e',
    messagingSenderId: '940540882171',
    projectId: 'gradus-eb308',
    storageBucket: 'gradus-eb308.appspot.com',
    iosClientId: '940540882171-l4rnsqvbiuerf5al7o56nlbn62jjtfi1.apps.googleusercontent.com',
    iosBundleId: 'ua.com.gradusapp.gradus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIha2ilrZxw0g4SoIhkp1fsaf2SO2KXnc',
    appId: '1:940540882171:ios:c1cffd6149e04e7246145e',
    messagingSenderId: '940540882171',
    projectId: 'gradus-eb308',
    storageBucket: 'gradus-eb308.appspot.com',
    iosClientId: '940540882171-i96eftsne40imh9brjvcn0atqtnjr732.apps.googleusercontent.com',
    iosBundleId: 'ua.com.gradusapp.gradus.RunnerTests',
  );
}