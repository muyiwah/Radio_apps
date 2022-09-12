// import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:radio_app/common.dart';
import 'package:audio_session/audio_session.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:radio_app/lottiescreen.dart';
import 'package:radio_app/neu_box.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_background/flutter_background.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/services.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:rxdart/rxdart.dart';

class SongPage extends StatefulWidget {
  SongPage({Key? key}) : super(key: key);
  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  // final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool puasePressed = false;
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // initializefirebase();
    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = state == PlayerState.PLAYING;
    //     print(isPlaying);
    //   });
    // });
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await _player.setAudioSource(AudioSource.uri(
        Uri.parse("https://stream.zeno.fm/n88bnx2a0xhvv"),
        tag: MediaItem(
          // Specify a unique ID for each media item:
          id: '1',
          // Metadata to display in the notification:
          album: "Playing",
          title: "Faith Radio",
          artUri: Uri.parse('https://example.com/albumart.jpg'),
        ),
      ));
    } catch (e) {
      // print("Error loading audio source: $e");
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  void dispose() {
    _player.dispose();
    // audioPlayer.dispose();
    super.dispose();
  } // AudioPlayer audioPlayer = AudioPlayer();

  void initializefirebase() async {
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
    await FirebaseMessaging.instance.subscribeToTopic("AllPushNotifications2");
    print("ensure you have internet connection222222222");
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // final androidConfig = FlutterBackgroundAndroidConfig(
    //   notificationTitle: "flutter_background example app",
    //   notificationText:
    //       "Background notification for keeping the example app running in the background",
    //   notificationImportance: AndroidNotificationImportance.Default,
    //   notificationIcon: AndroidResource(
    //       name: 'background_icon',
    //       defType: 'drawable'), // Default is ic_launcher from folder mipmap
    // );
    // bool success =
    //     await FlutterBackground.initialize(androidConfig: androidConfig);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    // await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }

  bool pressed = false;
  int result = 0;
  // String url = "https://stream.zeno.fm/b5519zbazxhvv";
  String url = 'https://stream.zeno.fm/n88bnx2a0xhvv';

  //final functions = FirebaseFunctions.instance;
  // Future send() async {
  //   try {
  //     final result =
  //         await FirebaseFunctions.instance.httpsCallable('addMessage').call();
  //   } on FirebaseFunctionsException catch (error) {
  //     print(error.code);
  //     print(error.details);
  //     print(error.message);
  //   }
  // }

  // Future<void> Notification() async {
  //   await FirebaseMessaging.instance.subscribeToTopic("AllPushNotifications2");
  //   final results =
  //       await FirebaseFunctions.instance.httpsCallable('waterradio').call();

  //   print(results);
  // }

//   void isPlayPressed() async {
//     if (isPlaying == false) {
//       await audioPlayer.play(url);
//       print('playing');
//     } else {
//       await audioPlayer.stop();
//       print('paused');
//     }

//     setState(
//       () {
//         if (pressed == true) {
// //
//           pressed = false;
//           print('pressed');
//         } else {
//           pressed = true;
//           print('norpressed');
//         }
//         // if (pressed == true) {
//         //   pressed = false;
//         //   print(pressed);
//         // }
//       },
//     );
//   }

//   void pausePlay() async {
//     if (isPlaying == false) {
//       await audioPlayer.play(url);
//       print('playing');
//     } else {
//       await audioPlayer.pause();
//       print('paused');
//     }

//     setState(
//       () {
//         if (puasePressed == true) {
// //
//           puasePressed = false;
//           print('pressed');
//         } else {
//           puasePressed = true;
//           print('norpressed');
//         }
//         // if (pressed == true) {
//         //   pressed = false;
//         //   print(pressed);
//         // }
//       },
//     );
//     //initializefirebase();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Container(
            child: Text('Water Radio'),
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Water Radio"),
              accountEmail: Text("Connect with us"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "WR",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook,
                  color: Colors.blue, size: 30),
              title: const Text(
                'Facebook',
              ),
              // image: Image.asset('lib/icons/facebook.png'),
              onTap: () async {
                final Uri url =
                    Uri.parse('https://web.facebook.com/waterradiong');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  FaIcon(FontAwesomeIcons.youtube, color: Colors.red, size: 30),
              title: const Text(
                'Youtube',
              ),
              // image: Image.asset('lib/icons/facebook.png'),
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://www.youtube.com/channel/UCimib4j_ayASl-1jPbFsNyg');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.instagram,
                  color: Colors.red, size: 30),
              title: const Text(
                'Instagram',
              ),
              // image: Image.asset('lib/icons/facebook.png'),
              onTap: () async {
                final Uri url =
                    Uri.parse('https://www.instagram.com/official_waterradio/');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.twitter,
                  color: Colors.blue, size: 30),
              title: const Text(
                'Twitter',
              ),
              // image: Image.asset('lib/icons/facebook.png'),
              onTap: () async {
                final Uri url = Uri.parse('https://twitter.com/waterradio3');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   height: 15,
                // ),
                Column(
                  children: [
                    SizedBox(
                      // height: 300,
                      // width: 300,
                      child: NewBox(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset('lib/icons/waterNew.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Water Radio',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('Service to Humanity'),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 35,
                                    width: 35,
                                    child:
                                        Icon(Icons.favorite, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 35,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(puasePressed ? 'on air' : 'off air'),
                    Icon(Icons.shuffle),
                    Icon(Icons.repeat),
                    LottieScreen(),
                    Text('0:00'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ControlButtons(_player),

                // SizedBox(
                //   height: 80,
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 1,
                //         child: GestureDetector(
                //           // onTap: Notification,
                //           // onTap: pausePlay,
                //           child: AnimatedContainer(
                //             duration: Duration(milliseconds: 200),
                //             height: 120.0,
                //             padding: EdgeInsets.all(20),
                //             // child: Center(child: child),const FaIcon(FontAwesomeIcons.twitter  ,color: Colors.blue,),
                //             child: Icon(!puasePressed
                //                 ? Icons.play_disabled
                //                 : Icons.pause),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(12),
                //               color: Colors.grey[300],
                //               boxShadow: puasePressed
                //                   ? []
                //                   : [
                //                       BoxShadow(
                //                         color: Colors.grey.shade500,
                //                         blurRadius: 15,
                //                         offset: Offset(5, 5),
                //                       ),
                //                       BoxShadow(
                //                         color: Colors.white,
                //                         blurRadius: 15,
                //                         offset: Offset(-5, -5),
                //                       ),
                //                     ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       // Expanded(
                //       //   flex: 2,
                //       //   child: GestureDetector(
                //       //     onTap: isPlayPressed,
                //       //     child: Container(
                //       //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //       //       child: NewBox(
                //       //         child: Icon(Icons.play_arrow),
                //       //       ),
                //       //     ),
                //       //   ),
                //       // ),
                //       Expanded(
                //         flex: 2,
                //         child: GestureDetector(
                //           // onTap: isPlayPressed,
                //           child: AnimatedContainer(
                //             duration: Duration(milliseconds: 200),
                //             height: 120.0,
                //             padding: EdgeInsets.all(20),
                //             // child: Center(child: child),
                //             child:
                //                 Icon(!pressed ? Icons.play_arrow : Icons.stop),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(12),
                //               color: Colors.grey[300],
                //               boxShadow: pressed
                //                   ? []
                //                   : [
                //                       BoxShadow(
                //                         color: Colors.grey.shade500,
                //                         blurRadius: 15,
                //                         offset: Offset(5, 5),
                //                       ),
                //                       BoxShadow(
                //                         color: Colors.white,
                //                         blurRadius: 15,
                //                         offset: Offset(-5, -5),
                //                       ),
                //                     ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       ControlButtons(_player),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // IconButton(
        //   icon: const Icon(Icons.volume_up),
        //   onPressed: () {
        //     showSliderDialog(
        //       context: context,
        //       title: "Radio volume",
        //       divisions: 10,
        //       min: 0.0,
        //       max: 1.0,
        //       value: player.volume,
        //       stream: player.volumeStream,
        //       onChanged: player.setVolume,
        //     );
        //   },
        // ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(
                  color: Color.fromRGBO(108, 184, 186, 1),
                ),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.pause, color: Colors.white),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            }
          },
        ),
      ],
    );
  }
}
