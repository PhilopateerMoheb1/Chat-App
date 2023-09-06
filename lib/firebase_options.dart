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
    apiKey: 'AIzaSyDnVfDwjckL10rx3ZarmCk4BmvrZQidi_c',
    appId: '1:353206215051:web:d0dd57ea7842cc89b58f8e',
    messagingSenderId: '353206215051',
    projectId: 'chat-app-9f84c',
    authDomain: 'chat-app-9f84c.firebaseapp.com',
    storageBucket: 'chat-app-9f84c.appspot.com',
    measurementId: 'G-G0C2BK83T2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0NhX4nXUFHVfXOwA_-M8Z5wFlm0qZSx8',
    appId: '1:353206215051:android:c71a454f507a6eecb58f8e',
    messagingSenderId: '353206215051',
    projectId: 'chat-app-9f84c',
    storageBucket: 'chat-app-9f84c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADJ9nKGVVwGZagbsUB85q-KW75ULQhHvQ',
    appId: '1:353206215051:ios:120a00206f66dda5b58f8e',
    messagingSenderId: '353206215051',
    projectId: 'chat-app-9f84c',
    storageBucket: 'chat-app-9f84c.appspot.com',
    iosClientId: '353206215051-2cgbsbcrjm8skvo8gj8q75eh2rls0f7l.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADJ9nKGVVwGZagbsUB85q-KW75ULQhHvQ',
    appId: '1:353206215051:ios:8af5bde1af2adf73b58f8e',
    messagingSenderId: '353206215051',
    projectId: 'chat-app-9f84c',
    storageBucket: 'chat-app-9f84c.appspot.com',
    iosClientId: '353206215051-vvp80r82ngvf0g901j0lvs9uchd70r72.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
