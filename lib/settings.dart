import 'package:flutter/material.dart';
import 'package:radio_app/bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  final bool pressed = false;
  const Details({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Settings'),
      ),
      backgroundColor: Color.fromARGB(255, 51, 10, 120),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Connect with us', style: TextStyle(color: Colors.white)),
            // SizedBox(
            //   height: 10,
            // ),
            GestureDetector(
              onTap: () async {
                final Uri url =
                    Uri.parse('https://web.facebook.com/waterradiong');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Bar(
                img: 'lib/icons/facebook.png',
                title: 'Facebook',
                subTitle: 'Water Radio',
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Bar(
              img: 'lib/icons/twitter.png',
              title: 'Twitter',
              subTitle: 'Water Radio',
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Bar(
              img: 'lib/icons/instagram.png',
              title: 'Instagram',
              subTitle: 'Water Radio',
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Bar(
              img: 'lib/icons/youtube.png',
              title: 'Youtube',
              subTitle: 'Water Radio',
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Water Radio',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(' Version 1.0', style: TextStyle(color: Colors.white)),
                // CurvedNavigationBar(
                //   backgroundColor: Colors.deepPurple,
                //   animationDuration: Duration(milliseconds: 300),
                //   onTap: (index) {
                //     print(index);
                //     if (index == 0) {
                //       Navigator.pushReplacementNamed(context, '/home_page');
                //     } else if (index == 2) {
                //       Navigator.pushNamed(context, '/settings');
                //     }
                //   },
                //   items: [
                //     Icon(
                //       Icons.home,
                //     ),
                //     // LikeButton(
                //     //   size: 40,
                //     // ),
                //     Icon(Icons.settings),
                //   ],
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
