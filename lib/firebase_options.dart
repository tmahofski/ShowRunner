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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
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
    apiKey: 'AIzaSyDm_FNXJf52deU98OXT1oADF9u90rNITsU',
    appId: '1:884607479726:web:b9ff2c15a1d03bf651223f',
    messagingSenderId: '884607479726',
    projectId: 'show-runner-b7e70',
    authDomain: 'show-runner-b7e70.firebaseapp.com',
    storageBucket: 'show-runner-b7e70.appspot.com',
    measurementId: 'G-V0EEESB5B0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAS5qHBoyKwSPoq-UX2aAtluNF8B7IUAMk',
    appId: '1:884607479726:android:ea2c30cb8a19478851223f',
    messagingSenderId: '884607479726',
    projectId: 'show-runner-b7e70',
    storageBucket: 'show-runner-b7e70.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwT5Cb_o0Mmp1HH-J74ytXn0tty88EN-Y',
    appId: '1:884607479726:ios:3cbebe0a729d056f51223f',
    messagingSenderId: '884607479726',
    projectId: 'show-runner-b7e70',
    storageBucket: 'show-runner-b7e70.appspot.com',
    iosClientId:
        '884607479726-uflk4tucha6resh58r6iah79k3mudejq.apps.googleusercontent.com',
    iosBundleId: 'com.example.showRunner',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwT5Cb_o0Mmp1HH-J74ytXn0tty88EN-Y',
    appId: '1:884607479726:ios:3cbebe0a729d056f51223f',
    messagingSenderId: '884607479726',
    projectId: 'show-runner-b7e70',
    storageBucket: 'show-runner-b7e70.appspot.com',
    iosClientId:
        '884607479726-uflk4tucha6resh58r6iah79k3mudejq.apps.googleusercontent.com',
    iosBundleId: 'com.example.showRunner',
  );
}
