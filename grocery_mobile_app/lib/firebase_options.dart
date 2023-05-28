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
    apiKey: 'AIzaSyB3PaCN7e471hh3p3iPHcdNXDHlZ4mX5hg',
    appId: '1:320500357925:web:42f811167149450bc318cc',
    messagingSenderId: '320500357925',
    projectId: 'grocery-be3a1',
    authDomain: 'grocery-be3a1.firebaseapp.com',
    storageBucket: 'grocery-be3a1.appspot.com',
    measurementId: 'G-DJ9WH7EW3D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmUQLyByRuJ8nZl1ilPx4OPT56_b_bKJA',
    appId: '1:320500357925:android:d6601b0dab3ff916c318cc',
    messagingSenderId: '320500357925',
    projectId: 'grocery-be3a1',
    storageBucket: 'grocery-be3a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEAsDoLP7olopfn-2CGjHh5PbywjgEa1U',
    appId: '1:320500357925:ios:53b194d521683ff7c318cc',
    messagingSenderId: '320500357925',
    projectId: 'grocery-be3a1',
    storageBucket: 'grocery-be3a1.appspot.com',
    androidClientId: '320500357925-4bedkv7dbv714u606eta3h3fes4inbvq.apps.googleusercontent.com',
    iosClientId: '320500357925-ob1vj6lpi3qjdcakqrvasnhos8f25g9u.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEAsDoLP7olopfn-2CGjHh5PbywjgEa1U',
    appId: '1:320500357925:ios:df1a629cd710fb70c318cc',
    messagingSenderId: '320500357925',
    projectId: 'grocery-be3a1',
    storageBucket: 'grocery-be3a1.appspot.com',
    androidClientId: '320500357925-4bedkv7dbv714u606eta3h3fes4inbvq.apps.googleusercontent.com',
    iosClientId: '320500357925-0go21h2s0ic4f3j9baog5ka9b3u1qv7k.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceryMobileApp',
  );
}
