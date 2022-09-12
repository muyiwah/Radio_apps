import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:radio_app/lottiescreen.dart';
// import 'package:flutter_background/flutter_background.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
// final androidConfig = FlutterBackgroundAndroidConfig (
//     notificationTitle: "flutter_background example app",
//     notificationText: "Background notification for keeping the example app running in the background",
//     notificationImportance: AndroidNotificationImportance.Default,
//     notificationIcon: AndroidResource(name: 'background_icon', defType: 'drawable'), // Default is ic_launcher from folder mipmap
// );
//  bool success = await FlutterBackground.initialize(androidConfig: androidConfig);
  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
        print(isPlaying);
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  int result = 0;
  String url = "https://stream.zeno.fm/b5519zbazxhvv";
  // String url =
  //     "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3";
  // "h";
  // Fututtps://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3re<void> _onSearchButtonPressed() async {
  //   if (result == 0) {
  //     result = await audioPlayer.play(url);
  //     print(result);
  //   } else if (result == 1) {
  //     result = await audioPlayer.pause();
  //     print(result);
  //     result = 0;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 47, 10, 111),
        backgroundColor: Color.fromARGB(255, 51, 10, 120),
        body: SafeArea(
          minimum: EdgeInsets.all(4),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('lib/icons/water1.jpg'),
              ),
              SizedBox(height: 15),
              Text(
                'On Air',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 33, 155, 57)),
              ),
              Text(
                'Service to humanity',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              LottieScreen(),
              AvatarGlow(
                child: GestureDetector(
                  onTap: () async {
                    if (isPlaying == false) {
                      await audioPlayer.play(url);
                    } else {
                      await audioPlayer.pause();
                    }
                    //  await _onSearchButtonPressed();
                  },
                  child: CircleAvatar(
                      child: Image.asset(
                        isPlaying
                            ? 'lib/icons/stop-button.png'
                            : 'lib/icons/play.png',
                        fit: BoxFit.fill,
                      ),
                      radius: 35),
                ),
                // child: IconButton(
                //   icon: Icon(
                //     isPlaying ? Icons.pause : Icons.play_arrow_sharp,
                //     size: 52,
                //     color: Colors.white,
                //   ),
                //   onPressed: () async {
                //     if (isPlaying == false) {
                //       await audioPlayer.play(url);
                //     } else {
                //       await audioPlayer.pause();
                //     }
                //     //  await _onSearchButtonPressed();
                //   },
                // ),
                endRadius: 100,
                glowColor: isPlaying
                    ? Color.fromARGB(255, 64, 255, 67)
                    : Color.fromARGB(255, 43, 75, 188),
                duration: isPlaying
                    ? Duration(
                        milliseconds: 1000,
                      )
                    : Duration(
                        milliseconds: 2000,
                      ),
                repeatPauseDuration: isPlaying
                    ? Duration(milliseconds: 400)
                    : Duration(milliseconds: 100),
              ),
              // LikeButton(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // child: Text('clik me'),
          child: Icon(
            Icons.arrow_forward_outlined,
          ),
          backgroundColor: Colors.deepPurple,
          onPressed: (() {
            Navigator.pushNamed(context, '/settings');
          }),
        )
        // bottomNavigationBar: CurvedNavigationBar(
        //   height: 40,
        //   backgroundColor: Color.fromARGB(255, 51, 10, 120),
        //   animationDuration: Duration(milliseconds: 300),
        //   color: Color.fromARGB(255, 51, 10, 120),
        //   onTap: (index) {
        //     print(index);
        //     if (index == 2) {
        //       Navigator.pushReplacementNamed(context, '/home_page');
        //     } else if (index == 0) {
        //       Navigator.pushNamed(context, '/settings');
        //     } else if (index == 1) {}
        //   },
        //   items: [
        //     // Icon(
        //     //   Icons.home,
        //     //   size: 30,
        //     // ),
        //     // Icon(
        //     //   Icons.home,
        //     //   size: 30,
        //     // ),
        //     // LikeButton(
        //     //   size: 30,
        //     // ),
        //     Icon(
        //       Icons.settings,
        //       size: 30,
        //       color: Colors.white,
        //     ),
        //   ],
        // ),
        );
  }
}
