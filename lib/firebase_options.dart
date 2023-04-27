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
    apiKey: 'AIzaSyC9Gizl_BxvYbuS9Ji3i_SXHqyyMvV44n4',
    appId: '1:809045701603:web:790b77b88d34abbfde66d6',
    messagingSenderId: '809045701603',
    projectId: 'sira-project-7685f',
    authDomain: 'sira-project-7685f.firebaseapp.com',
    storageBucket: 'sira-project-7685f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEsFG6-sT9ZEcsZfdQa6Sk72IDmLgoBIA',
    appId: '1:809045701603:android:bd4fbb73dfe541f8de66d6',
    messagingSenderId: '809045701603',
    projectId: 'sira-project-7685f',
    storageBucket: 'sira-project-7685f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPfrFCooPx5kOYTYwfCok968zlKRqZAA0',
    appId: '1:809045701603:ios:0831b000e1c1a0d8de66d6',
    messagingSenderId: '809045701603',
    projectId: 'sira-project-7685f',
    storageBucket: 'sira-project-7685f.appspot.com',
    iosClientId: '809045701603-urdfs5qbd6oo5q2lfdliqqle8u5c65n1.apps.googleusercontent.com',
    iosBundleId: 'com.example.sira',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPfrFCooPx5kOYTYwfCok968zlKRqZAA0',
    appId: '1:809045701603:ios:0831b000e1c1a0d8de66d6',
    messagingSenderId: '809045701603',
    projectId: 'sira-project-7685f',
    storageBucket: 'sira-project-7685f.appspot.com',
    iosClientId: '809045701603-urdfs5qbd6oo5q2lfdliqqle8u5c65n1.apps.googleusercontent.com',
    iosBundleId: 'com.example.sira',
  );
}
