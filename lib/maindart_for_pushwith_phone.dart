import 'package:flutter/material.dart';
import 'package:radio_app/song_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:radio_app/sliver_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   // await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

void main() async {
  print("ensure you have internet connection");
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //   apiKey: "AIzaSyAKycN8X2vIb8be8qc1hL7cFxuTff7u7mU",
    //   appId: "1:1003888243983:web:e159aa6b79fd22dbbffa7a",
    //   messagingSenderId: "1003888243983",
    //   projectId: "notify-cc847",
    // ),
  );
  // await FirebaseMessaging.instance.subscribeToTopic("AllPushNotifications2");
  // await FirebaseMessaging.instance.subscribeToTopic("AllPushNotifications");
  //  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    MaterialApp(
      theme: ThemeData(//platform: TargetPlatform.iOS,
          ),
      // home: SongPage(),
      home: Notificat(),
    ),
  );
}
